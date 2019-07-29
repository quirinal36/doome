<%@page import="doome.broccoli.net.Config"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String boardNum = request.getParameter("board_num");
int boardNumInt = 0;
try{
	boardNumInt = Integer.parseInt(boardNum);
}catch(NumberFormatException e){
	e.printStackTrace();
}

BoardAction action = new BoardAction();
Board board = action.getBoard(boardNumInt);
int loginUserId = -1;
try{
	loginUserId = (Integer)session.getAttribute(Config.SESSION_LOGIN_USERID);
}catch(NullPointerException e){
	
}
%>
<div class="board-view">
	<div class="board-view-tit">
		<div class="board-view-tit-line1">
			<dl>
				<dt>제목</dt>
				<dd><%=board.getTitle() %></dd>
			</dl>
		</div>
		<div class="board-view-tit-line2">
			<ul>
				<li>
					<dl>
						<dt>글쓴이</dt>
						<dd><%=board.getWriterName() %></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>날짜</dt>
						<dd><%=board.getWriteDate() %></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
	<div class="board-view-cont">
		<%=board.getContent() %>
	</div>
</div>

<div class="bt_wrap ta-r">
   <input type="button" value="목록" class="bt1 bt1-green" id="button_to_list"/>
   <%if(board.getUser() == loginUserId){ %>
	   <input type="button" value="수정" class="bt1 bt1-black" id="button_to_update"/>
	   <input type="button" value="삭제" class="bt1 bt1-black" id="button_to_delete"/>
   <%} %>
</div>

<script type="text/javascript">
	$("#button_to_list").on("click", function(){
		window.location.href = "<%=request.getContextPath()%>/page.jsp?menu_id=12";
	});
	$("#button_to_update").on("click", function(){
		window.location.href = "<%=request.getContextPath()%>/page.jsp?menu_id=16&board_num=<%=boardNumInt%>";
	});
	$("#button_to_delete").on("click", function(){
		if(confirm("공지사항을 삭제하시겠습니까?")){
			
			var param = {"num" : '<%=boardNumInt%>'};
			$.ajax({
				type : "POST",
				url  : "/deleteBoard",
				data : param,
				success : function(data){
					var jsonResult = JSON.parse(data);
					var result = jsonResult.result;
					if(result > 0){
						alert("공지사항이 삭제되었습니다.");
						window.location.href = "<%=request.getContextPath()%>/page.jsp?menu_id=12";
					}
				}
			});
		}
	});
</script>
