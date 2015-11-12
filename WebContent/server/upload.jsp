<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%
	response.setCharacterEncoding("utf-8");
	String filePath = "/Users/Jackeriss/Documents/Tomcat/apache-tomcat-8.0.26/webapps/news/public/images/articles";
	BufferedReader br = new BufferedReader(new FileReader(filePath+"/imageNo.txt"));  
	String imageNo = br.readLine().replace("\n", "");
	br.close();
	String isUploaded = null;
	File file ;
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	ServletContext context = pageContext.getServletContext();
	String origFileName = null;
	String fileName = null;
	// 验证上传内容了类型
	String contentType = request.getContentType();
	if ((contentType.indexOf("multipart/form-data") >= 0)) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存中存储文件的最大值
		factory.setSizeThreshold(maxMemSize);
		// 本地存储的数据大于 maxMemSize.
		factory.setRepository(new File("/Users/Jackeriss/Documents/Tomcat/apache-tomcat-8.0.26/webapps/news/public/images/temp"));		
		// 创建一个新的文件上传处理程序
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置最大上传的文件大小
		upload.setSizeMax(maxFileSize);
		try{ 
			// 解析获取的文件
			List fileItems = upload.parseRequest(request);
			
			// 处理上传的文件
			Iterator i = fileItems.iterator();
			while (i.hasNext()) 
			{
				FileItem fi = (FileItem)i.next();
				if (!fi.isFormField())	
				{
					// 获取上传文件的参数
					String fieldName = fi.getFieldName();
					origFileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// 写入文件
					imageNo = Integer.parseInt(imageNo) + 1 + "";
					fileName = (imageNo) + origFileName.substring(origFileName.indexOf("."));
					file = new File(filePath, fileName);
					fi.write(file);
					BufferedWriter bw = new BufferedWriter(new FileWriter(filePath+"/imageNo.txt"));
					bw.write(imageNo);
					bw.flush();
					bw.close();
					isUploaded = "1";
				}
				if (isUploaded != null){
					out.print(origFileName + "@/news/public/images/articles/" + fileName);
				}
			}
		}catch(Exception ex) {
			System.out.println(ex);
		}
	}	
%>