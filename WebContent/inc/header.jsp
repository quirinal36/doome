<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.Iterator"%>
<%@page import="doome.broccoli.net.bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.Config"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="doome.broccoli.net.db.DBconn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("header.jsp");

DBconn conn = new DBconn();
JSONObject menuObj = conn.getMenus();
ArrayList<Menu> menus = conn.getMenus(menuObj);
ArrayList<Menu> parents = new ArrayList<>();

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
		logger.info(cur.toString());
		parents.get(cur.getUpperId()-1).getChildren().add(cur);
	}
}
%>
<div id="header_wrap">
	<div>
		<h1><a href="/"><%=Config.TITLE %></a></h1>
		<div id="gnb_wrap">
			<ul>
			<%
				Iterator<Menu> pIter = parents.iterator();
				while(pIter.hasNext()){
					Menu cur = pIter.next();
					logger.info(cur.toString());
					ArrayList<Menu> children = cur.getChildren();
					Iterator<Menu> cIter = children.iterator();
					%>
					
						<li><a href="#"><%=cur.getName() %></a>
							<%if(children.size() > 0){ %>
							<ul>
							<%} %>
								<%
									while(cIter.hasNext()){
										Menu subMenu = cIter.next();
										%>
											<li><a href="#"><%=subMenu.getName()%></a></li>
										<%
									}
								%>
							<%if(children.size() > 0){ %>
							</ul>
							<%} %>
						</li>
					
					<%
				}
			%>
			</ul>
		</div>
	</div>
</div>