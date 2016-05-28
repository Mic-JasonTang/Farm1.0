package com.Jason.User.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.Jason.DAO.DB;

public class LoginServlet extends HttpServlet {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private static Logger logger = LogManager.getLogger();
	// 在登陆的时候验证用户名和密码是否正确
	// 登录成功返回userID
	public static String validateUsernamePwd(String username, String password) {
		String userID = "";
		conn = DB.getConn();
		String sql = "select * from user where username= ? and password = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userID = String.valueOf(rs.getInt("id"));
//				System.out.println("验证成功：在数据库中查询到的用户名：" + rs.getString("username"));
//				System.out.println("验证成功：在数据库中查询到的密码：" + rs.getString("password"));
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
		return userID;
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
//		System.out.println("username = " + username + "    password = "
//				+ password);
		String userID = validateUsernamePwd(username, password); //登录成功返回一个userID，否则返回空串
		System.out.println("LoginServlet —————> userID = " + userID);
		if(userID != "") {
			request.getSession().setAttribute("userID", userID);
			request.getSession().setAttribute("username", username);
			request.getSession().removeAttribute("loginInfo");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			logger.info("[登录消息 ]  userId : " + userID + ", username : " + username
					+ ", 时间  : " + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()) + ", ip : " + request.getRemoteAddr());
		} else {
			request.getSession().setAttribute("loginInfo", "用户名或密码错误");
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}

}
