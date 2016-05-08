package com.Jason.SellerCenterPutaway;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jason.DAO.DB;

public class PutawayServlet extends HttpServlet {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rsKey; //用作查询主键

	private final String LAND = "土地";
	private final String TREE = "果树";

	private int pKey = -1; // 主键
	public int getpKey() {
		return pKey;
	}

	public void setpKey(int pKey) {
		this.pKey = pKey;
	}

	// 把商品信息放入数据库
	public boolean save(String productName, String productClass,
			String address, String productPrice, String description) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "";
		if (productClass.equals(LAND)) {
			sql = "insert into land_info values(null,?,?,?,?,now())";
		} else if (productClass.equals(TREE)) {
			sql = "insert into tree_info values(null,?,?,?,?,now())";
		}
		pstmt = DB.createPstmt(conn, sql);
		
		try {
			pstmt.setString(1, productName);
			pstmt.setString(2, productPrice);
			pstmt.setString(3, address);
			pstmt.setString(4, description);
			bool = pstmt.executeUpdate() == 0 ? false : true;
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			setpKey(rsKey.getInt(1));
		} catch (SQLException e) {
			System.out.println("PutawayServlet ----> 在处理预处理语句时发生错误");
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
			DB.close(rsKey);
		}
		return bool;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String uploadInfo = "";
		String productName = request.getParameter("productName");
		String productClass = request.getParameter("productClass");
		String productPrice = request.getParameter("productPrice");
		String address = request.getParameter("address");
		String description = request.getParameter("description");
//将获取到的数据打印出来
		System.out.println(productName + "-" + productClass + "-"
				+ productPrice + "-" + address + "-" + description);
		if (save(productName, productClass, productPrice, address, description)) {
			uploadInfo = "商品信息上传成功,请上传些图片";
			//把productClass作为商品类别
			request.getSession().setAttribute("productClass", productClass);
			//把商品信息的主键作为商品Id
			request.getSession().setAttribute("productId", getpKey());
			request.getSession().setAttribute("uploadInfo", uploadInfo);
			response.sendRedirect("/Farm1.0/sellerCenterUploadPhotoes.jsp");
		} else {
			uploadInfo = "商品信息上传失败,请重新上传";
			request.getSession().setAttribute("uploadInfo", uploadInfo);
			response.sendRedirect("/Farm1.0/sellerCenterPutaway.jsp");
		}
		System.out.println("生成的主键是:" + getpKey());
	}
}
