<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#login_box > form { width:250px; height:auto; margin:0 auto; padding:20px; background:#fff; box-shadow:0 0 10px #ddd; text-align:center; }
#login_box > form > a.login_home { display:block; margin-bottom:10px; font-size:15px; font-weight:600; }
#login_box > form > input { margin-bottom:10px; }
#login_box > form > input[type=submit] { width:100%; }
#login_box > form > a.login_prev { font-size:12px; color:#777; }
</style>

<div id="login_wrap">
	<div id="login_box">
		<form>
			<input type="text" placeholder="아이디를 입력하세요." class="ipt2" />
			<input type="password" placeholder="비밀번호를 입력하세요." class="ipt2" />
			<input type="submit" value="LOGIN" class="bt1 bt1-green" />
			<a href="#" class="login_prev">이전 페이지로 이동</a>
		</form>
	</div>
</div>


