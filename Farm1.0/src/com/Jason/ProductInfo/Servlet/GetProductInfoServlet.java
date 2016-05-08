package com.Jason.ProductInfo.Servlet;

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

public class GetProductInfoServlet extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//�����ݿ��в�ѯ����Ӧ����Ƭ��Ϣ��������Ϣ
	//������Ʒid����Ʒ����
	public boolean getImageInfo(String productId, String productClass) {
		boolean isSuccess = false;
		conn = DB.getConn();
		String sql = "select * from images where productId = ? and productClass = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, productId);
			pstmt.setString(2, productClass);
			isSuccess = pstmt.executeUpdate() == 0 ? false : true;
		} catch (SQLException e) {
			System.out.println("��ȡ��Ʒ��Ƭ��Ϣʱ -----> ����Ԥ����������");
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	}

}
