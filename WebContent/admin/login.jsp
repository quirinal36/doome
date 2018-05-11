<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/css.css" media="all" />
<style>
#login_wrap { position:relative; width:100%; height:100%; background:#ddd; }
#login_box { position:absolute; top:50%; left:0; width:100%; }
#login_box > form { width:250px; height:auto; margin:-105px auto 0 auto; padding:20px; background:#fff; box-shadow:0 0 10px #ddd; text-align:center; }
#login_box > form > a { display:block; margin-bottom:10px; font-size:15px; font-weight:600; }
#login_box > form > input { margin-bottom:10px; }
#login_box > form > input[type=submit] { width:100%; }
#login_box > form > div > a { font-size:12px; color:#777; }
#login_box > form > div > a:first-child { margin-right:25px; color:#000; }
</style>
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


</body>
</html>