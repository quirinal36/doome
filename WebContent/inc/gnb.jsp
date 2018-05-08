<%@page import="org.json.simple.JSONObject"%>
<%@page import="doome.broccoli.net.db.DBconn"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.menu.bean.Menu"%>
<%@page import="java.util.Iterator"%>
<%
Logger logger = Logger.getLogger("header.jsp");
/*
메뉴에 들어갈 문구들을 Database 에서 가져온다.
*/
DBconn conn = new DBconn();
JSONObject menuObj = conn.getMenus();
ArrayList<Menu> menus = conn.getMenus(menuObj);
ArrayList<Menu> parents = new ArrayList<>();  // 최상단 메뉴들을 저장할 공간

Iterator<Menu> iter = menus.iterator();
while(iter.hasNext()){
	Menu cur = iter.next();
	if(cur.getUpperId() == 0){
		parents.add(cur);
	}
}
iter = menus.iterator();
while(iter.hasNext()){
	Menu cur = iter.next();
	if(cur.getUpperId() > 0){
		parents.get(cur.getUpperId()-1).getChildren().add(cur);
	}
}
%>
<ul>
<%
	Iterator<Menu> pIter = parents.iterator();
	while(pIter.hasNext()){
		Menu cur = pIter.next();
		ArrayList<Menu> children = cur.getChildren();
		Iterator<Menu> cIter = children.iterator();
		%>
			<li><span><%=cur.getName() %></span>
				<%if(children.size() > 0){ %>
				<div>
					<ul>
					<%} %><%
							while(cIter.hasNext()){
								Menu subMenu = cIter.next();
								%><li><a href="<%=request.getContextPath() %>/page.jsp?link=<%=subMenu.getLink()%>&menu_id=<%=subMenu.getId()%>"><%=subMenu.getName()%></a></li>
								<%
							}
						%><%if(children.size() > 0){ %>
					</ul>
				</div>
				<%} %></li><%
	}
%>
</ul>

