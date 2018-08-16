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
		<div id="question">
			<h1><span>궁금하신 내용을</span> <strong>카카오톡</strong>으로 문의하세요!</h1>
			<a href="#">카카오톡으로 문의하기</a>
			<ul id="question_process">
				<li id="question_process1"><span>카카오톡 열기</span></li>
				<li id="question_process2"><span>두메산골영농조합법인<br />검색 후 친구 추가</span></li>
				<li id="question_process3"><span>궁금한 내용 문의하기</span></li>
			</ul>
		</div>
		<div id="list">
			
		</div>
	</body>
	
	<script type="text/javascript">
	$(document).ready(function(){
		//var url  = '/pages/community/question_list.jsp';
		//var data = 'pageNo=1' +'&totalCnt=<%=totalCount%>';		
		//$("#list").load(url + "?" + data);
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