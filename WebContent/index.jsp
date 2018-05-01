<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% %>
<!doctype html>
<html>
	
<body>

<jsp:include page="inc/header.jsp" flush="true">
	<jsp:param name="abc" value="abc"/>
</jsp:include>

<div id="container_wrap">
	<div id="idxA"></div>
	<div id="idxB">
		<div>
			<h4>두메산골은 전라북도의 자랑스러운 브랜드입니다.</h4>
			<ul>
				<li>
					<img src="img/index/idxB1.jpg" alt="사회적기업">
					<h5>사회적기업</h5>
					<p>취약계층에게 사회서비스 또는 일자리를 제공하여 지역주민의 삶의 질을 높이는 등의 사회적 목적을 추구하면서 재화 및 서비스의 생산·판매 등 영업활동을 수행하는 기업을 말한다.</p>
				</li>
				<li>
					<img src="img/index/idxB2.jpg" alt="전라북도지사 인증상품">
					<h5>전라북도지사 인증상품</h5>
					<p>취약계층에게 사회서비스 또는 일자리를 제공하여 지역주민의 삶의 질을 높이는 등의 사회적 목적을 추구하면서 재화 및 서비스의 생산·판매 등 영업활동을 수행하는 기업을 말한다.</p>
				</li>
				<li>
					<img src="img/index/idxB3.jpg" alt="전주시 인증상품">
					<h5>전주시 인증상품</h5>
					<p>취약계층에게 사회서비스 또는 일자리를 제공하여 지역주민의 삶의 질을 높이는 등의 사회적 목적을 추구하면서 재화 및 서비스의 생산·판매 등 영업활동을 수행하는 기업을 말한다.</p>
				</li>
			</ul>
		</div>
	</div>
	<div id="idxC">
		<ul>
			<li id="idxC1"><a href="#">닭고기</a></li>
			<li id="idxC2"><a href="#">오리고기</a></li>
			<li id="idxC3"><a href="#">훈제</a></li>
			<li id="idxC4"><a href="#">계란</a></li>
		</ul>
	</div>
	<div id="idxD">
		<div>
			<h4>PARTNERSHIP</h4>
            <p>취약계층에게 사회서비스 또는 일자리를 제공하여 지역주민의 삶의 질을 높이는 등의 사회적 목적을 추구하면서
재화 및 서비스의 생산·판매 등 영업활동을 수행하는 기업을 말한다.</p>
			<ul>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
				<li><img src="img/index/idxD1.jpg" alt=""></li>
			</ul>
            <a href="#">납품문의</a>
		</div>
	</div>
</div>

<jsp:include page="inc/footer.jsp" flush="true">
	<jsp:param name="abc" value="abc"/>
</jsp:include>
</body>
</html>