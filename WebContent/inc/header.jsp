<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="doome.broccoli.net.menu.bean.Menu"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.Config"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="doome.broccoli.net.db.DBconn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Logger logger = Logger.getLogger("header.jsp");
Random random = new Random();
int randomNum = random.nextInt(4)+1;
int menuLinkId= 7 + randomNum;

boolean isLogin = false;
try{
	isLogin = (Boolean)session.getAttribute("login_result");
}catch(NullPointerException e){
	// e.printStackTrace();
}
logger.info("isLogin::"+isLogin);
%>
<!doctype html>
	<head>
		<title><%=Config.TITLE%></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
		<META HTTP-EQUIV=”Pragma” CONTENT=”no-cache”>
		<meta charset="utf-8">
		<meta name="Title" content="<%=Config.TITLE%>" />
		<meta name="Description" content="<%=Config.DESCRIPTION%>" />
		<meta name="Keywords" content="<%=Config.KEYWORDS%>" />
		<meta name="Author" content="<%=Config.TITLE%>" />
		<meta name="robots" content="index, follow" />
		<meta property="og:type" content="website" />
		<meta property="og:site_name" content="<%=Config.TITLE%>" />
		<meta property="og:title" content="<%=Config.TITLE%>" />
		<meta property="og:description" content="<%=Config.DESCRIPTION%>" />
		<meta property="og:image" content="<%=Config.OG_IMG%>"/>
		<meta property="og:url" content="<%=Config.URL %>" />
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@WEBSITE" />
		<meta name="twitter:title" content="<%=Config.TITLE%>" />
		<meta name="twitter:description" content="<%=Config.DESCRIPTION%>" />
		<meta name="twitter:url" content="<%=Config.URL %>" />
		<meta name="twitter:image" content="<%=Config.OG_IMG%>" />
		<meta name="format-detection" content="telephone=no" />
		<link rel="stylesheet" type="text/css" href="css/css.css" media="all" />
		<link rel="shortcut icon" href="<%=Config.FAVICON%>">
		<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	</head>
	<body>
		<div id="header_wrap">
			<div>
				<h1><a href="<%=request.getContextPath()%>/index.jsp"><img src="/img/comm/logo.png" alt="<%=Config.TITLE %>" /></a></h1>
				<div id="gnb_wrap">
					<jsp:include page="./gnb.jsp" flush="true">
						<jsp:param name="aaa" value="bbb"/>
					</jsp:include>
				</div>
				<div id="gnb_login">
					<a href="/admin/login.jsp"><img src="/img/comm/gnb_login.gif" alt="로그인" /></a>
				</div>
				<div id="gnb_wrap_mobile">
					<div id="gnb_menu">
						<img src="/img/comm/gnb_menu.png" alt="메뉴 열기" />
					</div>
					<div id="gnb_menu_open">
						<div>
							<div id="gnb_menu_open_title">
								<h1><a href="/"><img src="/img/comm/logo.png" alt="두메산골영농조합법인" /></a></h1>
								<img src="/img/comm/gnb_close.png" alt="닫기" />
							</div>
							<jsp:include page="./gnb.jsp" flush="true">
								<jsp:param name="aaa" value="bbb"/>
							</jsp:include>
							
							<div id="gnb_banner">
								<a href="/page.jsp?menu_id=<%=menuLinkId%>"><img src="/img/comm/gnb_banner<%=randomNum %>.jpg" alt="닭고기 전체상품보기" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script>
$(function(){
	$("#gnb_menu img").click(function() {
		$("#gnb_menu_open").fadeIn();
	});
	$("#gnb_menu_open_title img").click(function() {
		$("#gnb_menu_open").hide();
	});
	$("#gnb_menu_open span").click(function() {
		$(this).toggleClass("gnb_menu_on");
		$(this).find("~div").stop().slideToggle(300);
	});
});
</script>