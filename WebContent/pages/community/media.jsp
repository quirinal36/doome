<%@page import="doome.broccoli.net.board.bean.Media"%>
<%@page import="doome.broccoli.net.board.action.MediaAction"%>
<%@page import="doome.broccoli.net.Config"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.board.bean.Paging"%>
<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("announce.jsp");

MediaAction action = new MediaAction();

ArrayList<Media> list = action.getMedia();
Iterator<Media> iter = list.iterator();

%>
<!doctype html>

<div class="media_list">
	<ul>
		<li>
			<form name="media_add_form" method="post" onsubmit="return isValidForm(this);">
				<input id="media_input" type="text" placeholder="복사하신 링크를 이곳에 붙여넣고 잠시만 기다리세요."/>
				<div class="media_ipt_view">
					<img src="" id="media_add_icon"/>
					<div>
						<h6><input id="media_add_title" 		name="media_add_title" type="text" value="" placeholder="제목을 입력하세요."></h6>
						<span><input id="media_add_date" 		name="media_add_date" type="text" value="" placeholder="날짜를 입력하세요."></span>
						<p><input id="media_add_description" 	name="media_add_description" type="text" value="" placeholder="내용을 입력하세요."></p>
					</div>
					<div class="bt_wrap ta-r">
						<input type="submit" class="bt1 bt1-green" value="저장">
					</div>
				</div>
				
				<input type="hidden" name="meta_img" 			id="meta_img"/>
				<input type="hidden" name="meta_title" 			id="meta_title"/>
				<input type="hidden" name="meta_content" 		id="meta_content"/>
				<input type="hidden" name="meta_published_time" id="meta_published_time"/>
				<input type="hidden" name="meta_url"			id="meta_url"/>
			</form>
		</li>
	</ul>
</div>

<div class="media_list">
	<ul>
		<%while(iter.hasNext()){
			Media item = iter.next();
		%>
		<li>
			<img src="<%=item.getImage() %>" />
			<div>
				<h6><%=item.getTitle() %></h6>
				<span><%=item.getDate()%></span>
				<p>
					<%=item.getContent() %>
				</p>
				<div class="bt_wrap">
				<a href="<%=item.getUrl()%>" target="_blank" class="bt1 bt1-green">원문보기</a></div>
			</div>
		</li>
		<%} %>
	</ul>
</div>
<script type="text/javascript">

$("#media_input").on('input',function(){
	var url = $(this).val();	
	var urlEncoded = encodeURIComponent(url);
	var apiKey = '<%=Config.OPEN_GRAPH_API%>'; 

	// The entire request is just a simple get request with optional query parameters
	var requestUrl = "https://opengraph.io/api/1.1/site/" + urlEncoded + '?app_id=' + apiKey;

	$.getJSON(requestUrl, function( json ) {
	    // Throw the object in the console to see what it looks like!
	    // Update the HTML elements!
	    var iso8601date = new Date(json.hybridGraph.articlePublishedTime);
	    var simpleDate = iso8601date.getFullYear() + "-" + (iso8601date.getMonth()+1) + "-" + iso8601date.getDate();
	    
	    $('#media_add_title').val(json.hybridGraph.title);
	    $('#media_add_description').val(json.hybridGraph.description);
	    $('#media_add_icon').attr('src', json.hybridGraph.image);
	    $('#media_add_date').val(simpleDate);
	    
	    $("#meta_img").val(json.hybridGraph.image);
	    $("#meta_title").val(json.hybridGraph.title);
	    $("#meta_content").val(json.hybridGraph.description);
	    $("#meta_published_time").val(simpleDate);
	    $("#meta_url").val(json.hybridGraph.url);
	});
});

function isValidForm(clickedObj){
	if(confirm("저장하시겠습니까?")){
		clickedObj.action = "/ActionMedia";
	}else{
		return false;
	}
}
</script>