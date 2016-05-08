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
		String productName = request.getParameter("productName");
		String productClass = request.getParameter("productClass");
		String productPrice = request.getParameter("productPrice");
		String address = request.getParameter("address");
		String description = request.getParameter("description");
//����ȡ�������ݴ�ӡ����
		System.out.println(productName + "-" + productClass + "-"
				+ productPrice + "-" + address + "-" + description);
		if (save(productName, productClass, productPrice, address, description)) {
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
