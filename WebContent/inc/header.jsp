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
int loginUserId = 0;
String userLogin= "";

try{
	isLogin 	= (Boolean)session.getAttribute(Config.SESSION_IS_LOGIN);
	loginUserId = (Integer)session.getAttribute(Config.SESSION_LOGIN_USERID);
	userLogin	= (String)session.getAttribute(Config.SESSION_LOGIN_USERNAME);
}catch(Exception e){
	// e.printStackTrace();
}

String menuId = request.getParameter(Menu.MENUID_KEY);
%>
<!doctype html>
<script type="text/javascript">
$(function(){
	$("#gnb_wrap > ul > li").hover(function(){
		$(this).find("> div").stop().slideDown();
	}, function(){
		$(this).find("> div").stop().hide();
	});
});
</script>
<div id="header_wrap">
	<div>
		<h1><a href="<%=request.getContextPath()%>/index.jsp"><img src="/img/comm/logo.png" alt="<%=Config.TITLE %>" /></a></h1>
		
		<%if(!isLogin){ %>
		<div id="gnb_login">
			<a href="/admin/login.jsp"><img src="/img/comm/gnb_login.gif" alt="로그인" /></a>
		</div>
		<%}else{ %>
			<div id="gnb_login">
				<a href="javascript:logout()">logout</a>
			</div>
		<%} %>
		
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
		
		<div id="gnb_wrap">
			<jsp:include page="/inc/gnb.jsp" flush="true">
				<jsp:param name="aaa" value="bbb"/>
			</jsp:include>
		</div>
	</div>
</div>