<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
final String rootPath = request.getContextPath().replace("/" , "");
final String headerJsp = "header.jsp";
%>

<jsp:include page="<%=headerJsp%>" flush="true">
	<jsp:param name="abc" value="abc"/>
</jsp:include>

<div id="page_top" style="background:url(../img/comm/top_greet.jpg)">
	<h2>대표 인사말</h2>
	<p>사물인터넷과 보안, 클라우드 등 IT 산업을 이끄는 리더로서, 한결 같은 마음으로</p>
</div>