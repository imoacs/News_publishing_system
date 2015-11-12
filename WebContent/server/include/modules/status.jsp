<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="news.NewsBean" %>
<%@ page import="news.XMLHelper" %>
<%
String name = request.getParameter("username");
String position = request.getParameter("position");
String status = request.getParameter("status");
String status1 = null;
String status2 = null;
System.out.println(name);
System.out.println(position);
System.out.println(status);
if (status.indexOf(",") != -1){
	status1 = status.split(",")[0];
	status2 = status.split(",")[1];
}
else{
	status1 = status2 = status;
}
ArrayList<NewsBean> arrNews = XMLHelper.getNewsByProperty(position, name, false);
for (int i = arrNews.size()-1; i >= 0; i--){
	if (arrNews.get(i).getNewStatus().equals(status1) || arrNews.get(i).getNewStatus().equals(status2)){
		out.print("<div class=\"article-wrap\" id=\"" + arrNews.get(i).getNewid() + "\" type=\"" + arrNews.get(i).getType() + "\"><article><h3>" + arrNews.get(i).getTitle() + "</h3><div class=\"hide hidden-content\">" + arrNews.get(i).getContent() + "</div><div class=\"right\"><span>板块：" + arrNews.get(i).getType() + "</span><span>ID：" + arrNews.get(i).getNewid() + "</span><span>时间：" + arrNews.get(i).getTime() + "</span></div></article><button class=\"hide hidden-btn pass-btn\">通过</button><button class=\"hide hidden-btn dispass-btn\">不通过</button><span class=\"hide hidden-support\"></span></div>");
	}
}
%>