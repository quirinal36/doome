<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.board.bean.Paging"%>
<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("announce.jsp");

BoardAction board = new BoardAction();
int totalCount = board.getBoardCount();
%>
	<!doctype html>

	<body>
		<!-- 전체 -->
		<div id="list">
			
		</div>
	</body>
	
	<script type="text/javascript">
	$(document).ready(function(){
		openPage(1);
	});
	function openPage(pageNum){
		$("#list").fadeOut();
		
		var url  = '/pages/community/announce_list.jsp';
		var data = 'pageNo='+pageNum +'&totalCnt=<%=totalCount%>';
		
		$.ajax({
			type : "get",
			url : url,
			data : data,
			success : function(response, textStatus, jqXHR){
				$("#list").html(response);
			}, 
			complete : function(){
				$("#list").fadeIn();
			}
		});
		// $("#list").load('/pages/community/announce_list.jsp?pageNo='+pageNum +'&totalCnt=<%=totalCount%>');
	}
	</script>