$(function(){var t=$(".block");$(".item-msg").click(function(){t.hide();var e=$(".message");$.ajax({type:"GET",url:"./message.xml",dataType:"xml",success:function(t){$(t).find("message").each(function(){var t=$(this),s=t.attr("id"),c=t.attr("isRead"),i=t.children("title").text(),l=t.children("content").text(),a=t.children("from").text(),n=t.children("to").text(),o=t.children("time").text(),h="";h+="<article>",h+="<h3>"+i+"</h3>",h+="<p>"+l+"</p>",h+='<div class="wrap"><span class="left">'+a+'</span><span class="right">'+o+"</span></div>",h+="</article>",e.append(h).show()})}})});var e=$(".select"),s=$(".select ul"),c=$(".select ul li"),i=$(".select span");e.on("click",function(){s.toggleClass("show")}),c.on("click",function(){var t=$(this).text();i.html(t)});var l=$("#title").val(),a=i.html(),n=$("#message").val(),o=$(".item-pub"),h=$(".publish-article"),r=$(".publish-btn");o.on("click",function(){t.hide(),h.show()}),r.on("click",function(){$.ajax({method:"POST",url:"example.jsp",data:{title:l,editor:a,message:n},success:function(){$(".tip").html("success")}})})});