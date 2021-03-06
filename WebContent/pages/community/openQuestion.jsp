<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="doome.broccoli.net.board.action.QuestionAction"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.logging.Logger"%>
<%
Logger logger = Logger.getLogger("openQuestion");

String boardNum = request.getParameter("board_num");
int boardNumInt = 0;
try{
	boardNumInt = Integer.parseInt(boardNum);
}catch(NumberFormatException e){
	e.printStackTrace();
}

QuestionAction action = new QuestionAction();
Board board = action.getQuestion(boardNumInt);

logger.info(board.toString());

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
						<dd>
						<%if(board.getUser() == 0){ %>
							<%=board.getUserName() %>
						<%}else{ %>
							<%=board.getWriterName() %>
						<%}%>
						</dd>
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
		window.location.href = "<%=request.getContextPath()%>/page.jsp?menu_id=15";
	});
</script>
