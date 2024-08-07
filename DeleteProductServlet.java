package org.jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/deleteproduct")
public class DeleteProductServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id= Integer.valueOf(req.getParameter("id"));
		
		Connection con=null;
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emart","root","root");
			ps=con.prepareStatement("delete from product where id=?");
			ps.setInt(1,id);
			int row=ps.executeUpdate();
			
			
			ps=con.prepareStatement("select * from product");
			rs=ps.executeQuery();
			PrintWriter pw = resp.getWriter();
			pw.write("<html><body><h1 style='color:red; text-align:center'>Product No: "  + id +" is deleted successfully</h1></body></html>");
			req.setAttribute("rs", rs);
			RequestDispatcher rd = req.getRequestDispatcher("allproducts.jsp");
			rd.include(req, resp);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			if(rs!=null) 
			{
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps!=null)
			{
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null)
			{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

}
