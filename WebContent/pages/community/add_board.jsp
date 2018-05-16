<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.Config" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>

<body>
	<form name="nse" method="post" onsubmit="return isValidForm(this);">
		<div class="board-write">
			<div class="board-write-tit">
				<dl>
					<dt>제목</dt>
					<dd>
					<input type="text" name="title" placeholder="제목을 입력하세요." class="ipt1" />
					</dd>
				</dl>
			</div>
			
			<textarea name="ir1" id="textAreaContent" cols="150"
					class="board-write-cont nse_content" placeholder="내용">
			</textarea>
		</div>
		<div class="bt_wrap ta-c">
			<input type="submit" value="작성" class="bt1 bt1-green"/>
			<input type="button" value="취소" class="bt1 bt1-black" onclick="javascript:window.close();"/>
		</div>
	</form>
</body>

<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "textAreaContent",
	    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	function isValidForm(clickedObj){
		if(confirm("완료하시겠습니까?")){			
			clickedObj.action = "/ActionWrite";
			oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", []);
		}else{
			return false;
		}
	}
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=Config.URL%>/upload/'+filepath+'" >';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}
</script>
</html>