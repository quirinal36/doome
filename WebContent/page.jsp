<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	final String contextPath = request.getContextPath().replace("/", "");

	final String pageHeaderJsp = "inc/page_header.jsp";
	final String pageFooterJsp = "inc/footer.jsp";
	
	Logger logger = Logger.getLogger("page.jsp");
	
	String content = request.getParameter("link");
	content = content + ".jsp";
	
%>
<!doctype html>

<body>
	<div id="wrap">
	
		<jsp:include page="<%=pageHeaderJsp %>" flush="true">
			<jsp:param name="abc" value="abc"/>
		</jsp:include>
		
		<div id="page_container_wrap">
			<div id="page_container">
				<div id="page_view">
					<jsp:include page="<%=content%>" flush="true">
						<jsp:param name="abc" value="abc"/>
					</jsp:include>
				</div>
			</div>
		</div>
		
		<jsp:include page="<%=pageFooterJsp %>" flush="true">
			<jsp:param name="abc" value="abc"/>
		</jsp:include>
		
	</div>
</body>