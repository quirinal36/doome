<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.menu.bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.menu.action.MenuAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MenuAction action = new MenuAction();
ArrayList<Menu> menus = action.getMenus();
Iterator<Menu> iter = menus.iterator();
%>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<table border="1">
	
	<tr>
		<th>카테고리</th>
		<th>이름</th>
		<th>링크</th>
		<th>이미지</th>
		<th>설명</th>
		<th></th>
	</tr>
	<%while(iter.hasNext()){
		Menu item = iter.next();
	%>
	<tr id="<%=item.getId() %>">
		<td><input type="text" value="<%=item.getId() %>" name="<%=Menu.ID_KEY%>"/></td>
		<td><input type="text" value="<%=item.getName()==null ? "" : item.getName() %>" name="<%=Menu.NAME_KEY%>"/></td>
		<td><input type="text" value="<%=item.getLink()==null ? "" : item.getLink() %>" name="<%=Menu.LINK_KEY%>"/></td>
		<td><input type="text" value="<%=item.getImage()==null ? "" : item.getImage() %>" name="<%=Menu.IMAGE_KEY%>"/></td>
		<td><input type="text" value="<%=item.getPageDescription()==null ? "" : item.getPageDescription() %>" name="<%=Menu.DESCRIPTION_KEY%>"/></td>
		<td><input type="button" value="저장" onclick="javascript:save('<%=item.getId()%>')"/></td>
	</tr>
	<%} %>
	
</table>

<script type="text/javascript">
function save(id){
	var url = "/ActionMenuInsert";
	
	var param = "";
	$("#"+id).children("td").each(function(){
		// console.log($(this).val());
		var val = $(this).find("input").val();
		var name = $(this).find("input").attr("name");
		
		param = param + "&"+ name + "=" + val;
	});
	
	if(confirm("저장")){
		$.ajax({
			type:"POST",
			url : "/ActionMenuInsert",
			data : param,
			success : function(data){
				alert(data);
			}
		});
	}
}
</script>