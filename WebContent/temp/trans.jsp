<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<body>
	<form>
		<table>
			<tr>
				<th><input type="text" placeholder="한국돈입력" id="input_won"></th>
				<td><input type="button" value="환전(원->유로/프랑)" onclick="transKor()"></td>
			</tr>
			<tr>
				<th><input type="text" placeholder="유로화" id="input_euro"></th>
				<td><input type="button" value="환전(유로->원/프랑)" onclick="transEu()"></td>
			</tr>
			<tr>
				<th><input type="text" placeholder="퍼시픽프랑" id="input_pcf"></th>
				<td><input type="button" value="환전(프랑->원/유로)" onclick="transPcf()"></td>
			</tr>
		</table>
	</form>
</body>

<script type="text/javascript">
function transKor(){
	var input = $("#input_won").val();
	
	$("#input_pcf").val(input * 0.094);
	$("#input_euro").val(input * 0.00078);
}
function transPcf(){
	var input = $("#input_pcf").val();
	
	$("#input_won").val(input * 10.68);
	$("#input_euro").val(input * 0.0084);
}
function transEu(){
	var input = $("#input_euro").val();
	
	$("#input_won").val(input * 1275);
	$("#input_pcf").val(input * 119.35)
}
</script>
</html>