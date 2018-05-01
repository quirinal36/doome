<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Logger logger = Logger.getLogger("page.jsp");
	
	String content = request.getParameter("link");
	content = content + ".jsp";
	
	logger.info("content::"+content);
%>
<!doctype html>

<body>
	<jsp:include page="inc/header.jsp" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
	
	<div id="container_wrap">
		<jsp:include page="<%=content%>" flush="true">
			<jsp:param name="abc" value="abc"/>
		</jsp:include>
	</div>
	<jsp:include page="inc/footer.jsp" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
</body>