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

public class RegisterServlet extends HttpServlet {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	//注册
	public boolean register (String username, String password, String phone_number, String email, String address) {
		boolean isSuccess = false;
		//如果用户名不存在
		if(!isUsernameExist(username)){ 
			conn = DB.getConn();
			String sql = "insert into user values(null,?,?,?,?,?,now())";
			pstmt = DB.createPstmt(conn, sql);
			try {
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				pstmt.setString(3, phone_number);
				pstmt.setString(4, email);
				pstmt.setString(5, address);
				//如果返回不是0就表示注册成功
				isSuccess = pstmt.executeUpdate() != 0 ? true : false;
			} catch (SQLException e) {
				System.out.println("注册账户时,出错了");
				e.printStackTrace();
			} finally {
				DB.close(rs);
				DB.close(pstmt);
				DB.close(conn);
			}
		}
		return isSuccess;
	}
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
		String password = request.getParameter("password");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		boolean isSuccess = register(username, password, phone_number, email, address);
		if(isSuccess) {
			//如果注册成功就自动登陆
//			request.getSession().setAttribute("registerSuccess", "注册成功");
			request.getRequestDispatcher("/servlet/LoginServlet?username=" + 
					username + "&password=" + password).forward(request, response);
		} else {
			// 注册失败
			request.getSession().setAttribute("registerFaild", "注册失败");
			response.sendRedirect(request.getContextPath() + "/register.jsp");
		}
		
	}

}
