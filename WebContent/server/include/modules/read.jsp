<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="news.XMLHelper" %>
<%
String type = request.getParameter("type");
String id = request.getParameter("id");
if(XMLHelper.getNewsById(type,id).getComments().length > 0){
	XMLHelper.modiCommentStatus(type, id, "1","1");
}
%>