<%@page import="doome.broccoli.net.board.action.QuestionAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="doome.broccoli.net.board.bean.Paging"%>
<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@page import="java.util.logging.Logger"%>
<%
Logger logger = Logger.getLogger("question.jsp");

QuestionAction board = new QuestionAction();
int totalCount = board.getQuestionCount();
%>
	<!doctype html>

	<body>
		<!-- 전체 -->
		<div id="list">
			
		</div>
	</body>
	
	<script type="text/javascript">
	$(document).ready(function(){
		var url  = '/pages/community/question_list.jsp';
		var data = 'pageNo=1' +'&totalCnt=<%=totalCount%>';		
		$("#list").load(url + "?" + data);
	});
	function openPage(pageNum){
		$("#list").fadeOut();
		
		var url  = '/pages/community/question_list.jsp';
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
	}
	</script>