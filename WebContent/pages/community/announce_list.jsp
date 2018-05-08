<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.board.bean.Paging"%>
<%
Logger logger = Logger.getLogger("announce.jsp");

String pageNo = request.getParameter("pageNo");
pageNo = (pageNo == null || pageNo.equals("null")) ? "1" : pageNo;

String totalCntStr = request.getParameter("totalCnt");

int totalCount = Integer.parseInt(totalCntStr);

Paging paging = new Paging();
BoardAction board = new BoardAction();
if(pageNo !=null && pageNo.length()>0){
	try{
		paging.setPageNo(Integer.parseInt(pageNo));
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
}else{
	paging.setPageNo(1);
}
paging.setTotalCount(totalCount);

ArrayList<Board> list = board.getBoard(paging);
Iterator<Board> iter = list.iterator();
%>

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
	<a href="javascript:openPage('<%=paging.getStartPageNo()%>')"><img src="img/board/board-page-first.gif" alt="맨 처음 페이지로 가기"></a>
	<a href="javascript:openPage('<%=paging.getPrevPageNo()%>')"><img src="img/board/board-page-prev.gif" alt="이전 페이지로 가기"></a>
	<%
		for(int i=1; i<=paging.getFinalPageNo(); i++){
			if(paging.getPageNo() == i){
				%>
				<a href="javascript:openPage('<%=i%>');" 
					class="board-list-page-num board-list-page-num-on"><%=i%></a>
				<%
			}else{
				%>
				<a href="javascript:openPage('<%=i%>');" 
					class="board-list-page-num"><%=i%></a>
				<%
			}
		}
	%>
	<a href="javascript:openPage('<%=paging.getNextPageNo()%>')"><img src="img/board//board-page-next.gif" alt="다음 페이지로 가기"></a>
	<a href="javascript:openPage('<%=paging.getFinalPageNo()%>')"><img src="img/board/board-page-last.gif" alt="마지막 페이지로 가기"></span></a>
</div>

<div class="bt_wrap ta-r">
	<input type="button" value="글쓰기" class="bt1 bt1-blue" id="write_button"/>
</div>

<script type="text/javascript">
function openLink(board_num){
	window.location = "<%=request.getContextPath()%>/page.jsp?menu_id=18&board_num="+board_num;
}
$("#write_button").click(function(){
	// console.log("write_button_click");
	window.location = "<%=request.getContextPath() %>/page.jsp?menu_id=16";
});

</script>