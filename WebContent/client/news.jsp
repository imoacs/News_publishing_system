<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="news.NewsBean"%>
<%@ page import="news.XMLHelper"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<jsp:include page="include/common-head.jsp"></jsp:include>
</head>
<%
NewsBean news = null;
String type = null;
String id = null;
String title = null;
String content = null;
String time = null;
type = request.getParameter("type");
id = request.getParameter("id");
news = XMLHelper.getNewsById(type, id);
title = news.getTitle();
content = news.getContent();
time = news.getTime();
%>
<body>
	<header>
		<div class="header_top">
			<div class="logo">
				<a href="index.jsp"></a>
			</div>
		</div>
		<div class="navigation">
			<div class="nav-wrap">
				<ul>
					<li><a href="index.jsp">推荐</a></li>
					<li><a href="social.jsp">社会</a></li>
					<li><a href="entertainment.jsp">娱乐</a></li>
					<li><a href="technology.jsp">科技</a></li>
					<li><a href="military.jsp">军事</a></li>
					<li><a href="sport.jsp">体育</a></li>
					<li><a href="game.jsp">游戏</a></li>
				</ul>
				<form class="search-bar" action="search.jsp">
					<input type="text" name="keyword" placeholder="Search..."><input type="submit" value="">
				</form>	
			</div>
			
		</div>
	</header>
	<div class="news-specific">
		<article>
			<header>
				<h1><%= title %></h1>
				<time pubtime="pubtime"><%= time %></time>
			</header>
			<div><%= content %></div>
		</article>
	</div>
</body>
<jsp:include page="include/footer.jsp"></jsp:include>
</html>