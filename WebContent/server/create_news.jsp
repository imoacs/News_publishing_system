<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="news.XMLHelper" %>
<%
response.setContentType("text/xml; charset=utf-8");
String filePath = "/Users/Jackeriss/Documents/Tomcat/apache-tomcat-8.0.26/webapps/news/public/editors/";
String type = null;
String title = null;
String reporter = null;
String editor = null;
String zeditor = "Holoooo";
String content = null;
title = request.getParameter("title");
content = request.getParameter("content");
type = request.getParameter("part");
Cookie cookie = null;
Cookie[] cookies = request.getCookies();
for(int i = 0; cookies != null && i < cookies.length; i++){
	cookie = cookies[i];
	if(cookie.getName().equals("username")){
		reporter=cookie.getValue();
	}
}
BufferedReader br = new BufferedReader(new FileReader(filePath+type+".txt"));
String editors[] = br.readLine().replace("\n", "").split(",");
br.close();
int order = Integer.parseInt(editors[0]);
editor = editors[order];
if (order < editors.length-1){
	order++;
	System.out.println("order:"+order);
}
else{
	order=1;
}
editors[0] = order + "";
BufferedWriter bw = new BufferedWriter(new FileWriter(filePath+type+".txt"));
String newFile = order + "";
for (int i = 1; i < editors.length; i++){
	newFile += ("," + editors[i]);
}
bw.write(newFile);
bw.flush();
bw.close();
if (type != null && title != null && reporter != null && editor != null && zeditor != null && content != null){
	XMLHelper.addNews(type, title, reporter, editor, zeditor, content);
}
/* XMLHelper.addNews("shy.xml","shyfirst","啥的","shy1","shy2","wo ai ni,bitch"); */
%>