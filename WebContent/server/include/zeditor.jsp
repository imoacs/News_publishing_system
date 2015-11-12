<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<jsp:include page="modules/common-head.jsp"></jsp:include>
	<script src="scripts/zeditor.js"></script>
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
				<a class="item c1" href="javascript:;">
					<i class="fa fa-times"></i>
					&nbsp;
					<span>没有通过</span>
				</a>
				<a class="item c2" href="javascript:;">
					<i class="fa fa-check"></i>
					&nbsp;
					<span>已经发布</span>
				</a>
				<a class="item c3" href="javascript:;">
					<i class="fa fa-star"></i>
					&nbsp;
					<span>推荐文章</span>
				</a>			
			</div>
		</div>
		
	</header>

	<!-- judgement block -->
	<div class="block  judgement"></div>
	
	<!-- c1c block -->
	<div class="block c1c"></div>
	
	<!-- c2c block -->
	<div class="block c2c"></div>
	
	<!-- c3c block -->
	<div class="block c3c"></div>

	<div class="modal-bg">
		<div class="modal-wrap">
			<p class="confirm-text"></p>
			<input class="reason-msg" type="text" placeholder="审核不通过的原因..." />
			<input type="checkbox" class="recommend" id="recommend" value="recommend" name="recommend" />
				<label for="recommend">同时推荐到首页</label>
			<div class="btn-group">
				<button class="ok-btn">确定</button>
				<button class="cancel-btn">取消</button>
			</div>
		</div>
	</div>

</body>
</html>