<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String content = request.getParameter("link");
%>
<!doctype html>

<body>
	<jsp:include page="inc/header.jsp" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
	
	<jsp:include page="<%=content%>" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
	
	<jsp:include page="inc/footer.jsp" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
</body>