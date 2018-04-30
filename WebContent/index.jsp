<%@page import="doome.broccoli.net.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>두메산골영농조합법인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<link rel="stylesheet" type="text/css" href="css/css.css" media="all" />
<style>
#header_wrap { height:60px; border-bottom:1px solid #ddd; }
#header_wrap > div { width:1000px; margin:0 auto; }
#header_wrap > div > h1 { float:left; padding-top:20px; font-size:16px; font-weight:600; }
#gnb_wrap { float:right; }
#gnb_wrap > ul { font-size:0; }
#gnb_wrap > ul > li { position:relative; display:inline-block; width:120px; vertical-align:top; text-align:center; }
#gnb_wrap > ul > li > a { display:block; padding-top:22px; height:38px; font-size:14px; }
#gnb_wrap > ul > li:hover > a { font-weight:600; }
#gnb_wrap > ul > li > ul { display:none; position:absolute; top:60px; left:0; width:120px; padding:10px 0; background:#fff; }
#gnb_wrap > ul > li:hover > ul { display:block; }
#gnb_wrap > ul > li > ul > li > a { display:block; padding:5px 0; font-size:13px; }
#gnb_wrap > ul > li > ul > li > a:hover { text-decoration:underline; }

#idxA { width:100%; height:560px; background:url(img/index/idxA_bg.jpg) no-repeat 30% 70%; background-size:cover; }
#idxB > div { width:1000px; margin:0 auto; padding:80px 0; text-align:center; }
#idxB > div > h4 { margin-bottom:60px; font-size:24px; font-weight:normal; }
#idxB > div > ul { font-size:0; }
#idxB > div > ul > li { display:inline-block; width:28%; margin-left:8%; font-size:12px; }
#idxB > div > ul > li:first-child { margin-left:0; }
#idxB > div > ul > li > h5 { margin:20px 0; font-size:16px; font-weight:600; }
#idxB > div > ul > li > p { text-align:left; color:#777; line-height:160%; }

#idxC > ul { font-size:0; text-align:center; }
#idxC > ul > li { display:inline-block; width:25%; background:#000; }
#idxC > ul > li > a { display:block; width:100%; height:240px; padding-top:200px; background-size:cover; background-position:50% 50%; background-repeat:no-repeat; opacity:0.6; font-size:30px; color:#fff; transition:all 1s ease; }
#idxC1 > a { background-image:url(img/index/idxC1.jpg); }
#idxC2 > a { background-image:url(img/index/idxC2.jpg); }
#idxC3 > a { background-image:url(img/index/idxC1.jpg); }
#idxC4 > a { background-image:url(img/index/idxC2.jpg); }
#idxC > ul > li > a:hover { opacity:1; }
</style>

</head>
<body>
<div id="header_wrap">
	<div>
		<h1><a href="/">두메산골영농조합법인</a></h1>
		<div id="gnb_wrap">
			<ul>
				<li><a href="#">회사소개</a>
					<ul>
						<li><a href="#">대표 인사말</a></li>
						<li><a href="#">브랜드스토리</a></li>
						<li><a href="#">오시는 길</a></li>
					</ul>
				</li>
				<li><a href="#">제품소개</a>
					<ul>
						<li><a href="#">닭고기</a></li>
						<li><a href="#">오리고기</a></li>
						<li><a href="#">훈제</a></li>
						<li><a href="#">계란</a></li>
					</ul>
				</li>
				<li><a href="#">인증현황</a></li>
				<li><a href="#">커뮤니티</a>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">보도자료</a></li>
						<li><a href="#">자주 묻는 질문</a></li>
						<li><a href="#">1:1 문의</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
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


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


</body>
</html>