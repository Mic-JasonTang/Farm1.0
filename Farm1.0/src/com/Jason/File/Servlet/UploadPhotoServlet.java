package com.Jason.File.Servlet;

//��߷������İ�ȫ�ԣ����ļ�����WEB-INF��
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.Jason.DAO.DB;

public class UploadPhotoServlet extends HttpServlet {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String realFileName = "";
	private String guidFileName = "";
	private String storePath = "";
	
	//����Ƭ��Ϣ���浽���ݿ���
	public boolean save (String productId,String productClass, String guidFileName, String realFileName, String storePath) {
		boolean bool = false;
		conn = DB.getConn();
		String sql = "insert into images values(null,?,?,?,?,?,now())";
		pstmt = DB.createPstmt(conn, sql);
		try {
			pstmt.setString(1, productId);
			pstmt.setString(2, productClass);
			pstmt.setString(3, guidFileName);
			pstmt.setString(4, realFileName);
			pstmt.setString(5, storePath);
			bool = pstmt.executeUpdate() == 0 ? false : true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return bool;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // �������������������ñ���,������������
		response.setContentType("text/html;charset=UTF-8"); // �Է��ص���Ϣ���ñ���
		HttpSession session = request.getSession(); 
		DiskFileItemFactory factory = new DiskFileItemFactory();
		String productId = String.valueOf(session.getAttribute("productId"));
		if(productId == null) {
			productId = "361239731";
		}
System.out.println("productId:" + productId);
		
		String productClass = (String)session.getAttribute("productClass");
		//ȥ��session�е���Ϣ
		session.removeAttribute("productId");
		session.removeAttribute("productClass");
		
		//�洢�ɹ���Ϣ��
		String saveSuccessInfo = "";
		String saveFailInfo = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			throw new RuntimeException("������enctype���Ե�ֵΪMultipart/form-data����");
		}
		ServletFileUpload sfu = new ServletFileUpload(factory);
		//���õ����ļ�Ϊ3M
//		sfu.setFileSizeMax(3* 1024 * 1024);
//		�����ļ���󲻳���5M
//		sfu.setSizeMax(5* 1024* 1024);
		try {
			List<FileItem> items = sfu.parseRequest(request);
			for (FileItem fileItem : items) {
				if (fileItem.isFormField()) {
					processFormField(fileItem);
				} else {
					processUploadfile(fileItem);
					
					//����Ƭ��Ϣ���浽���ݿ�
					if(save(productId, productClass, guidFileName, realFileName, storePath)) {
						saveSuccessInfo = "��Ƭ��Ϣ�洢�ɹ�";
						System.out.println(saveSuccessInfo);
						session.setAttribute("saveSuccessInfo", saveSuccessInfo);
						//����2����Ϣ����session�У�����ת�ر�ҳ��֮���Զ���ת����Ʒҳ�档
						//��2����Ϣ����Ϊ���Ա�չʾ��Ʒҳ���ȡ��
						session.setAttribute("productId", productId);
						session.setAttribute("productClass", productClass);
					} else {
						saveFailInfo = "��Ƭ��Ϣ�洢ʧ��";
						session.setAttribute("saveFailInfo", saveFailInfo);
					}
				}
			}
		} catch (FileUploadException e) {
			System.out.println("��Ƭ�ϴ�-----> �ļ��Ѿ�������ϣ������ϴ�ʱ����δ֪����");
			e.printStackTrace();
		}
		System.out.println("request.getContextPath()��ֵ��" + request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/sellerCenterUploadPhotoes.jsp");
	}

	private void processUploadfile(FileItem fileItem) {
		// ���ϴ����ļ����浽files�ļ�����
		String realPath = getServletContext().getRealPath("/WEB-INF/files");
		File storeDirectory = new File(realPath);
		if (!storeDirectory.exists()) {
			storeDirectory.mkdir();
		}
		// ��ȡ�ļ���
		realFileName = fileItem.getName(); // ������ļ��������Ǿ���·����Ҳ���������·��
System.out.println("�ļ�����ʵ����:" + realFileName);
		if (realFileName != null) {
			guidFileName = UUID.getUUID() + "_" + FilenameUtils.getName(realFileName);
		}
		  
		//����洢Ŀ¼
		String childDirectory = makeChildDirectory(realPath, guidFileName);
		// �ϴ�
		try {
			/*
			 * InputStream in = fileItem.getInputStream(); OutputStream out =
			 * new FileOutputStream(realPath+"\\"+fileName); int len = -1;
			 * byte[] b = new byte[1024]; while((len=in.read(b)) != -1) {
			 * out.write(b, 0, len); //out.write(a,1,len); } in.close();
			 * out.close();
			 */
			// ����Ĵ���ο���������������д���
			// fileName = new String(fileName.getBytes(),"UTF-8");
			System.out.println("�ϴ����ļ���:" + guidFileName);
			//ƴ�ӳ�Ϊ�洢Ŀ¼
			storePath = realPath + "/" + childDirectory;
			
System.out.println("�洢Ŀ¼:" + storePath);

			fileItem.write(new File(storePath, guidFileName));

		} catch (FileNotFoundException e) {
			System.out.println("��Ƭ�ϴ�----> δ�ҵ���Ӧ����Ƭ�ļ�");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("��Ƭ�ϴ�----> �ϴ���Ƭʱ����δ֪����");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("��Ƭ�洢----> ��Ƭ�ڴ洢ʱ������δ֪����");
			e.printStackTrace();
		} 
	}

	// ���ļ�����hashCode������Ŀ¼
	// ������+hashCode��3��Ŀ¼
	private String makeChildDirectory(String realPath, String filename) {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(now);
		int hashCode = filename.hashCode();
		int dir1 = hashCode&0xf;
		int dir2 = (hashCode&0xf0)>>4;
		String childDirectory = date + "/" + dir1 + "/" + dir2;
		File file = new File(realPath, childDirectory);
		if(!file.exists()) {
			file.mkdirs();
		}
		return childDirectory;
	}

	// ������ͨ�ı���ֶΣ������ӡ������̨
	private void processFormField(FileItem fileItem) {
		String fileName = fileItem.getFieldName();
		String fileValue = "";
		try {
			fileValue = fileItem.getString("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println(fileName + ":" + fileValue);
	}
}
