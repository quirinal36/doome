<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
final String rootPath = request.getContextPath();
final String headerJsp = rootPath + "/inc/header.jsp";
%>


	<jsp:include page="<%=headerJsp%>" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
	
	
	<div id="page_top">
		
	</div>