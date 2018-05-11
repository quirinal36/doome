<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/css.css" media="all" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	</head>
		
	<div id="wrap">
		<div id="login_wrap">
			<div id="login_box">
				<form method="POST" onsubmit="return validForm(this);">
					<a href="/">두메산골영농조합법인</a>
					<input type="text" name="login_id" placeholder="아이디를 입력하세요." class="ipt2" />
					<input type="password" name="login_pwd" placeholder="비밀번호를 입력하세요." class="ipt2" />
					<input type="submit" value="LOGIN" class="bt1 bt1-green"/>
					<div>
						<a href="./signUp.jsp">회원가입</a>
						<a href="javascript:history.back();">이전 페이지로 이동</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	
	<script type="text/javascript">
	
	function validForm(form){
		if(confirm("로그인 하시겠습니까?")){
			form.action = "/ActionLogin";
		}else{
			return false;
		}
	}
	</script>

</html>