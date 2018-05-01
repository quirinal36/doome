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
logger.info("contextPath : : "+request.getContextPath());
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
		parents.get(cur.getUpperId()-1).getChildren().add(cur);
	}
}
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="Title" content="<%=Config.TITLE%>" />
		<meta name="Description" content="<%=Config.DESCRIPTION%>" />
		<meta name="Keywords" content="<%=Config.KEYWORDS%>" />
		<meta name="Author" content="<%=Config.TITLE%>" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
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
		<title><%=Config.TITLE%></title>
		<link rel="stylesheet" type="text/css" href="css/css.css" media="all" />
		<link rel="shortcut icon" href="<%=Config.FAVICON%>">
	</head>
	<body>
		<div id="header_wrap">
			<div>
				<h1><a href="<%=request.getContextPath() %>"><%=Config.TITLE %></a></h1>
				<div id="gnb_wrap">
					<ul>
					<%
						Iterator<Menu> pIter = parents.iterator();
						while(pIter.hasNext()){
							Menu cur = pIter.next();
							ArrayList<Menu> children = cur.getChildren();
							Iterator<Menu> cIter = children.iterator();
							%>
							
								<li><a href="<%=request.getContextPath() %>/page.jsp?link=<%=cur.getLink()%>"><%=cur.getName() %></a>
									<%if(children.size() > 0){ %>
									<ul>
									<%} %>
										<%
											while(cIter.hasNext()){
												Menu subMenu = cIter.next();
												%>
													<li><a href="<%=request.getContextPath() %>/page.jsp?link=<%=subMenu.getLink()%>"><%=subMenu.getName()%></a></li>
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
	</body>
</html>