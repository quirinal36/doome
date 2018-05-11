<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/css.css" media="all" />
</head>

<body>
<div id="wrap">
	<div id="signUp_wrap">
		<div id="signUp_box">
			<form method="post" id="sign_up_form">
				<h4 href="/">회원가입</h4>
				<dl>
					<dt>아이디</dt>
					<dd><input type="text" name="login_id" placeholder="아이디를 입력하세요." class="ipt2" /></dd>
				</dl>
				<dl>
					<dt>비밀번호</dt>
					<dd>
						<input type="password" id="login_pwd" placeholder="비밀번호를 입력하세요." class="ipt2" />
						<input type="hidden" name="login_pwd" id="para_pwd"/>
					</dd>
				</dl>
				<dl>
					<dt>이메일</dt>
					<dd><input type="email" name="login_email" placeholder="이메일을 입력하세요." class="ipt2" /></dd>
				</dl>
				<input type="button" onclick="buttonClick();" value="가입" class="bt1 bt1-green" />
				<div>
					<a href="javascript:history.back();">이전 페이지로 이동</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	function buttonClick(){
		var passphrase = "<%=Config.PASSPHRASE%>";
		var hash = CryptoJS.AES.encrypt($("#login_pwd").val(), passphrase);
		$("#para_pwd").val(hash);
		validForm();
	}
	
	function validForm(){
		var param = $("#sign_up_form").serialize();
		if(confirm("입력하신 정보로 회원가입을 진행하시겠습니까?")){
			$.ajax({
				type:"POST",
				url : "/ActionSignUp",
				data : param,
				success : function(data){
					alert("회원가입이 승인되었습니다.");
					location.href = "<%=request.getContextPath()%>/index.jsp";
				}
			});
			return true;
		}else{
			return false;
		}
	}
</script>
</body>