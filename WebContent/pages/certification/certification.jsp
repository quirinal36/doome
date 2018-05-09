<%@page import="java.util.HashMap"%>
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
	HashMap<Integer, String> typesMap = action.getCertificationTypes();
%>
<%
	for(int key : typesMap.keySet()){
		String typeName = typesMap.get(key);
		Iterator<CertificationInfo> iter = list.iterator();
	%>
	<div class="certi_list">
		<h3><%= typeName%></h3>
		<p>두메산골영농조합법인은 정책수행, 일자리 창출지원 등  다양한 노력을 통해 국가경제 발전에 기여하고 있습니다. 두메산골영농조합법인은 정책수행, 일자리 창출지원 등  다양한 노력을 통해 국가경제 발전에 기여하고 있습니다. 두메산골영농조합법인은 정책수행, 일자리 창출지원 등  다양한 노력을 통해 국가경제 발전에 기여하고 있습니다. 두메산골영농조합법인은 정책수행, 일자리 창출지원 등  다양한 노력을 통해 국가경제 발전에 기여하고 있습니다. </p>
		<ul>
		<%while(iter.hasNext()){
			CertificationInfo info = iter.next();
			if(info.getType() == key){
			%>
			<li>
				<img src="img/certification/<%=info.getImg_small() %>" onclick="showLargeImg(this, '<%=info.getImg_large() %>');"/>
				<span><%=info.getName() %></span>
			</li>
			<%}
		}%>
		</ul>
	</div>
	<%} %>
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
$(document).keyup(function(e) {
    if (e.keyCode == 27) { 
       // <DO YOUR WORK HERE>
       console.log("esc input");
   }else {
	   console.log("another");
   }
});
</script>