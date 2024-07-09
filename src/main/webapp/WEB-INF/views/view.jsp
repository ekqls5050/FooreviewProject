<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/FinalProject0430/css/dis2.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<style>

header {
	position: relative;
	border-bottom: 3px solid black;
	height: 150px; /* 헤더 높이를 150px로 조정합니다. */
	margin-top: 20px;
}

aside {
	margin: 10px;
}

#rogo {
	position: absolute;
	left: 0;
	right: 0;
	margin: auto;
	display: flex;
	justify-content: center;
	width: 300px;
	top: 0;
	margin-top: -10px;
}

.mybox {
	padding: 0;
	width: 220px;
	height: 310px;
	border: 3px solid black;
	border-radius: 30px;
	list-style: none;
	margin: 10px;
}

form {
	display: flex;
	align-items: center;
	justify-content: flex-end; /* 수평 정렬을 위해 요소를 우측으로 정렬 */
	position: absolute;
	top: 95px; /* 헤더 내부의 검색 폼 요소가 헤더 안에 위치하도록 조정합니다. */
	right: 20px; /* 오른쪽으로 여유 공간을 두어 정렬합니다. */
}

form select[name="searchField"], form input[name="searchWord"], form button
	{
	margin-right: 10px; /* 각 요소 사이의 간격 조정 */
}

form button.log {
	margin-right: 20px; /* 검색 버튼과 다른 요소 사이의 간격을 더 크게 조정 */
}

input {
	border: 3px solid black;
	border-radius: 30px;
	top: -30px;
	margin-right: 10px; /* 검색 필드와 다른 요소 사이의 간격을 조정 */
}

.mybox p {
	display: inline-block;
	margin-left: 5px;
	margin-top: 10px;
}

.mybox img {
	margin: 30px 0 0 20px;
}

.mybox span {
	position: relative;
	top: -10px;
	left: 5px;
}

.aa li {
	margin: 20px;
	margin-left: 30px;
	cursor: pointer;
}

.img {
	margin-left: 50px;
	width: 100px;
}

.img p {
	text-align: center;
	margin: 0;
}

.aa li:hover {
	text-decoration: underline 3px solid black;
}

.log {
	display: inline-block;
	margin: 5px;
	text-align: center;
	background-color: #4CAF50;
	color: #2c2b29;
	border: 4px solid black;
	border-radius: 50px;
	width: 90px;
	height: 30px;
	display: inline-block;
	justify-content: center;
	align-items: center;
	margin-bottom: 15px;
	top: -20px;
}

button:hover {
	background-color: #45a049;
}

.food-wrap {
	display: flex;
	align-items: flex-start;
	justify-content: flex-start;
}

.leftbox {
	display: flex;
	margin: 10px;
	height: 750px;
	flex-direction: column;
}

.aa {
	width: 220px;
	border: 3px solid black;
	border-radius: 30px;
	margin-left: 10px;
	flex-direction: column;
}

.food {
	object-fit: cover;
}

.superbox:after {
	content: "";
	display: block;
	clear: both;
}

.superbox .leftbox {
	float: left;
	width: 230px;
}

.superbox .rightbox {
	float: left;
	width: calc(100% - 230px);
}

.rightbox .up {
	display: flex;
	justify-content: center;
	align-items: center;
}

.rightbox .smallbox {
	overflow: hidden;
	margin-top: 20px;
	margin: 16px;
	border: 3px solid black;
	border-radius: 30px;
	flex-direction: column;
}

.rightbox .down {
	display: flex;
	justify-content: center;
	align-items: center;
}

p img {
	margin-top: 8px;
}

.food-info-grp {
	padding: 8px 8px 12px;
}

.rrightbox {
	display: flex;
	flex-wrap: wrap; /* 오른쪽으로 넘어가는 경우를 고려하여 줄 바꿈 설정 */
}
</style>

	<script>
		if(${not empty error}){
			alert("${error}")
		}
		if(${not empty success}){
			alert("${success}")
		}

	</script>
