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
		
<style>
#question { min-height:342px; padding-left:340px; background:url(/img/community/question_img.png) no-repeat 0 0; }
#question > h1 { margin-bottom:30px; font-size:36px; line-height:140%; font-weight:normal; }
#question > h1 > span { display:block; }
#question > h1 > strong { font-weight:600; }
#question > a { display:inline-block; height:46px; padding:22px 20px 0 88px; border-radius:5px; background:#f8d340 url(/img/community/question_link.gif) no-repeat 0 0; font-size:16px; font-weight:600; }
#question_process { display:block; width:100%; margin-top:40px; }
#question_process > li { display:inline-block; padding:0 0 0 8px; background:url(/img/community/question_process.png) no-repeat 0 30px; text-align:center; font-size:14px; vertical-align:top; }
#question_process > li:first-child { padding-left:0; background:none; }
#question_process > li > span { display:inline-block; padding-top:80px; line-height:160%; }
#question_process1 > span { padding-right:20px; background:url(/img/community/question_process1.png) no-repeat 50% 0; }
#question_process2 > span { padding:20px; background:url(/img/community/question_process2.png) no-repeat 50% 0; }
#question_process3 > span { padding-left:20px; background:url(/img/community/question_process3.png) no-repeat 50% 0; }


</style>		
		
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