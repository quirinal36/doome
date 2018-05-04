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
<!doctype html>
<html>
	<head>
		<title><%=Config.TITLE%></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
		<META HTTP-EQUIV=”Pragma” CONTENT=”no-cache”>
		<meta charset="utf-8">
		<meta name="Title" content="<%=Config.TITLE%>" />
		<meta name="Description" content="<%=Config.DESCRIPTION%>" />
		<meta name="Keywords" content="<%=Config.KEYWORDS%>" />
		<meta name="Author" content="<%=Config.TITLE%>" />
		<meta name="robots" content="index, follow" />
		<meta property="og:type" content="website" />
		<meta property="og:site_name" content="<%=Config.TITLE%>" />
		<meta property="og:title" content="<%=Config.TITLE%>" />
		<meta property="og:description" content="<%=Config.DESCRIPTION%>" />
		<meta property="og:image" content="<%=Config.OG_IMG%>"/>
		<meta property="og:url" content="<%=Config.URL %>" />
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@WEBSITE" />
		<meta name="twitter:title" content="<%=Config.TITLE%>" />
		<meta name="twitter:description" content="<%=Config.DESCRIPTION%>" />
		<meta name="twitter:url" content="<%=Config.URL %>" />
		<meta name="twitter:image" content="<%=Config.OG_IMG%>" />
		<meta name="format-detection" content="telephone=no" />
		
		<link rel="stylesheet" type="text/css" href="css/css.css" media="all" />
		<link rel="stylesheet" type="text/css" href="css/page.css" media="all" />
		<link rel="shortcut icon" href="<%=Config.FAVICON%>">
		<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
	</head>
	<body>
		<div id="header_wrap">
			<div>
				<h1><a href="<%=request.getContextPath()%>/index.jsp"><%=Config.TITLE %></a></h1>
				<div id="gnb_wrap">
					<ul>
					<%
						Iterator<Menu> pIter = parents.iterator();
						while(pIter.hasNext()){
							Menu cur = pIter.next();
							ArrayList<Menu> children = cur.getChildren();
							Iterator<Menu> cIter = children.iterator();
							%>							
								<li><a href="<%=request.getContextPath() %>/page.jsp?link=<%=cur.getLink()%>&menu_id=<%=cur.getId()%>"><%=cur.getName() %></a>
									<%if(children.size() > 0){ %>
									<div>
										<ul>
										<%} %>
											<%
												while(cIter.hasNext()){
													Menu subMenu = cIter.next();
													%>
														<li><a href="<%=request.getContextPath() %>/page.jsp?link=<%=subMenu.getLink()%>&menu_id=<%=subMenu.getId()%>"><%=subMenu.getName()%></a></li>
													<%
												}
											%>
										<%if(children.size() > 0){ %>
										</ul>
									</div>
									<%} %>
								</li>
							
							<%
						}
					%>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>