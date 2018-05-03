<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.bean.Pagination"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Pagination paging = new Pagination();
paging.setFrom(0);
paging.setTo(10);

BoardAction board = new BoardAction();
ArrayList<Board> list = board.getBoard(paging);
Iterator<Board> iter = list.iterator();

%>
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
		    		<%
		    		while(iter.hasNext()){
		    			Board item = iter.next();
		    		%>
		        	<li>
		            	<div class="board-list-body-num"><%=item.getId() %></div>
		            	<div class="board-list-body-tit"><%=item.getTitle() %></div>
		            	<div class="board-list-body-wri"><%=item.getUser() %></div>
		            	<div class="board-list-body-dat"><%=item.getWriteDate() %></div>
		            </li>
		            <%} %>
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