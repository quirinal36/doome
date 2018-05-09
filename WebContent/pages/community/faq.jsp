<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

/* FAQ */
.dl1_wrap > dl > dt { border:1px solid #ddd; border-top:0; background:url(/img/comm/dt1_icon1.png) no-repeat 15px 50%; padding:1.2em 1em 1.2em 42px; font-size:14px; font-weight:600; cursor:pointer; }
.dl1_wrap > dl:first-child > dt { border-top:1px solid #ddd; cursor:pointer; }
.dl1_wrap > dl > dd { display:none; padding:1em; background:#f5f5f5; border:1px solid #ddd; border-top:0; }
.dl1_wrap > dl > dt.dl1_dt_on { background-image:url(/img/comm/dt1_icon2.png); color:#3ba222; }

@media screen and ( max-width:599px ) {
.dl1_wrap > dl > dt { font-size:13px; }
}
</style>

<script>
$(function(){
	// FAQ
	$(".dl1_wrap dt").click(function(){
		$(this).toggleClass("dl1_dt_on");
		$(this).find('~dd').stop().slideToggle();
	});
});
</script>
<div class="dl1_wrap">
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