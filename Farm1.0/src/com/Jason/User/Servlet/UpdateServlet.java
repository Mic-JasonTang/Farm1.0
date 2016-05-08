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

public class UpdateServlet extends HttpServlet {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	// 更新手机号
	public boolean UpdatePhone(String phoneNum, String username) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "update user set phone = ? where username = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, phoneNum);
			pstmt.setString(2, username);
			// executeUpdate返回0，表示执行失败，执行成功则返回行数.
			bool = pstmt.executeUpdate() == 0 ? false : true;
		} catch (SQLException e) {
			System.out.println("update.jsp---->在更新手机号时出错");
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return bool;
	}

	// 更新收货地址
	public boolean UpdateAddress(String address, String username) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "update user set address = ? where username = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, address);
			pstmt.setString(2, username);
			// executeUpdate返回0，表示执行失败，执行成功则返回行数.
			bool = pstmt.executeUpdate() == 0 ? false : true;
		} catch (SQLException e) {
			System.out.println("update.jsp---->在更新收货地址时出错");
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return bool;
	}

	// 更新Email
	public boolean UpdateEmail(String Email, String username) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "update user set email = ? where username = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, Email);
			pstmt.setString(2, username);
			// executeUpdate返回0，表示执行失败，执行成功则返回行数.
			bool = pstmt.executeUpdate() == 0 ? false : true;
		} catch (SQLException e) {
			System.out.println("update.jsp---->在更新邮箱时出错");
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return bool;
	}

	// 更新密码
	public boolean UpdatePassword(String password, String username) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "update user set password = ? where username = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, password);
			pstmt.setString(2, username);
			// executeUpdate返回0，表示执行失败，执行成功则返回行数.
			bool = pstmt.executeUpdate() == 0 ? false : true;
		} catch (SQLException e) {
			System.out.println("update.jsp---->在更新密码时出错");
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return bool;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String username = (String) request.getSession()
				.getAttribute("username");
		String phoneNum = request.getParameter("phoneNum").trim();
		String address = request.getParameter("address").trim();
		String email = request.getParameter("email").trim();
		String password_again = request.getParameter("password_again").trim();
		if (username != null && username != "") {
			if (phoneNum != null && phoneNum != "") {
				UpdatePhone(phoneNum, username);
			}
			if (address != null && address != "") {
				UpdateAddress(address, username);
			}
			if (email != null & email != "") {
				UpdateEmail(email, username);
			}
			if (password_again != null && password_again != "") {
				UpdatePassword(password_again, username);
			}
			request.getSession().setAttribute("UpdateInfo", "修改成功");
			response.sendRedirect(request.getContextPath() + "/update.jsp");
		} else { //表示登录失效，需要重写登录
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}

}
