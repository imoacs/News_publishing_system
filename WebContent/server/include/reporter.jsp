<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<jsp:include page="modules/common-head.jsp"></jsp:include>
	<script type="text/javascript" src="scripts/ajaxfileupload.js"></script>
	<script src="scripts/fileupload.js"></script>
	<script src="scripts/reporterform.js"></script>
	<script src="scripts/reporter.js"></script>
</head>
<%
    String username = request.getParameter("username");
%>
<body>

	<header>
	
		<!-- header-top -->
		<jsp:include page="modules/header-top.jsp"></jsp:include>

		<!-- header-left -->
		<div id="header-left">
			
			<!-- 头像和用户名 -->
			<div class="avatar">
				<img src="images/<%=username%>.jpg" width="100" />
				<p><%=username%></p>
			</div>

			<!-- 管理面板 -->
			<div class="manage-panel">
				<a class="item n-msg" href="javascript:;">
					<i class="fa fa-exclamation-circle"></i>
					&nbsp;
					<span>未读消息</span>
				</a>
				<a class="item o-msg" href="javascript:;">
					<i class="fa fa-bell"></i>
					&nbsp;
					<span>历史消息</span>
				</a>
				<a class="item pub" href="javascript:;">
					<i class="fa fa-pencil"></i>
					&nbsp;
					<span>发布文章</span>
				</a>
				<a class="item a1" href="javascript:;">
					<i class="fa fa-hourglass-1"></i>
					&nbsp;
					<span>等待审核</span>
				</a>
				<a class="item a2" href="javascript:;">
					<i class="fa fa-check"></i>
					&nbsp;
					<span>审核通过</span>
				</a>
				<a class="item a3" href="javascript:;">
					<i class="fa fa-times"></i>
					&nbsp;
					<span>没有通过</span>
				</a>
			</div>
		</div>
		
	</header>

	<!-- new-message block -->
	<div class="block new-message"></div>
	
	<!-- old-message block -->
	<div class="block old-message"></div>

	<!-- publish article start -->
	<jsp:include page="modules/publish.jsp"></jsp:include>
	
	<!-- a1c block -->
	<div class="block a1c"></div>
	
	<!-- a2c block -->
	<div class="block a2c"></div>
	
	<!-- a3c block -->
	<div class="block a3c"></div>

</body>
</html>