<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="news.DBHelper" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String position = request.getParameter("position");
username = "New";
password = "010203";
position = "reporter";
String sql = "use user;insert into user values(null,\"" + username + "\",\"" + password + "\",\"" + position + "\");";
sql = "select * from user";
DBHelper.getConnection();
ResultSet rs = DBHelper.Query(sql);
%>