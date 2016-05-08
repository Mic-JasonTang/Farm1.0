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
import javax.servlet.http.HttpSession;

import com.Jason.DAO.DB;

public class GetProductInfoServlet extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// �����ݿ��в�ѯ����Ӧ����Ƭ��Ϣ��������Ϣ
	// ������Ʒid����Ʒ����
	public Images getImageInfo(String productId, String productClass) {
		Images image = null;
		conn = DB.getConn();
		String sql = "select * from images where productId = ? and productClass = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, productId);
			pstmt.setString(2, productClass);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String guidFileName = rs.getString("guidFileName");
				String realFileName = rs.getString("realFileName");
				String storeDir = rs.getString("storeDir");
				String date = rs.getString("date");
				image = new Images(productId, productClass, guidFileName,
						realFileName, storeDir, date);
				System.out.println("�����ݿ��ȡ����Ƭ��Ϣ���£�guidFileName = " + guidFileName + "realFileName = " + realFileName + "storeDir = " + storeDir);
			}
		} catch (SQLException e) {
			System.out.println("��ȡ��Ʒ��Ƭ��Ϣʱ -----> ����Ԥ����������");
			e.printStackTrace();
		}
		return image;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String productId = (String) session.getAttribute("productId");
		String productClass = (String) session.getAttribute("productClass");
	}

}
