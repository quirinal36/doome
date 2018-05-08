<%@page import="doome.broccoli.net.board.bean.Paging"%>
<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Paging paging = new Paging();
// paging.setFrom(0);
// paging.setTo(10);

BoardAction board = new BoardAction();
int totalCount = board.getBoardCount();
ArrayList<Board> list = board.getBoard(paging);
Iterator<Board> iter = list.iterator();

%>
<!doctype html>
<html>
<head>



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
		            	<div class="board-list-body-tit" 
		            		onclick="javascript:openLink('<%=item.getId() %>')">
		            		<%=item.getTitle() %>
		            	</div>
		            	<div class="board-list-body-wri"><%=item.getUser() %></div>
		            	<div class="board-list-body-dat"><%=item.getWriteDate() %></div>
		            </li>
		            <%} %>
		        </ul>
		    </div>
		</div>
		
		<div class="board-list-page">
			<a href="#"><img src="img/board/board-page-first.gif" alt="맨 처음 페이지로 가기"></a>
			<a href="#"><img src="img/board/board-page-prev.gif" alt="이전 페이지로 가기"></a>
			<a href="#" class="board-list-page-num board-list-page-num-on">1</a>
			<a href="#" class="board-list-page-num">2</a>
			<a href="#" class="board-list-page-num">3</a>
			<a href="#" class="board-list-page-num">4</a>
			<a href="#" class="board-list-page-num">5</a>
			<a href="#"><img src="img/board//board-page-next.gif" alt="다음 페이지로 가기"></a>
			<a href="#"><img src="img/board/board-page-last.gif" alt="마지막 페이지로 가기"></span></a>
		</div>
		
		<div class="bt_wrap">
			<input type="button" value="글쓰기" class="bt1 bt1-blue" id="write_button"/>
		</div>
	</body>
	
	<script type="text/javascript">
	function openLink(board_num){
		console.log("id::"+board_num);
		window.location = "<%=request.getContextPath()%>/page.jsp?menu_id=18&board_num="+board_num;
	}
	$("#write_button").click(function(){
		// console.log("write_button_click");
		window.location = "<%=request.getContextPath() %>/page.jsp?menu_id=16";
	});
	
	</script>
</html>