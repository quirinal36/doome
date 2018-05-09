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

<div class="media_list">
	<ul>
		<li>
			<form>
				<input id="media_input" type="text" placeholder="please input link hear"/>
				
				<div id="meta_target">
					<div style="width: 100px; float: left;">
						<img id="icon" style="width: 90px;" />
					</div>
					<div>
						<h2 id="title"></h2>
						<span id="description"></span>
					</div>
				</div>
				
				<div class="bt_wrap">
					<a href="#" target="_blank" class="bt1 bt1-green">저장</a>
				</div>
				<input type="hidden" name="meta_img" 		id="meta_img"/>
				<input type="hidden" name="meta_title" 		id="meta_title"/>
				<input type="hidden" name="meta_content" 	id="meta_content"/>
			</form>
		</li>
	</ul>
</div>
<div class="media_list">
	<ul>
		<li>
			<h6>홀로서기 성공한 두메산골 영농조합법인 - 전북도민일보</h6>
			<span>2018.05.09</span>
			<p>창사 21년을 맞는 두메산골 영농조합법인(대표 유현주).지난 2011년 사회적 약자를 돕기위해 사회적기업이 돼 2년 전 지원기간을 마치고 이제는 당당히 홀로 섰다.고령자, 장애우, 결혼이주여성, 저소득층 등 취약계층을 포함한 60명이 생업에 종사하며 연일 구슬 땀을 흘리고 있다.현재 매출규모가 수십억원이 되기까지 앞에서 진두지휘한 유현주 대표의 작품이라 해 </p>
			<div class="bt_wrap"><a href="#" target="_blank" class="bt1 bt1-green">원문보기</a></div>
		</li>
		<li>
			<h6>보도자료 제목</h6>
			<span>2018.05.09</span>
			<p>보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 </p>
			<div class="bt_wrap"><a href="#" target="_blank" class="bt1 bt1-green">원문보기</a></div>
		</li>
		<li>
			<h6>보도자료 제목</h6>
			<span>2018.05.09</span>
			<p>보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 보도자료 내용 </p>
			<div class="bt_wrap"><a href="#" target="_blank" class="bt1 bt1-green">원문보기</a></div>
		</li>
	</ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	// openPage(1);
	var url  = '/pages/community/announce_list.jsp';
	var data = 'pageNo=1' +'&totalCnt=<%=totalCount%>';
	$("#list").load(url + "?" + data);
});
$("#media_input").on('change',function(){
	var url = $(this).val();	
	var urlEncoded = encodeURIComponent(url);
	var apiKey = '5af2733f59a222f23d352153'; 

	// The entire request is just a simple get request with optional query parameters
	var requestUrl = "https://opengraph.io/api/1.1/site/" + urlEncoded + '?app_id=' + apiKey;

	$.getJSON(requestUrl, function( json ) {
	    // Throw the object in the console to see what it looks like!
	    console.log('json', json);
	    // Update the HTML elements!
	    $('#title').text(json.hybridGraph.title);
	    $('#description').text(json.hybridGraph.description);
	    $('#icon').attr('src', json.hybridGraph.image);
	    
	    $("#meta_img").val(json.hybridGraph.image);
	    $("#meta_title").val(json.hybridGraph.title);
	    $("#meta_content").val(json.hybridGraph.description);
	});
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
}
</script>