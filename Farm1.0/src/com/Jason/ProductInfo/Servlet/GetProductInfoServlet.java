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

	// 从数据库中查询出对应的照片信息和描述信息
	// 根据商品id和商品类型
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
				System.out.println("从数据库获取的照片信息如下：guidFileName = " + guidFileName + "realFileName = " + realFileName + "storeDir = " + storeDir);
			}
		} catch (SQLException e) {
			System.out.println("获取商品照片信息时 -----> 设置预处理语句出错");
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
