<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="news.DBHelper" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0" />
</head>
<body>
<%
	String quit = null;
	String username = null;
	String password = null;
	String position = null;
	Cookie cookie = null;
	boolean user = false;
	boolean loggedin = false;
	boolean usernameError = false;
	boolean passwordError = false;
	Cookie[] cookies = request.getCookies();
	for(int i = 0; cookies != null && i < cookies.length; i++){
		cookie = cookies[i];
		if(cookie.getName().equals("username")){
			username=cookie.getValue();
			quit = request.getParameter("quit");
			if (quit != null){
				cookie = new Cookie("username", username);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				username = null;
			}
			break;
		}
	}
	if(username == null || username.trim().equals("")){
 		username = request.getParameter("username");
 		if (username == null || username.trim().equals("")){
 			%>
    		<jsp:forward page="login.jsp">
		       	<jsp:param name="warning" value="none" />
		    </jsp:forward>
		    <%
 		} 
	}
	else{
		String sql = null;
		sql = "SELECT username, position FROM user";
		DBHelper.getConnection();
		ResultSet rs = DBHelper.Query(sql);	
		while(rs.next()){
	         //Retrieve by column name
	         String usr = rs.getString("username");
	         if (usr.equals(username)){
	        	position = rs.getString("position");
	        	user = true;
	        	break;
			}
		}
 		if (user == true){		
			loggedin=true;	
		}
	}
	%>

	
	<%
		Enumeration<String> enumeration = request.getParameterNames();
		while(enumeration.hasMoreElements()) {
			String parameterName = (String)enumeration.nextElement();
			String[] parameterValue = request.getParameterValues(parameterName);
		}
	%>
	
	<%
		if(username == null || username.trim().equals("")){
			username = request.getParameter("username");
		}
		password = request.getParameter("password");
		String sql = null;
		sql="SELECT username, password, position FROM user";
		DBHelper.getConnection();
		ResultSet rs = DBHelper.Query(sql);
		if (username != null && password != null){
			while(rs.next()){
		         //Retrieve by column name
		         String usr = rs.getString("username");
		         String pwd = rs.getString("password");
		         if (usr.equals(username)){
		        	 if(pwd.equals(password)){
		        		 position = rs.getString("position");
		        		 loggedin=true;
		        		 break;
		        	 }
		        	 else{
		        		 passwordError = true;
		        	 }
		         }
		         else{
		        	 usernameError = true;
		        	 
		         }
		    }
		}
		if (loggedin == false){
			if (usernameError == true){
				%>
        		<jsp:forward page="login.jsp">
  		       		<jsp:param name="warning" value="user" />
  		    	</jsp:forward>
  		    	<%
			}
			else if (passwordError == true){
				%>
        		<jsp:forward page="login.jsp">
  		       		<jsp:param name="warning" value="pass" />
  		    	</jsp:forward>
  		    	<%
			}
		}
		else{
			cookie = new Cookie("username", username);
			cookie.setMaxAge(Integer.MAX_VALUE);
			response.addCookie(cookie);
			if(position.equals("reporter")){
				%>
				<jsp:forward page="include/reporter.jsp">
			       <jsp:param name="username" value="<%=username%>" />
			    </jsp:forward>
		    	<%
			}
			else if(position.equals("editor")){
				%>
				<jsp:forward page="include/editor.jsp">
				   <jsp:param name="username" value="<%=username%>" />
			    </jsp:forward>
		    	<%
			}
			else if(position.equals("zeditor")){
				%>
				<jsp:forward page="include/zeditor.jsp">
				   <jsp:param name="username" value="<%=username%>" />
			    </jsp:forward>
		    	<%
			}
			else if(position.equals("admin")){
				%>
				<jsp:forward page="include/admin.jsp">
				   <jsp:param name="username" value="<%=username%>" />
			    </jsp:forward>
		    	<%
			}
			else{
				out.println("你到底是个神马？");
			}
		}
	%>
</body>
</html>
