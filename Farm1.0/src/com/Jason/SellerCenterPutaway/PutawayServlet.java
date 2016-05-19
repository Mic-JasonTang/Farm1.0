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
	private ResultSet rsKey; //������ѯ����

	private final String LAND = "����";
	private final String TREE = "����";

	private int pKey = -1; // ����
	public int getpKey() {
		return pKey;
	}

	public void setpKey(int pKey) {
		this.pKey = pKey;
	}

	// ����Ʒ��Ϣ�������ݿ�
	public boolean save(String userId,String productName, String productClass,
			 String productPrice, String address, String description) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "";
		if (productClass.equals(LAND)) {
			sql = "insert into land_info values(null,?,?,?,?,?,now())";
		} else if (productClass.equals(TREE)) {
			sql = "insert into tree_info values(null,?,?,?,?,?,now())";
		}
		pstmt = DB.createPstmt(conn, sql);
		
		try {
			pstmt.setString(1, userId);
			pstmt.setString(2, productName);
			pstmt.setString(3, productPrice);
			pstmt.setString(4, address);
			pstmt.setString(5, description);
			bool = pstmt.executeUpdate() == 0 ? false : true;
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			setpKey(rsKey.getInt(1));
		} catch (SQLException e) {
			System.out.println("PutawayServlet ----> �ڴ���Ԥ�������ʱ��������");
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
		String userId = (String) request.getSession().getAttribute("userID");
		String productName = request.getParameter("productName");
		String productClass = request.getParameter("productClass");
		String productPrice = request.getParameter("productPrice");
		int index = productPrice.indexOf(".");
		if (index == -1) { // �����С����
				productPrice = productPrice + ".00";
		}
		System.out.println(productPrice);
		String address = request.getParameter("address");
		String description = request.getParameter("description");
		description = description.replaceAll(" ", "&nbsp;");
		description = description.replaceAll("\n", "<br>");
//����ȡ�������ݴ�ӡ����
		System.out.println("�ϴ�����Ʒ��Ϣ��userId = " + userId + productName + "-" + productClass + "-"
				+ productPrice + "-" + address + "-" + description);
		if (save(userId, productName, productClass, productPrice, address, description)) {
			uploadInfo = "��Ʒ��Ϣ�ϴ��ɹ�,���ϴ�ЩͼƬ";
			//��productClass��Ϊ��Ʒ���
			request.getSession().setAttribute("productClass", productClass);
			//����Ʒ��Ϣ��������Ϊ��ƷId
			request.getSession().setAttribute("productId", getpKey());
			request.getSession().setAttribute("uploadInfo", uploadInfo);
			response.sendRedirect("/Farm1.0/sellerCenterUploadPhotoes.jsp");
		} else {
			uploadInfo = "��Ʒ��Ϣ�ϴ�ʧ��,�������ϴ�";
			request.getSession().setAttribute("uploadInfo", uploadInfo);
			response.sendRedirect("/Farm1.0/sellerCenterPutaway.jsp");
		}
		System.out.println("���ɵ�������:" + getpKey());
	}
}
