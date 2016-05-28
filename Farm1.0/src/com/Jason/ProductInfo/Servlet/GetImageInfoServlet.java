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
	
	// 从数据库中查询出对应的照片信息和描述信息
	// 根据商品id和商品类型
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
//将获取到的信息进行打印输出。
//System.out.println("从数据库获取的照片信息如下：\n guidFileName = " + guidFileName + "\n realFileName = " + realFileName + "\n relativePath = " + relativePath);
			}
		} catch (SQLException e) {
			System.out.println("获取商品照片信息时 -----> 设置预处理语句出错");
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		}
		return image;
	}
	//获得所有的图片信息
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
//将获取到的信息进行打印输出。
//System.out.println("从数据库获取所有的照片信息如下：\n guidFileName = " + guidFileName + "\n realFileName = " + realFileName + "\n relativePath = " + relativePath);
			}
		} catch (SQLException e) {
			System.out.println("获取所有商品照片信息时 -----> 设置预处理语句出错");
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
//		System.out.println("GetProductInfoServlet --- > 获取到的信息有 " + productId + "----> " + productClass);
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
