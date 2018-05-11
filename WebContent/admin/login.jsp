<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/css.css" media="all" />
</head>
<body>
<div id="wrap">


	<div id="login_wrap">
		<div id="login_box">
			<form>
				<a href="/">두메산골영농조합법인</a>
				<input type="text" placeholder="아이디를 입력하세요." class="ipt2" />
				<input type="password" placeholder="비밀번호를 입력하세요." class="ipt2" />
				<input type="submit" value="LOGIN" class="bt1 bt1-green" />
				<div>
					<a href="./signUp.jsp">회원가입</a>
					<a href="javascript:history.back();">이전 페이지로 이동</a>
				</div>
			</form>
		</div>
	</div>
</div>


</body>
</html>