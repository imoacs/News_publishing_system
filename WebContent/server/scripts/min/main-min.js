$(function(){"use strict";var e=$(".block");e.hide(),$(".msg").click(function(){e.hide();var t=$(".message");$.ajax({type:"GET",url:"./message.xml",dataType:"xml",success:function(e){$(e).find("message").each(function(){var e=$(this),a=e.children("title").text(),s=e.children("content").text(),n=e.children("from").text(),l=e.children("time").text(),c="";c+="<article>",c+="<h3>"+a+"</h3>",c+="<p>"+s+"</p>",c+='<div class="wrap"><span class="left">'+n+'</span><span class="right">'+l+"</span></div>",c+="</article>",t.append(c).show()})}})});var t=$(".slct-et"),a=$(".slct-et ul"),s=$(".slct-et ul li"),n=$(".slct-et span");t.on("click",function(){a.toggleClass("show")}),s.on("click",function(){var e=$(this).text();n.html(e)});var l=$("#title").val(),c=$("#edit-name").html(),i=$("#message").val(),o=$(".pub"),p=$(".pub-form"),r=$("#btn-pub");o.on("click",function(){e.hide(),p.show()}),$(".btn-upload").on("click",function(){$(".upload-msg").text("上传中..."),$.ajax({url:"upload.jsp",type:"POST",data:new FormData(this),contentType:!1,cache:!1,processData:!1,success:function(e){$(".upload-msg").html(e)}})}),$("#userImage").change(function(){$(".upload-msg").empty();var e=this.files[0],t=e.type,a=["image/jpeg","image/png","image/jpg"];if(-1===a.indexOf(t))return $(".upload-msg").html('<span class="msg-error">请选择合法的图片文件</span> Only jpeg, jpg and png Images type allowed'),!1;var s=new FileReader;s.onload=function(e){$(".img-preview").html('<img src="'+e.target.result+'" alt="" />')},s.readAsDataURL(this.files[0])}),r.on("click",function(){$.ajax({method:"POST",url:"example.jsp",data:{title:l,editor:c,message:i},success:function(){$(".tip").html("success")}})})});