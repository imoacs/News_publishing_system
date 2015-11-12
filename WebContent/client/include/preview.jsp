<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="news.NewsBean"%>
<%@ page import="news.XMLHelper"%>
<%
NewsBean news = null;
String type = null;
String id = null;
String title = null;
String content = null;
String content1 = null;
String content2 = null;
String time = null;
int imgNum = 0;
String img[] = new String [3];
type = request.getParameter("type");
id = request.getParameter("id");
news = XMLHelper.getNewsById(type, id);
title = news.getTitle();
content = news.getContent();
content1 = content;
time = news.getTime();
for (imgNum = 0; imgNum < 3; imgNum++){
	if (content1.indexOf("img") != -1){
		content2 = content1.substring(content1.indexOf("img")+9);
		System.out.println(content2);
		content1 = content1.substring(content1.indexOf("img")+1);
		System.out.println(content1);
		img[imgNum] = content2.substring(0,content2.indexOf("\""));
	}
	else{
		break;
	}
}
%>
<section class="item">
	<%
	
	if (imgNum >= 3){
		%>
		<h2 class="info" style="width: 100%;"><a href="news.jsp?type=<%=type%>&id=<%=id%>" target="_blank"><%=title%></a></h2>
		<%
		for(int i = 0; i < 3; i++){
			%>
			<a href="news.jsp?type=<%=type%>&id=<%=id%>" class="img" target="_blank"><img src="<%=img[i]%>"></a>
			<%
		}
	}
	else if (imgNum == 1 || imgNum == 2){
		%>
		<h2 class="info"><a href="news.jsp?type=<%=type%>&id=<%=id%>" target="_blank"><%=title%></a></h2>
		<a href="news.jsp?type=<%=type%>&id=<%=id%>" class="img" style="float:right;width: 320px; height: 180px;margin-top: 25px;" target="_blank"><img style="width: 100%; height: 100%;" src="<%=img[0]%>"></a>
		<%
	}
	else{
		%>
		<h2 class="info" style="width: 100%;"><a href="news.jsp?type=<%=type%>&id=<%=id%>" target="_blank"><%=title%></a></h2>
		<%
	}
	%>
	<div class="footer">
		<span class="source"><%=time%></span>
	</div>
	<span class="item-line"></span>
	
</section>