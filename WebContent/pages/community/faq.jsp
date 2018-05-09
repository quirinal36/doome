<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.board.bean.Faq"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.FAQAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
FAQAction action = new FAQAction();
ArrayList<Faq> list = action.getBoard();
Iterator<Faq> iter = list.iterator();
boolean isFirst = true;
%>
<form name="faq_add_form" method="post" onsubmit="return isValidForm(this);">
	<div class="faq_wrap">
	    <dl>
	    	<dt>
	    		<input type="text" placeholder="제목" name="faq_input_title">
	    	</dt>
	    	<dd>
	    		<input type="text" placeholder="내용" name="faq_input_content">
	    		<input type="submit" value="저장" class="bt1 bt1-blue">
	    	</dd>
	    </dl>
	    <%while(iter.hasNext()) {
	    	Faq item = iter.next();
	    	if(isFirst){
		    %>
			    <dl>
			        <dt><%=item.getTitle() %></dt>
			        <dd><%=item.getContent() %></dd>
			    </dl>
		    <%}else{ %>
			    <dl>
			        <dt><%=item.getTitle() %></dt>
			        <dd><%=item.getContent() %></dd>
			    </dl>
	    	<%
	    	}
	    	isFirst = false;
	    } %>
	</div>
</form>
<script>
$(function(){
	// FAQ
	$(".faq_wrap dt").click(function(){
		$(this).toggleClass("dl1_dt_on");
		$(this).find('~dd').stop().slideToggle();
	});
});

function isValidForm(clickedObj){
	if(confirm("저장하시겠습니까?")){
		clickedObj.action = "/ActionFaq";
	}else{
		return false;
	}
}
</script>