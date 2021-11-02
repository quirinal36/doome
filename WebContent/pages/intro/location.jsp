<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=137e9e75b0501c1955976ef3cc2ad4a1"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(35.800878, 127.085757), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var imageSrc = '/img/intro/marker.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(150, 51), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(75, 51)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(35.800878, 127.085757); // 마커가 표시될 위치입니다
// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});
// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
</script>




<div class="location_box1">
	<ul>
		<li><strong>주소</strong>. [55071]전라북도 전주시 완산구 능안자구길 53</li>
		<li><strong>TEL</strong>. 063-211-6684~5</li>
		<li><strong>FAX</strong>. 063-211-6683</li>
		<li><strong>E-mail</strong>. dyj1012@hanmail.net</li>
	</ul>
</div>