<body>
	<header>
		<div class="img">
			<img src="/FinalProject0430/img/이미지3/${board.food}.png" class="food">
			<c:forEach var="food" items="${board.food}">
				<c:choose>
					<c:when test="${food eq 'achicken'}">
						<p>치킨</p>
					</c:when>
					<c:when test="${food eq 'bpizza'}">
						<p>피자</p>
					</c:when>
					<c:when test="${food eq 'cgogi'}">
						<p>고기</p>
					</c:when>
					<c:when test="${food eq 'dzzim'}">
						<p>찜 · 탕 · 찌개</p>
					</c:when>
					<c:when test="${food eq 'ejok'}">
						<p>족발 · 보쌈</p>
					</c:when>
					<c:when test="${food eq 'fkaz'}">
						<p>돈까스</p>
					</c:when>
					<c:when test="${food eq 'gjapanesef'}">
						<p>회 · 일식</p>
					</c:when>
					<c:when test="${food eq 'hkoreanf'}">
						<p>한식</p>
					</c:when>
					<c:when test="${food eq 'ichinesef'}">
						<p>중식</p>
					</c:when>
					<c:when test="${food eq 'jyangf'}">
						<p>양식</p>
					</c:when>
					<c:when test="${food eq 'kfastf'}">
						<p>패스트푸드</p>
					</c:when>					
					<c:when test="${food eq 'lcafe'}">
						<p>카페</p>
					</c:when>					
																																			
				</c:choose>
			</c:forEach>
		</div>
		<img src="/FinalProject0430/img/이미지3/음리수정.png" id="rogo">
	</header>


	<div class="food-section">
		<div class="food-wrap">
			<div class="leftbox">
				<div class="mybox">
					<img src="/FinalProject0430/img/이미지3/사람.png" alt="" style="margin-top: 15px;">
					<c:if test="${not empty sessionScope.id}">
						<span> ${sessionScope.name} 님</span>
						<p>아이디: ${sessionScope.id}</p>
						<br>
						<p>닉네임: ${sessionScope.nickname}</p>
						<br>
						<p>지역: ${sessionScope.area}</p>
						<br>
						<c:if test="${sessionScope.nickname ne '관리자' }">
						<p>리뷰: <input type="button" value="${idc }" style="padding:5px; border-radius:7px;" onclick="location.href='commentboard'"></p>
						</c:if>
						<p>
							좋아요: <input type="button" value="${idl }"
								style="padding: 5px; border-radius: 7px;"
								onclick="location.href='likeboard'">
						</p>
						<br>
						<button class="log" onclick="location.href='/FinalProject0430/logout'">로그아웃</button>
						<button class="log" onclick="location.href='/FinalProject0430/mypage1?id=${sessionScope.id}&toUrl=${toUrl}'">마이 페이지</button>
					</c:if>
					<c:if test="${empty sessionScope.id}">
						<button class="log" onclick="loginPage()">로그인</button>
					</c:if>
				</div>
				<div style="text-align: center;">
					<c:if
						test="${not empty sessionScope.id and sessionScope.id eq 'ekqls5050'}">
						<button class="log" onclick="location.href='menu'">메뉴 등록</button>
					</c:if>
				</div>
				<ul class="aa">
					<li onclick="menu()">전체 메뉴</li>
					<li onclick="chicken()">치킨</li>
					<li onclick="pizza()">피자</li>
					<li onclick="gogi()">고기</li>
					<li onclick="zzim()">찜 · 탕 · 찌개</li>
					<li onclick="jok()">족발 · 보쌈</li>
					<li onclick="kaz()">돈까스</li>
					<li onclick="japanesef()">회 · 일식</li>
					<li onclick="koreanf()">한식</li>
					<li onclick="chinesef()">중식</li>
					<li onclick="yangf()">양식</li>
					<li onclick="fastf()">패스트푸드</li>
					<li onclick="cafe()">카페</li>
				</ul>
			</div>
			
			<input type="hidden" value="${board.num}" name="num">
			<div class="rightbox">
				<div class="smallbox" style="height:600px;">

					<img class="food" src="/FinalProject0430/storeimg/${board.filename}" alt=""width="500px" height="300px"> <br>
					<div class="food-info-grp">
						<p style="text-align: center;">${board.title }</p>
						<br>
						<p>주소: ${board.addr}</p>
						<br>
						<p>전화번호: ${board.phone}</p>
						<br>
						<p>영업시간: ${board.hm }</p>
						<br>
						<p>
						<br>

							<c:choose>
								<c:when test="${like == 0}">
								<a href="javascript:;"	 onclick = "like()" style="text-decoration: none; display: inline-block;">
									 <img class="food" src="/FinalProject0430/img/음식사진/빈하트.png" alt="" width="25px"height="25px">
									</a>${board.likeCnt }
    							</c:when>
								<c:otherwise>
								<a href="javascript:;"	 onclick = "unlike()" style="text-decoration: none; display: inline-block;">

									 <img class="food" src="/FinalProject0430/img/음식사진/하트.png" alt="" width="25px"	height="25px">
									</a>${board.likeCnt }
    							</c:otherwise>
							</c:choose>
						</p>
						<p>
							<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt="" width="25px"
								height="25px">${star}
						</p>
					</div>
				</div>
				
				<div style="margin-left:-75px;">
				<c:choose>
					<c:when test="${sessionScope.id == 'ekqls5050'}">
						<button style="margin-left: 110px;" class="log"
							onclick="alert('관리자는 리뷰를 작성할 수 없습니다.');">리뷰 쓰기</button>
					<button type="button" class="log" onclick="edit1(${board.num});">수정하기</button>
					<button type="button" class="log" onclick="delete1(${board.num});">삭제하기</button>
					</c:when>
					<c:otherwise>
						<button style="margin-left: 110px;" class="log"
							onclick="location.href='commentwrite?num=${board.num}'">리뷰쓰기</button>

					</c:otherwise>
				</c:choose>

				<button type="button" class="log"
					onclick="location.href='food?food=${board.food}'">이전페이지</button>
					<div id="map" style="margin-left:95px;width:500px;height:400px; border-radius: 30px;border: 3px solid black;"></div>
				</div>
			</div>
			



			<div class="rrightbox">
			

				<c:set var="bno" value="${board.num}" />
				<c:set var="commentList" value="${commentList}" />
				<c:if test="${not empty commentList}">
					<c:forEach var="comment" items="${commentList}">
						<div class="cbox" style="margin-top: 50px; margin-left: 50px;">
							<div class="commentbox"
								style="border: 3px solid black; border-radius: 30px; width: 300px; height: 300px; padding: 10px; display: flex; flex-direction: column; justify-content: space-between;">
								<div>
									<p>작성자:
										<c:choose>
											<c:when test="${empty comment.commenter}"> 탈퇴한 사용자입니다.</c:when>
											<c:otherwise>${comment.commenter}</c:otherwise>
										</c:choose>
									</p>
									<p>
									
										작성 시간:
										<fmt:formatDate value="${comment.reg_date}"
											pattern="yyyy-MM-dd HH:mm" />
										
									</p>


									<p>
										별점:
										<c:choose>
											<c:when test="${comment.star >= 5}">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
											</c:when>
											<c:when test="${comment.star >= 4}">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
											</c:when>
											<c:when test="${comment.star >= 3}">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
											</c:when>
											<c:when test="${comment.star >= 2}">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
											</c:when>
											<c:otherwise>
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
												<img class="food" src="/FinalProject0430/img/음식사진/투명별.png" alt=""
													width="25px" height="25px">
											</c:otherwise>
										</c:choose>
									</p>
									<br>
									<p>내용: ${comment.comment}</p>
									<br>
								</div>
								<c:if test="${comment.commenter eq sessionScope.nickname && sessionScope.id ne null}">
									<div class="buttonbox" style="text-align: center;">
										<button type="button" class="log"
											onclick="location.href='commentedit?bno=${board.num}&cno=${comment.cno }'">수정하기</button>
										<button type="button" class="log"
											onclick="deletecomment(${comment.cno});">삭제하기</button>
									</div>
								</c:if>
							</div>
							<br>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty commentList}">
					<p style="margin: 50px;">리뷰가 없습니다.</p>
				</c:if>
			</div>
		</div>

	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f4cf4607077de769a5f5928a5b99631&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${board.addr}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        //var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	    	var imageSrc = "/FinalProject0430/img/이미지3/${board.food}.png", // 마커이미지의 주소입니다    
	    	    imageSize = new kakao.maps.Size(32, 32), // 마커이미지의 크기입니다
	    	    imageOption = {offset: new kakao.maps.Point(imageSize.width / 2, imageSize.height / 2)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    	      
	    	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    	    markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다
	        // 결과값으로 받은 위치를 마커로 표시합니다
 	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: markerPosition,
	    	    image: markerImage // 마커이미지 설정 
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${board.title}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(markerPosition);
	    	marker.setMap(map);  
	    } 
	});    
	
	
	
	
	
	function deletecomment(cno) {
	    let check = confirm("정말로 삭제하시겠습니까?");
	    if (check) {
	        /* let form = document.writeFrm;
	        form.method = "post";
	        form.action = "/miniproject/delete?cno="+cno;
	        form.submit(); */
	        location.href="/miniproject/delete?cno="+cno+"&bno=${param.num}";
	    }
	}
	function delete1(num) {
	    let check = confirm("정말로 삭제하시겠습니까?");
	    if (check) {
	        /* let form = document.writeFrm;
	        form.method = "post";
	        form.action = "/miniproject/delete?cno="+cno;
	        form.submit(); */
	        location.href="/FinalProject0430/deleteboard?num="+${board.num}+"&food=${board.food}"+"&title=${board.title }";
	    }
	}
	function edit1(num) {
	        window.location.href="/FinalProject0430/editboard?num="+${board.num}+"&food=${board.food}"+"&title=${board.title }";
	}
    function loginPage() {
    	window.location.href = "login?toUrl=${toUrl}";
    }
    
    function menu() {
        window.location.href = "foodChoose";
    }
    function chicken() {
        window.location.href = "food?food=achicken";
    }
    function pizza() {
        window.location.href = "food?food=bpizza";
    }
    function gogi() {
        window.location.href = "food?food=cgogi";
    }
    function zzim() {
        window.location.href = "food?food=dzzim";
    }
    function jok() {
        window.location.href = "food?food=ejok";
    }
    function kaz() {
        window.location.href = "food?food=fkaz";
    }
    function japanesef() {
        window.location.href = "food?food=gjapanesef";
    }
    function koreanf() {
        window.location.href = "food?food=hkoreanf";
    }        
    function chinesef() {
        window.location.href = "food?food=ichinesef";
    }
    function yangf() {
        window.location.href = "food?food=jyangf";
    }
    function fastf() {
        window.location.href = "food?food=kfastf";
    }
    function cafe() {
        window.location.href = "food?food=lcafe";
    }

		function back() {
			window.location.href = "area";
		}
		
		
		function like() {
			let num = ${board.num}
			if (${not empty sessionScope.id }) {
				
		    	location.href="like?mode=like&num="+num; 
			}else{
				alert("좋아요를 하려면 로그인이 필요합니다.");
			}
		}
		
		
		function unlike() {
			let num = ${board.num}
			if (${not empty sessionScope.id }) {
				
				 location.href="like?mode=unlike&num="+num; 
			}else {
		        alert("좋아요를 취소하려면 로그인이 필요합니다.");
		    }
		}
	</script>
</body>
</html>