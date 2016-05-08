package com.Jason.File.Servlet;

//提高服务器的安全性，将文件存在WEB-INF中
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
	
	//将照片信息保存到数据库中
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
		request.setCharacterEncoding("UTF-8"); // 在这里对请求的内容设置编码,否则会造成乱码
		response.setContentType("text/html;charset=UTF-8"); // 对返回的信息设置编码
		HttpSession session = request.getSession(); 
		DiskFileItemFactory factory = new DiskFileItemFactory();
		String productId = String.valueOf(session.getAttribute("productId"));
		if(productId == null) {
			productId = "361239731";
		}
System.out.println("productId:" + productId);
		
		String productClass = (String)session.getAttribute("productClass");
		//去掉session中的信息
		session.removeAttribute("productId");
		session.removeAttribute("productClass");
		
		//存储成功信息。
		String saveSuccessInfo = "";
		String saveFailInfo = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			throw new RuntimeException("请设置enctype属性的值为Multipart/form-data类型");
		}
		ServletFileUpload sfu = new ServletFileUpload(factory);
		//设置单个文件为3M
//		sfu.setFileSizeMax(3* 1024 * 1024);
//		设置文件最大不超过5M
//		sfu.setSizeMax(5* 1024* 1024);
		try {
			List<FileItem> items = sfu.parseRequest(request);
			for (FileItem fileItem : items) {
				if (fileItem.isFormField()) {
					processFormField(fileItem);
				} else {
					processUploadfile(fileItem);
					
					//将照片信息保存到数据库
					if(save(productId, productClass, guidFileName, realFileName, storePath)) {
						saveSuccessInfo = "照片信息存储成功";
						System.out.println(saveSuccessInfo);
						session.setAttribute("saveSuccessInfo", saveSuccessInfo);
						//将这2个信息放入session中，在跳转回本页面之后自动跳转到商品页面。
						//这2个信息将作为属性被展示商品页面获取到
						session.setAttribute("productId", productId);
						session.setAttribute("productClass", productClass);
					} else {
						saveFailInfo = "照片信息存储失败";
						session.setAttribute("saveFailInfo", saveFailInfo);
					}
				}
			}
		} catch (FileUploadException e) {
			System.out.println("照片上传-----> 文件已经处理完毕，但是上传时出现未知错误");
			e.printStackTrace();
		}
		System.out.println("request.getContextPath()的值是" + request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/sellerCenterUploadPhotoes.jsp");
	}

	private void processUploadfile(FileItem fileItem) {
		// 将上传的文件保存到files文件夹中
		String realPath = getServletContext().getRealPath("/WEB-INF/files");
		File storeDirectory = new File(realPath);
		if (!storeDirectory.exists()) {
			storeDirectory.mkdir();
		}
		// 获取文件名
		realFileName = fileItem.getName(); // 这里的文件名可能是绝对路径，也可能是相对路径
System.out.println("文件的真实名称:" + realFileName);
		if (realFileName != null) {
			guidFileName = UUID.getUUID() + "_" + FilenameUtils.getName(realFileName);
		}
		  
		//计算存储目录
		String childDirectory = makeChildDirectory(realPath, guidFileName);
		// 上传
		try {
			/*
			 * InputStream in = fileItem.getInputStream(); OutputStream out =
			 * new FileOutputStream(realPath+"\\"+fileName); int len = -1;
			 * byte[] b = new byte[1024]; while((len=in.read(b)) != -1) {
			 * out.write(b, 0, len); //out.write(a,1,len); } in.close();
			 * out.close();
			 */
			// 上面的代码段可以用下面的语句进行代替
			// fileName = new String(fileName.getBytes(),"UTF-8");
			System.out.println("上传的文件名:" + guidFileName);
			//拼接成为存储目录
			storePath = realPath + "/" + childDirectory;
			
System.out.println("存储目录:" + storePath);

			fileItem.write(new File(storePath, guidFileName));

		} catch (FileNotFoundException e) {
			System.out.println("照片上传----> 未找到对应的照片文件");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("照片上传----> 上传照片时发生未知错误");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("照片存储----> 照片在存储时发生了未知错误");
			e.printStackTrace();
		} 
	}

	// 用文件名的hashCode来计算目录
	// 用日期+hashCode分3级目录
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

	// 处理普通的表格字段，将其打印到控制台
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
