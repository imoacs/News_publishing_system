<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="block pub-form">
	<!-- 上传图片表单 -->
	<form id="uploadImg">
		<!-- 上传图片 -->
		<div class="img">
			<div id="fileToUpload-fake">
				<span class="select-img">选择图片</span>
				<input id="fileToUpload" type="file" size="20" name="fileToUpload" class="input">
			</div>
			<div class="fileToUpload-name">已选图片的名称</div>
       		<button id="buttonUpload">上传</button>
		</div>
		<!-- 图片路径 -->
		<div class="upload-msg">
		</div>
	</form>

	<!-- 发布文章表单 -->
	<form id="article" action="" method="">
		<!-- 标题 -->
		<input id="articleTitle" type="text" placeholder="标题" />
		<!-- 内容 -->
		<!-- <textarea name="content" id="content"></textarea> -->
		<div id="editBox">
			<div contentEditable="true" id="content">
			</div>
		</div>
		<!-- 板块选择 -->
		<div id="wrap">
			<div class="part">
				<input type="radio" id="social" value="social" name="part" />
				<label for="social">社会</label>
			</div>
			<div class="part">
				<input type="radio" id="entertainment" value="entertainment" name="part" />
				<label for="entertainment">娱乐</label>
			</div>
			<div class="part">
				<input type="radio" id="technology" value="technology" name="part" />
				<label for="science">科技</label>
			</div>
			<div class="part">
				<input type="radio" id="military" value="military" name="part" />
				<label for="military">军事</label>
			</div>
			<div class="part">
				<input type="radio" id="sport" value="sport" name="part" />
				<label for="sport">体育</label>
			</div>
			<div class="part">
				<input type="radio" id="game" value="game" name="part" />
				<label for="game">游戏</label>
			</div>

		</div>
		<!-- 发布按钮 -->
		<a id="btn-pub" href="javascript:;">发布</a>

	</form>
</div> 