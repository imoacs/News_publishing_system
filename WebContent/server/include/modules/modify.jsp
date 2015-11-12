<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="news.XMLHelper" %>
<%
String type = request.getParameter("type");
String id = request.getParameter("id");
String status = request.getParameter("status");
String comment = request.getParameter("comment");
XMLHelper.modiNewStatus(type,id,status);
if (comment != null && !comment.equals("")){
	if(XMLHelper.getNewsById(type,id).getComments().length == 0){
		XMLHelper.addComment(type, id, comment);
	}
}
else{
	if(XMLHelper.getNewsById(type,id).getComments().length == 0){
		XMLHelper.addComment(type, id, status);
	}
}
%>