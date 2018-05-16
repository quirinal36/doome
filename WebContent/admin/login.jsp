<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.menu.bean.Menu"%>
<%@page import="doome.broccoli.net.admin.bean.User"%>
<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("header.jsp");
String menuId = request.getParameter(Menu.MENUID_KEY);
%>
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
				<form id="login_form">
					<a href="/">두메산골영농조합법인</a>
					<input type="text" 		id="login_id"	name="login_id" 	placeholder="아이디를 입력하세요." 	class="ipt2" required/>
					<input type="password" 	id="login_pwd"	name="login_pwd" 	placeholder="비밀번호를 입력하세요." 	class="ipt2" required/>
					<span id="error_txt"></span>
					
					<input type="button" 	value="LOGIN" 	class="bt1 bt1-green" onclick="validForm();"/>
					<div>
						<a href="./signUp.jsp">회원가입</a>
						<a href="javascript:history.back();">이전 페이지로 이동</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	function validForm(){
		var param	=	$("#login_form").serialize();
		
		if(confirm("로그인 하시겠습니까?")){
			$.ajax({
				type : "POST",
				url  : "/ActionLogin",
				data : param,
				success : function(data){
					var obj = JSON.parse(data);
					var login_result = obj.login_result;
					$("#error_txt").html(obj.error_txt);
					
					if(login_result == "<%=User.NO_LOGIN%>"){
						$("#login_id").focus();
						$("#error_txt").show();
					}else if(login_result == "<%=User.PWD_INVALID%>"){
						$("#login_pwd").focus();
						$("#error_txt").show();
					}else if(login_result == "<%=User.SUCCESS_LOGIN%>"){
						alert("로그인에 성공했습니다.");
						$("#error_txt").hide();
						location.href = "<%=request.getContextPath()%>/index.jsp";
					}
				}
			});
		}else{
			return false;
		}
	}
	</script>

</html>