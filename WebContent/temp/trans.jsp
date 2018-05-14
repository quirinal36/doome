<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<body>
	<form>
		<table>
			<tr>
				<th><input type="text" placeholder="한국돈입력" id="input_won"></th>
				<td><input type="button" value="환전(원->프랑)" onclick="transKor()"></td>
			</tr>
			<tr>
				<th><input type="text" placeholder="퍼시픽프랑" id="input_pcf"></th>
				<td><input type="button" value="환전(프랑->원)" onclick="transPcf()"></td>
			</tr>
		</table>
	</form>
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