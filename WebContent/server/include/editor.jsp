<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<jsp:include page="modules/common-head.jsp"></jsp:include>
	<script src="scripts/editor.js"></script>
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
				<a class="item judge" href="javascript:;">
					<i class="fa fa-hourglass-2"></i>
					&nbsp;
					<span>等待审核</span>
				</a>
				<a class="item b1" href="javascript:;">
					<i class="fa fa-times-circle"></i>
					&nbsp;
					<span>没有通过</span>
				</a>
				<a class="item b2" href="javascript:;">
					<i class="fa fa-hourglass-3"></i>
					&nbsp;
					<span>等待终审</span>
				</a>
				<a class="item b3" href="javascript:;">
					<i class="fa fa-times"></i>
					&nbsp;
					<span>终审未过</span>
				</a>
				<a class="item b4" href="javascript:;">
					<i class="fa fa-check"></i>
					&nbsp;
					<span>已经发布</span>
				</a>
				
			</div>
		</div>
		
	</header>

	<!-- judgement block -->
	<div class="block judgement"></div>
	
	<!-- b1c block -->
	<div class="block b1c"></div>
	
	<!-- b2c block -->
	<div class="block b2c"></div>
	
	<!-- b3c block -->
	<div class="block b3c"></div>
	
	<!-- b4c block -->
	<div class="block b4c"></div>

	<div class="modal-bg">
		<div class="modal-wrap">
			<p class="confirm-text"></p>
			<input class="reason-msg" type="text" placeholder="审核不通过的原因..." />
			<div class="btn-group">
				<button class="ok-btn">确定</button>
				<button class="cancel-btn">取消</button>
			</div>
		</div>
	</div>

</body>
</html>