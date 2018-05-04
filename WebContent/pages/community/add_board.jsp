<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

<script type="text/javascript" src="/nse_files/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>

<body>
	<form name="nse" method="post" onsubmit="return isValidForm(this);">
		<div class="board-write">
			<div class="board-write-tit">
				<dl>
					<dt>제목</dt>
					<dd><input type="text" name="title" placeholder="제목을 입력하세요." class="ipt1" /></dd>
				</dl>
			</div>
			<textarea name="ir1" id="ir1" class="board-write-cont nse_content" placeholder="내용"></textarea>
		</div>
		<div class="bt_wrap ta-c">
			<input type="submit" value="작성" class="bt1 bt1-blue"/>
			<input type="button" value="취소" class="bt1 bt1-black" />
		</div>
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
	function isValidForm(clickedObj){
		if(confirm("완료하시겠습니까?")){			
			clickedObj.action = "/ActionWrite";
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		}else{
			return false;
		}
	}
	function submitContents(elClickedObj) {
		if(confirm("완료하시겠습니까?")){
			// 에디터의 내용이 textarea에 적용됩니다.
		    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		    return false;
		}
	    
	 	/*
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {
	    	
	    }
	    */
	}
</script>
</html>