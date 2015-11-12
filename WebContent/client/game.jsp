<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="news.NewsBean" %>
<%@ page import="news.XMLHelper"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<jsp:include page="include/common-head.jsp"></jsp:include>
</head>
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
					<li class="active"><a href="game.jsp">游戏</a></li>
				</ul>
				<form class="search-bar" action="search.jsp">
					<input type="text" name="keyword" placeholder="Search..."><input type="submit" value="">
				</form>	
			</div>
			
		</div>
	</header>
	<main>
		<div class="container">
		<%
		int pageid = 0;
		String pagestr = request.getParameter("page");
		String type = "game";
		ArrayList<NewsBean> arrNews = new ArrayList<NewsBean>();
		int count1 = XMLHelper.count(type);
		int pages = 0;
		int current_id = 0;
		
		for (int i = 1; i <= count1; i++){
			NewsBean news = XMLHelper.getNewsById(type,i+"");
			String Status = news.getNewStatus();
			if(Status.equals("4") || Status.equals("5")){
				arrNews.add(news);
			}
		}
		int count = arrNews.size();
		if (pagestr == null){
			pageid = 1;
			current_id = count;
		}
		else{
			pageid = Integer.valueOf(pagestr);
			current_id = count - (pageid-1) * 10;
		}
		for (int i = current_id; i > 0 && i > current_id - 10; i--){
			String id = arrNews.get(i-1).getNewid();
			%>
			<jsp:include page="include/preview.jsp">
				<jsp:param name="type" value="<%=type%>" />
				<jsp:param name="id" value="<%=id%>" />
			</jsp:include>
			<%
		}
		if (count % 10 != 0){
			pages = count / 10 +1;
		}
		else{
			pages = count / 10;
		}
		%>
		<div class="page">
		<%
		if (pageid != 1){
			%>
			<a href="game.jsp?page=<%=pageid-1%>">&lt;</a>
			<%
		}
		if (pages <= 9){
			for (int j = 1; j <= pages; j++){
				if(j==pageid){
					%>
					<span>
					<%
				}
				%>
				<a href="game.jsp?page=<%=j%>"><%=j%></a>
				<%
				if(j==pageid){
					%>
					</span>
					<%
				}
			}
		}
		else if (pageid <= 4){
			for (int j = 1; j <= pageid + 9; j++){
				if(j==pageid){
					%>
					<span>
					<%
				}
				%>
				<a href="game.jsp?page=<%=j%>"><%=j%></a>
				<%
				if(j==pageid){
					%>
					</span>
					<%
				}
			}
		}
		else if ((pages - pageid) <= 4){
			for (int j = pages - 9; j <= pages; j++){
				if(j==pageid){
					%>
					<span>
					<%
				}
				%>
				<a href="game.jsp?page=<%=j%>"><%=j%></a>
				<%
				if(j==pageid){
					%>
					</span>
					<%
				}
			}
		}
		else{
			for (int j = pageid - 4; j <= pageid + 4; j++){
				if(j==pageid){
					%>
					<span>
					<%
				}
				%>
				<a href="game.jsp?page=<%=j%>"><%=j%></a>
				<%
				if(j==pageid){
					%>
					</span>
					<%
				}
			}
		}
		if (pageid != pages){
			%>
			<a href="game.jsp?page=<%=pageid+1%>">&gt;</a>
			<%
		}
		%>	
		</div>		
		</div>
	</main>
	<a  class="toTop" href="javascript:;"></a>

<jsp:include page="include/footer.jsp"></jsp:include>