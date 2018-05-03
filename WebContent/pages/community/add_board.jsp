<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

<style>
.nse_content{width:660px;height:500px}
</style>

<script type="text/javascript" src="/nse_files/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>

<body>
    <form name="nse" action="/ActionWrite" method="post">
    	<div style="padding-bottom:30px;">
    		<input type="text" name="title" placeholder="제목" style="font-size:20px;"/>
    	</div>
    	
	    <textarea name="ir1" id="ir1" class="nse_content" placeholder="내용"></textarea>
	    
	    <input type="submit" value="전송" onclick="submitContents(this)"/>
	</form>
</body>

<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/nse_files/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	function submitContents(elClickedObj) {
		
	    // 에디터의 내용이 textarea에 적용됩니다.
	    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	 	/*
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {
	    	
	    }
	    */
	}
</script>
</html>