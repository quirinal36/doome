<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<form method="post" id="sign_up_form">
	<input type="text" name="login_id" placeholder="아이디를 입력하세요"/>
	<input type="email" name="login_email" placeholder="이메일을 입력하세요"/>
	<input type="password" id="login_pwd" placeholder="비밀번호를입력하세요"/>
	<input type="hidden" name="login_pwd" id="para_pwd"/>
	<input type="button" onclick="buttonClick();" value="가입"/>
</form>

<script type="text/javascript">
	function buttonClick(){
		var passphrase = "12341234";
		var hash = CryptoJS.AES.encrypt($("#login_pwd").val(), passphrase);
		$("#para_pwd").val(hash);
		validForm();
	}
	
	function validForm(){
		var param = $("#sign_up_form").serialize();
		if(confirm("저장하시겠습니까?")){
			$.ajax({
				type:"POST",
				url : "/ActionSignUp",
				data : param,
				success : function(data){
					console.log(data);
					alert("회원가입이 승인되었습니다.");
					
				}
			});
			return true;
		}else{
			return false;
		}
	}
</script>