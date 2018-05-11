<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="/css/css.css" media="all" />
	</head>
		
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

	
	<script type="text/javascript">
	function buttonClick(){
		var passphrase = "12341234";
		var hash = CryptoJS.AES.encrypt($("#login_pwd").val(), passphrase);
		$("#para_pwd").val(hash);
		validForm();
	}
	function validForm(){
		var param = $("#login_form").serialize();
		if(confirm("로그인 하시겠습니까?")){
			$.ajax({
				type:"POST",
				url : "/ActionLogin",
				data : param,
				success : function(data){
					if(data == 'true'){
						alert("로그인 성공.");
						location.href = "<%=request.getContextPath()%>/index.jsp";
					}else{
						alert("로그인 실패");
					}
				}
			});
			return true;
		}else{
			return false;
		}
	}
	</script>

</html>