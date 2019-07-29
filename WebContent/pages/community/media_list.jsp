<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="doome.broccoli.net.board.bean.Media"%>
<%@page import="doome.broccoli.net.board.action.MediaAction"%>
<%@page import="doome.broccoli.net.board.bean.Board"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="doome.broccoli.net.board.action.BoardAction"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="doome.broccoli.net.board.bean.Paging"%>
<%
Logger logger = Logger.getLogger("media_list.jsp");
String pageNo = request.getParameter("pageNo");
pageNo = (pageNo == null || pageNo.equals("null")) ? "1" : pageNo;

String totalCntStr = request.getParameter("totalCnt");

int totalCount = Integer.parseInt(totalCntStr);

Paging paging = new Paging();
MediaAction action = new MediaAction();

if(pageNo != null && pageNo.length()>0){
	try{
		paging.setPageNo(Integer.parseInt(pageNo));
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
}

paging.setTotalCount(totalCount);
ArrayList<Media> list = action.getMedia();
Iterator<Media> iter = list.iterator();
%>
