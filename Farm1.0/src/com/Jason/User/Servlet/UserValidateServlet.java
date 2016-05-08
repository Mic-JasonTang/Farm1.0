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

import com.Jason.DAO.DB;
public class UserValidateServlet extends HttpServlet {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	//在注册的时候验证用户名是否存在
	public static boolean isUsernameExist(String username) {
		boolean isExist = false;
		conn = DB.getConn();
		String sql = "select * from user where username= ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("用户名存在：在数据库中查询到的用户名：" + rs.getString("username"));
				isExist = true;
			}
		} catch (SQLException e) {
			System.out.println("用户名:" + username +" 验证过程中出现错误");
			e.printStackTrace();
		} finally{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		}
		return isExist;
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
//		System.out.println("username = " + username);
		if(isUsernameExist(username)) {
			out.write("<font color='red'>用户名已存在</font>");
		} else {
			out.write("<font color='green'>用户名可用</font>");
		}
	}
}
