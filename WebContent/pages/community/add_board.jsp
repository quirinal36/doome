<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.Config" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int loginId = 0;
Object loginIdSession = session.getAttribute(Config.SESSION_LOGIN_USERID);
if(loginIdSession != null){
	loginId = (Integer)loginIdSession;
}

String boardNum = request.getParameter("board_num");
int boardId = 0;
Board board = new Board();

if(boardNum !=null){
	boardId = Integer.parseInt(boardNum);
	board = new BoardAction().getBoard(boardId);
}
%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
</head>

<body>
	<form name="nse" method="post" onsubmit="return isValidForm(this);">
		<div class="board-write">
			<div class="board-write-tit">
				<dl>
					<dt>제목</dt>
					<dd>
					<%if(board.getTitle() != null && (loginId == board.getUser())) {%>
						<input type="text" name="title" placeholder="제목을 입력하세요." class="ipt1" value="<%=board.getTitle()%>"/>
					<%}else{ %>
						<input type="text" name="title" placeholder="제목을 입력하세요." class="ipt1" />
					<%} %>
					</dd>
				</dl>
			</div>
			
			<textarea name="ir1" id="textAreaContent" cols="150"
					class="board-write-cont nse_content" placeholder="내용">
					<%if(board.getContent() != null && (loginId == board.getUser())) {%>
						<%=board.getContent() %>
					<%} %>
			</textarea>
		</div>
		<div class="bt_wrap ta-c">
			<%if(boardId>0 && (loginId == board.getUser())) {%>
				<input type="submit" value="수정" class="bt1 bt1-green"/>
			<%}else if(loginId > 0){ %>
				<input type="submit" value="작성" class="bt1 bt1-green"/>
			<%} %>
		</div>
	</form>
</body>

<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "textAreaContent",
	    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	function isValidForm(clickedObj){
		if(confirm("완료하시겠습니까?")){			
			clickedObj.action = "/ActionWrite";
			oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", []);
		}else{
			return false;
		}
	}
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=Config.URL%>/upload/'+filepath+'" >';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}
</script>
</html>