package com.Jason.User.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.Jason.DAO.DB;

public class LoginServlet extends HttpServlet {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	// 在登陆的时候验证用户名和密码是否正确
	public static boolean validateUsernamePwd(String username, String password) {
		boolean isTrue = false;
		conn = DB.getConn();
		String sql = "select * from user where username= ? and password = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("验证成功：在数据库中查询到的用户名：" + rs.getString("username"));
				System.out.println("验证成功：在数据库中查询到的密码：" + rs.getString("password"));
				isTrue = true;
			}
		} catch (SQLException e) {
			System.out.println("用户名:" + username + "---密码:" + password
					+ " 验证过程中出现错误");
			e.printStackTrace();
		} finally{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		}
		return isTrue;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().write("登陆失败");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username = " + username + "    password = "
				+ password);
		if(validateUsernamePwd(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().removeAttribute("loginInfo");
			response.sendRedirect("/Farm1.0/index.jsp");
		} else {
			request.getSession().setAttribute("loginInfo", "用户名或密码错误");
			response.sendRedirect("/Farm1.0/login.jsp");
		}
	}

}
