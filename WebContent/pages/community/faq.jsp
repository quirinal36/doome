<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	// FAQ
	$(".faq_wrap dt").click(function(){
		$(this).toggleClass("dl1_dt_on");
		$(this).find('~dd').stop().slideToggle();
	});
});
</script>
<div class="faq_wrap">
    <dl>
        <dt>질문을 입력하세요.</dt>
        <dd>답변을 입력하세요.</dd>
    </dl>
    <dl>
        <dt>질문을 입력하세요.</dt>
        <dd>답변을 입력하세요.</dd>
    </dl>
    <dl>
        <dt>질문을 입력하세요.</dt>
        <dd>답변을 입력하세요.</dd>
    </dl>
    <dl>
        <dt>질문을 입력하세요.</dt>
        <dd>답변을 입력하세요.</dd>
    </dl>
</div>