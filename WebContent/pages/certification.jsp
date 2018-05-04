<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.certification.bean.CertificationInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.certification.action.CertificationAction"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Logger logger = Logger.getLogger("certification.jsp");
	CertificationAction action = new CertificationAction();
	ArrayList<CertificationInfo> list = action.getCertifications();
	Iterator<CertificationInfo> iter = list.iterator();
%>
<div class="certi_list">
	<h3>국가경제</h3>
	<p>국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제 국가경제</p>
	<ul>
	<%while(iter.hasNext()){
		CertificationInfo info = iter.next();
	%>
		<li>
			<img src="img/certification/<%=info.getImg_small() %>" onclick="showLargeImg(this, '<%=info.getImg_large() %>');"/>
			<span><%=info.getName() %></span>
		</li>
	<%} %>
	</ul>
</div>

<div class="certi_view">
	<ul>
		<li>
			<img src="" />
			<span class="certi_view-close"><img src="img/certification/bt-close.png" alt="닫기" /></span>
		</li>
	</ul>
</div>

<script>
function showLargeImg(imgTag, imgLarge){
	var newImg = imgTag.src.substring(0, imgTag.src.lastIndexOf("/")+1) + imgLarge;
	
	$(".certi_view > ul > li > img").attr("src", newImg);
	$(".certi_view").fadeIn();
}
$(function(){
	$(".certi_view-close").click(function(){
		$(".certi_view").fadeOut();
	});
});
</script>