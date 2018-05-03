<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
	<body>
		<!-- 전체 -->
		<div class="board-list">
			<!-- 타이틀 -->
			<div class="board-list-head">
		        <div class="board-list-head-num">번호</div>
		        <div class="board-list-head-tit">제목</div>
		        <div class="board-list-head-wri">글쓴이</div>
		        <div class="board-list-head-dat">날짜</div>
		    </div>
			<!-- 리스트 -->
			<div class="board-list-body">
		    	<ul>
		        	<li>
		            	<div class="board-list-body-num">1</div>
		            	<div class="board-list-body-tit">제목</div>
		            	<div class="board-list-body-wri">글쓴이</div>
		            	<div class="board-list-body-dat">날짜</div>
		            </li>
		        </ul>
		    </div>
		</div>
		
		<div class="bt_wrap">
			<input type="button" value="글쓰기" class="bt1 bt1-blue" id="write_button"/>
		</div>
	</body>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
	});
	$("#write_button").click(function(){
		// console.log("write_button_click");
		window.location = "<%=request.getContextPath() %>/page.jsp?menu_id=16";
	});
	
	</script>
</html>