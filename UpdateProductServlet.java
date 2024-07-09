package org.jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/update")
public class UpdateProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		String brand = req.getParameter("brand");
		String desc = req.getParameter("desc");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emart","root","root");
			PreparedStatement ps = con.prepareStatement("select * from product where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ps = con.prepareStatement("update product set name=? , price = ? , brand=? , description= ? where id =?");
				ps.setString(1, name);
				ps.setDouble(2, price);
				ps.setString(3, brand);
				ps.setString(4, desc);
				ps.setInt(5, id);
				ps.executeUpdate();
			}
			ps = con.prepareStatement("select * from product");
			rs = ps.executeQuery();
			req.setAttribute("rs", rs);
			req.getRequestDispatcher("allproducts.jsp").forward(req, resp);
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
