<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* { padding:0; margin:0; border:0; text-decoration:none; list-style:none; }
html { height:100%; }
body { height:100%; background-color:#eee; }
#wrap { width:100%; max-width:700px; min-width:320px; margin:0 auto; background:#fff; box-sizing:border-box; }
#wrap > p { background:#82a3ff; color:#fff; padding:30px; font-weight:600; }
#wrap > form { line-height:180%; padding:30px; }
input[type=text] { width:100px; margin:10px 0; padding:10px; border:1px solid #ddd; }
span { color:red; font-weight:600; }
</style>
</head>
<body>
	<div id="wrap">
		<p>1 EUR = 119.33 CEP</p>
		<form>
			1유로가 <input type="text" /> 원일 때<br />
			<input type="text" id="input_won"> 원은 <span>123</span> CEP<br />
			<input type="text" id="input_pcf"> CEP는 <span>123</span> 원
		</form>
	</div>
</body>

<script type="text/javascript">
function transKor(){
	var input = $("#input_won").val();
	console.log("input::" + input);
	$("#input_pcf").val(input * 1.3);
}
// 1000 : 1300
// 1300 * x = 1000;
function transPcf(){
	var input = $("#input_pcf").val();
	
	$("#input_won").val(input * 0.77);
}
</script>
</html>