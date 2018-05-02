<%@page import="doome.broccoli.net.bean.Menu"%>
<%@page import="doome.broccoli.net.db.DBconn"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
final String rootPath = request.getContextPath().replace("/" , "");
final String headerJsp = "header.jsp";
final String link = request.getParameter("link");
final String menuId = request.getParameter("menu_id");
Logger logger = Logger.getLogger("page_header.jsp");

DBconn conn = new DBconn();
Menu menuInfo = conn.getMenuInfo(menuId);
%>

<jsp:include page="<%=headerJsp%>" flush="true">
	<jsp:param name="abc" value="abc"/>
</jsp:include>

<div id="page_top" style="background-image:url(/img/comm/<%=menuInfo.getImage()%>)">
	<h2><%=menuInfo.getName() %></h2>
	<p>사물인터넷과 보안, 클라우드 등 IT 산업을 이끄는 리더로서, 한결 같은 마음으로</p>
</div>