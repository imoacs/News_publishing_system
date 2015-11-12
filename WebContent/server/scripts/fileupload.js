jQuery(function(){
			
	$('#fileToUpload').on('change', function(e) {
		var src = e.target;
		var name = src.value.substring(src.value.lastIndexOf('\\')+1);
		$('.fileToUpload-name').html(name);
	});
		  $("#buttonUpload").click(function(){     
		     //加载图标   
		     /* $("#loading").ajaxStart(function(){
		        $(this).show();
		     }).ajaxComplete(function(){
		        $(this).hide();
		     });*/
		      //上传文件
			  $.ajaxFileUpload({
		        url:'upload.jsp',//处理图片脚本
		        secureuri :false,
		        fileElementId :'fileToUpload',//file控件id
		        dataType : 'text',
		        success:function(message){
	            	var msg = message.split('@');
		        	var str = '';
		        	str += '<div class="img-preview"><img src="' + msg[1] + '" /><a href="javascript:;" class="insertImg">插入</a></div>'
		            $('.upload-msg').append(str);
		        	insertImg = $('.insertImg');
		        	insertImg.on('click', function() {
		        		var img = '<img src="' + msg[1] + '"/>';
		        		$('#content').append(img);
		        	});
		        }
			  })
			  return false;
		  })
		  
		  
})