<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	
<body>
<div id="wrap">
	<jsp:include page="inc/header.jsp" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
	
	<div id="idx_container_wrap">
		<div id="idx_container">
			<div id="idxA">
				<video preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
					<source src="http://www.thebroccoli.net/img/index/mov01.mp4">
				</video>
				<div><img src="/img/index/idxA_text.png" /></div>
			</div>
			<div id="idxB">
				<div>
					<h4>"두메산골 영농조합법인은 대한민국의 자랑스러운 브랜드입니다."</h4>
					<ul>
						<li>
							<img src="img/index/idxB1.jpg" alt="사회적기업">
							<h5>사회적기업</h5>
							<p>두메산골 영농조합법인은 창립초기부터 사회공헌 업적이 많아 2011년 당시 업계최초로 예비사회적기업을 거치지 않고 본 사회적기업으로 전환하였습니다. 현재 두메산골은 자랑스럽고 감사하게 지역 내 취약계층(저소득계층, 결혼이주여성, 장애우, 고령자 등)과 함께 더불어 성장하는 사회적기업으로 동행하고 있습니다.</p>
						</li>
						<li>
							<img src="img/index/idxB2.jpg" alt="전라북도지사 인증상품">
							<h5>전라북도지사 인증상품</h5>
							<p>전라북도 내 중소기업이 생산하는 제품들 중 품질이 우수하고 미래성장 가능성이 높은 상품을 발굴 및 육성하기 위해 전라북도지사가 직접 인증한 제품입니다. 전라북도 내 단 52개 기업만이 선정되었으며, 두메산골 영농조합법인은 ‘흑마늘숙성 오리훈제’ 상품으로 2011년부터 현재까지 8년 연속 선정되었습니다.</p>
						</li>
						<li>
							<img src="img/index/idxB3.jpg" alt="전주시 인증상품">
							<h5>전주시 인증상품</h5>
							<p>두메산골 영농조합법인의 신선하고 정직한 제품과 깨끗한 생산시설 공장(HACCP)은 각 분야에서 단 한 곳의 기업만 선택받는 깐깐한 인증제도에서 2011년부터 현재까지 8년 연속 선정될 수 있었던 힘이었습니다. 우리나라 최고의 맛의 고장 전주에서 당당하게 두메산골 영농조합법인의 제품을 최고로 인증받았습니다. </p>
						</li>
					</ul>
				</div>
			</div>
			<div id="idxC">
				<ul>
					<li id="idxC1"><a href="/page.jsp?link=pages/products/chicken&menu_id=8">닭고기</a></li>
					<li id="idxC2"><a href="/page.jsp?link=pages/products/duck&menu_id=9">오리고기</a></li>
					<li id="idxC3"><a href="/page.jsp?link=pages/products/smoked&menu_id=10">훈제</a></li>
					<li id="idxC4"><a href="/page.jsp?link=pages/products/egg&menu_id=11">계란</a></li>
				</ul>
			</div>
			<div id="idxD">
				<div>
					<h4>PARTNERSHIP</h4>
		            <p>두메산골영농조합법인의 우수품질 닭고기와 오리고기는 전라북도 완주군에 위치하고 있는 현대자동차 공장, KCC공장, 전북대학교 생활관, 전주동물원에 납품되고 있으며, 식재료 검수가 까다롭기도 유명한 전주시와 완주군의 초,중,고등학교에 우리 소중한 아이들이 먹을 건강한 제품이 납품되고 있습니다. 이마트,농협하나로마트, 로컬푸드등에서 두메산골영농조합법인의 제품을 만나실 수 있습니다.</p>
					<ul>
						<li><img src="img/index/idxD1.jpg" alt=""></li>
						<li><img src="img/index/idxD2.jpg" alt=""></li>
						<li><img src="img/index/idxD3.jpg" alt=""></li>
						<li><img src="img/index/idxD4.jpg" alt=""></li>
						<li><img src="img/index/idxD5.jpg" alt=""></li>
						<li><img src="img/index/idxD6.jpg" alt=""></li>
						<li><img src="img/index/idxD7.jpg" alt=""></li>
						<li><img src="img/index/idxD8.jpg" alt=""></li>
					</ul>
		            <a href="#">납품문의</a>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="inc/footer.jsp" flush="true">
		<jsp:param name="abc" value="abc"/>
	</jsp:include>
</div>
</body>
</html>