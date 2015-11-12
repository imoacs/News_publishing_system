<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="news.NewsBean" %>
<%@ page import="news.XMLHelper" %>
<%
String name = request.getParameter("username");
String position = request.getParameter("position");
ArrayList<NewsBean> arrNews = XMLHelper.getNewsByProperty(position, name, false);
for (int i = arrNews.size()-1; i >= 0; i--){
	if (arrNews.get(i).getNewStatus().equals("4")){
		if (arrNews.get(i).getCommentsStatus().length > 0){
			if (arrNews.get(i).getCommentsStatus()[0].equals("0")){
				out.print("<div class=\"article-wrap\"><article><h3>恭喜，您的文章“" + arrNews.get(i).getTitle() + "”已通过审核，现已正常发布。</h3><div class=\"right\"><span>板块：" + arrNews.get(i).getType() + "</span><span>ID：" + arrNews.get(i).getNewid() + "</span><span>时间：" + arrNews.get(i).getTime() + "</span></div></article><button class=\"read-btn\" id=\"" + arrNews.get(i).getNewid() + "\" type=\"" + arrNews.get(i).getType() + "\">标记为已读</button></div>");
			}
		}
	}
	if (arrNews.get(i).getNewStatus().equals("5")){
		if (arrNews.get(i).getCommentsStatus().length > 0){
			if (arrNews.get(i).getCommentsStatus()[0].equals("0")){
				out.print("<div class=\"article-wrap\"><article><h3>恭喜，您的文章“" + arrNews.get(i).getTitle() + "”已通过审核，并被主编选为推荐文章。</h3><div class=\"right\"><span>板块：" + arrNews.get(i).getType() + "</span><span>ID：" + arrNews.get(i).getNewid() + "</span><span>时间：" + arrNews.get(i).getTime() + "</span></div></article><button class=\"read-btn\" id=\"" + arrNews.get(i).getNewid() + "\" type=\"" + arrNews.get(i).getType() + "\">标记为已读</button></div>");
			}
		}
	}
	else if (arrNews.get(i).getNewStatus().equals("2") || arrNews.get(i).getNewStatus().equals("3")){
		if (arrNews.get(i).getCommentsStatus().length > 0){
			if (arrNews.get(i).getCommentsStatus()[0].equals("0")){
				out.print("<div class=\"article-wrap\"><article><h3>很遗憾，您的文章“" + arrNews.get(i).getTitle() + "”由于以下原因没有通过审核：<br><br>" + arrNews.get(i).getComments()[0] + "</h3><div class=\"right\"><span>板块：" + arrNews.get(i).getType() + "</span><span>ID：" + arrNews.get(i).getNewid() + "</span><span>时间：" + arrNews.get(i).getTime() + "</span></div></article><button class=\"read-btn\" id=\"" + arrNews.get(i).getNewid() + "\" type=\"" + arrNews.get(i).getType() + "\">标记为已读</button></div>");
			}
		}
	}
}
%>