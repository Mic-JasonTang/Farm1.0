package com.Jason.ProductInfo.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Jason.DAO.DB;

public class GetImageInfoServlet extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	private List<Image> images = new ArrayList<Image>();
	
	// �����ݿ��в�ѯ����Ӧ����Ƭ��Ϣ��������Ϣ
	// ������Ʒid����Ʒ����
	public Image getImageInfo(String productId, String productClass) {
		Image image = null;
		conn = DB.getConn();
		String sql = "select * from images where productId = ? and productClass = ?";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, productId);
			pstmt.setString(2, productClass);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = String.valueOf(rs.getInt("id"));
				String guidFileName = rs.getString("guidFileName");
				String realFileName = rs.getString("realFileName");
				String relativePath = rs.getString("relativePath");
				String date = rs.getString("date");
				image = new Image(id, productId, productClass, guidFileName,
						realFileName, relativePath, date);
//����ȡ������Ϣ���д�ӡ�����
//System.out.println("�����ݿ��ȡ����Ƭ��Ϣ���£�\n guidFileName = " + guidFileName + "\n realFileName = " + realFileName + "\n relativePath = " + relativePath);
			}
		} catch (SQLException e) {
			System.out.println("��ȡ��Ʒ��Ƭ��Ϣʱ -----> ����Ԥ����������");
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		}
		return image;
	}
	//������е�ͼƬ��Ϣ
	public Image getAllImageInfo() {
		Image image = null;
		conn = DB.getConn();
		String sql = "select * from images";
		stmt = DB.createStmt(conn);
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String id = String.valueOf(rs.getInt("id"));
				String productId = rs.getString("productId");
				String productClass = rs.getString("productClass");
				String guidFileName = rs.getString("guidFileName");
				String realFileName = rs.getString("realFileName");
				String relativePath = rs.getString("relativePath");
				String date = rs.getString("date");
				image = new Image(id, productId, productClass, guidFileName,
						realFileName, relativePath, date);
				images.add(image);
//����ȡ������Ϣ���д�ӡ�����
//System.out.println("�����ݿ��ȡ���е���Ƭ��Ϣ���£�\n guidFileName = " + guidFileName + "\n realFileName = " + realFileName + "\n relativePath = " + relativePath);
			}
		} catch (SQLException e) {
			System.out.println("��ȡ������Ʒ��Ƭ��Ϣʱ -----> ����Ԥ����������");
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		}
		return image;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String productId = (String) session.getAttribute("productId");
		String productClass = (String) session.getAttribute("productClass");
//		System.out.println("GetProductInfoServlet --- > ��ȡ������Ϣ�� " + productId + "----> " + productClass);
		Image image = null;
		if(productId != null || productClass != null) {
			image = getImageInfo(productId, productClass);
			images.add(image);
		} else {
			getAllImageInfo();
		}
		Collections.reverse(images);
		session.setAttribute("images", images);
		response.sendRedirect(request.getContextPath() + "/servlet/GetLandInfoServlet");
	}

}
