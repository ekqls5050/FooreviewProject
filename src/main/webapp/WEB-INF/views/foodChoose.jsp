<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/FinalProject0430/css/dis.css">
<link rel="stylesheet" href="/FinalProject0430/css/right.css">
<link rel="stylesheet" href="/FinalProject0430/css/back.css">
<style>
header {
	text-align: center;
	margin-top: -250px;
	margin-bottom: -250px;
}

.rogo {
	width: 700px;
	pointer-events: none;
}

.container {
	height: 200px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0px;
}

ul {
	list-style-type: none;
}

li {
	width: 150px;
	text-align: center;
	font-weight: bold;
	font-size: 20px;
	font-family: 'aa';
}

button {
	margin: 10px;
	border: 0px;
	cursor: pointer;
	transition: all .3s;
}

button:hover {
	transform: translateY(-10px);
}

.review-section {
	width: 100%;
	padding: 160px 0;
	background-image: url(/FinalProject0430/img/음식사진/img_01.jpg);
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
	margin-top: 100px;
}

.review-wrap {
	text-align: center;
	background-color: transparent;
}

.review-section p {
	background-color: transparent;
}

.review-tt {
	font-size: 16px;
	font-weight: 300;
	color: #fff;
}

.review-ttl {
	padding: 20px 0;
	font-size: 30px;
	font-weight: 500;
	color: #fff;
}

.btn-review {
	width: 120px;
	height: 50px;
	line-height: 50px;
	border: 1px solid #fbd165;
	border-radius: 8px;
}

.btn-review:hover {
	background-color: #fff;
}

.receive-section {
	padding: 160px 0 80px;
	background-color: #fff;
}

.receive-section * {
	background-color: #fff;
}

.sm-center {
	max-width: 1330px;
	width: 100%;
	margin: 0 auto;
	padding: 0 15px;
}

.receive-content {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 66px;
}

.left .txt-wrap .main-sub-txt {
	display: inline-block;
	position: relative;
	font-size: 18px;
	font-weight: 600;
	color: #fbd165;
}

.left .txt-wrap .main-ttl {
	display: block;
	font-size: 44px;
	font-weight: 800;
	line-height: 54.5px;
	color: #000;
	padding: 14px 0;
}

.left .txt-wrap .main-ttl .bold {
	color: #fbd165;
}

.main-sub-txt-02 {
	font-size: 1.3125rem;
	font-weight: 400;
	letter-spacing: -0.948px;
	line-height: 27px;
}

.right {
	flex-grow: 1;
}

.receive-list {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 20px;
	width: 100%;
	padding: 24px 24px 24px 60px;
	border-radius: 30px;
}

.receive-list:first-child {
	background-color: #fcebed;
	margin-bottom: 20px;
}

.receive-list:first-child * {
	background-color: #fcebed;
}

.receive-list:last-child {
	background-color: #eef8fe;
}

.receive-list:last-child * {
	background-color: #eef8fe;
}

.receive-list .ttl {
	display: inline-block;
	margin-bottom: 14px;
	font-size: 16px;
	font-weight: 300;
}

.receive-list .sub-txt {
	margin: 0;
	font-size: 22px;
	font-weight: 200;
}

.pick-section {
	padding: 120px 0;
	background-color: #fff;
}

.pick-section * {
	background-color: #fff;
}

.pick-section .ttl {
	font-size: 16px;
	text-align: center;
}

.pick-section .desc {
	font-size: 44px;
	text-align: center;
	line-height: 1.4;
}

.pick-section .desc .primary-txt {
	color: #fbd165;
}

.pick-section .txt {
	font-size: 16px;
	text-align: center;
}

.pick-conts {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 11px;
	padding-top: 74px;
}

.pick-card {
	width: calc(( 100% - 33px)/4);
	padding: 66px 0 41px;
	border-radius: 10px;
	border: 2px solid #ededed;
	text-align: center;
	cursor: pointer;
	transition: all .3s;
}

.pick-card:hover {
	border-color: #fbd165;
}

.pick-card .pick-tt {
	font-size: 17px;
	text-align: center;
	padding: 20px 0;
}

.pick-card .pick-desc {
	font-size: 15px;
	line-height: 1.4;
	color: #8b8b8b;
}

.foo-footer .footer-inner {
	max-width: 1326px;
	width: 100%;
	height: 180px;
	padding: 88px 15px;
	margin: 0 auto;
}

.foot-info-grp {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	gap: 14px;
}

.nav_area {
	position: relative;
}

.nav_area .asd {
	position: absolute;
	top: 0;
	right: 50px;
	bottom: 0;
	width: 400px;
	margin: auto 0;
	border: 3px solid black;
	border-radius: 30px;
	padding: 10px;
	z-index: 1;
}
.nav_area .asd li {
	width: 100%;
}

    .first {
        color: red;
    }
    .second {
        color: blue;
    }
    .third {
         color: #b87333;
    }
    .default {
        color: #555555;
    }
</style>

</head>
<script>
		if(${not empty error}){
			alert("${error}")
		}
		if(${not empty success}){
			alert("${success}")
		}

	</script>
<body>
	<img src="/FinalProject0430/img/이미지3/화살표.png" id="cover"
		onclick="back()">
	<header>
		<div onclick="return1()">
			<img src="/FinalProject0430/img/이미지2/음리1.png" class="rogo">
		</div>

		<button id="toggleButton">
			<img src="/FinalProject0430/img/이미지3/메뉴.png" alt="" class="menu">
		</button>

		<div id="additionalMenu" style="z-index:2;">
			<div class="closeButton">
				<button id="closeButton">
					<img src="/FinalProject0430/img/이미지3/돌아가기.png" alt="" class="back"
						width="40px">
				</button>
			</div>
			<br> <br>
			<div class="mybox">
				<img src="/FinalProject0430/img/이미지3/사람.png" alt=""
					style="margin-top: 15px;">
				<c:if test="${not empty sessionScope.id}">
					<span> ${sessionScope.name} 님</span>
					<p>아이디: ${sessionScope.id}</p>
					<br>
					<p>닉네임: ${sessionScope.nickname}</p>
					<br>
					<p>지역: ${sessionScope.area}</p>
					<br>
					<c:if test="${sessionScope.nickname ne '관리자' }">
						<p>
							리뷰: <input type="button" value="${idc }"
								style="padding: 5px; border-radius: 7px;"
								onclick="location.href='commentboard'">
						</p>
					</c:if>
					<p>
						좋아요: <input type="button" value="${idl }"
							style="background-color: #fbd165; border: 3px solid black; padding: 5px; border-radius: 7px;"
							onclick="location.href='likeboard'">
					</p>
					<br>
					<button class="log"
						onclick="location.href='/FinalProject0430/logout'">로그아웃</button>
					<button class="log"
						onclick="location.href='/FinalProject0430/mypage1?id=${sessionScope.id}&toUrl=${toUrl}'">마이
						페이지</button>
				</c:if>
				<c:if test="${empty sessionScope.id}">
					<button class="log" onclick="loginPage()">로그인</button>
				</c:if>
			</div>
		</div>
	</header>
	<nav class="margin nav_area">
		<ul class="container">
			<button onclick="chicken()">
				<img src="/FinalProject0430/img/이미지3/achicken.png" alt="">
				<li class="ff">치킨</li>
			</button>

			<button onclick="pizza()">
				<img src="/FinalProject0430/img/이미지3/bpizza.png" alt="">
				<li class="ff">피자</li>
			</button>

			<button onclick="gogi()">
				<img src="/FinalProject0430/img/이미지3/cgogi.png" alt="">
				<li class="ff">고기</li>
			</button>

			<button onclick="zzim()">
				<img src="/FinalProject0430/img/이미지3/dzzim.png" alt="">
				<li class="ff">찜,탕,찌개</li>
			</button>
		</ul>


		<ul class="container">
			<button onclick="jok()">
				<img src="/FinalProject0430/img/이미지3/ejok.png" alt="">
				<li class="ff">족발,보쌈</li>
			</button>

			<button onclick="kaz()">
				<img src="/FinalProject0430/img/이미지3/fkaz.png" alt="">
				<li class="ff">돈까스</li>
			</button>

			<button onclick="japanesef()">
				<img src="/FinalProject0430/img/이미지3/gjapanesef.png" alt="">
				<li class="ff">회,일식</li>
			</button>

			<button onclick="koreanf()">
				<img src="/FinalProject0430/img/이미지3/hkoreanf.png" alt="">
				<li class="ff">한식</li>
			</button>
		</ul>

		<ul class="container">
			<button onclick="chinesef()">
				<img src="/FinalProject0430/img/이미지3/ichinesef.png" alt="">
				<li class="ff">중식</li>
			</button>

			<button onclick="yangf()">
				<img src="/FinalProject0430/img/이미지3/jyangf.png" alt="">
				<li class="ff">양식</li>
			</button>

			<button onclick="fastf()">
				<img src="/FinalProject0430/img/이미지3/kfastf.png" alt="">
				<li class="ff">패스트푸드</li>

			</button>

			<button onclick="cafe()">
				<img src="/FinalProject0430/img/이미지3/lcafe.png" alt="">
				<li class="ff">카페</li>
			</button>
		</ul>
		<div class="asd">
		<br>
			<h1 style="text-align: center;">이달의 리뷰왕</h1>
						<br>
						<br>
						<br>
			<ul>
				<c:choose>
					<c:when test="${empty reviewerCounts }">
					</c:when>
					<c:otherwise>
					<!-- 얘(li) width:150px이래, foodChoose.css (line:35) 를 고치거나 클래스 포함 해서 스타일 한번 더 줘야 됨. 내가 위에 css 넣어놓음 -->
						<c:forEach items="${reviewerCounts}" var="b" varStatus="i">
							<li><c:choose>
									<c:when test="${i.index == 0}">
										<span class="first">${order[i.index]}   </span><span>${b.commenter}님	${b.review_count}개</span>
										<br>
									</c:when>
									<c:when test="${i.index == 1}">
										<span class="second">${order[i.index]}   </span><span>${b.commenter}님	${b.review_count}개</span>
										<br>
									</c:when>
									<c:when test="${i.index == 2}">
										<span class="third">${order[i.index]}   </span><span>${b.commenter}님	${b.review_count}개</span>
										<br>
									</c:when>
									<c:otherwise>
										<span class="default">${order[i.index]}   </span><span>${b.commenter}님	${b.review_count}개</span>
										<br>
									</c:otherwise>
								</c:choose> <br></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
	</nav>

	<div class="review-section">
		<div class="review-wrap">
			<p class="review-tt">배달을 시켰는데 음식 또는 서비스에 실망하셨다구요?</p>
			<p class="review-ttl">푸리뷰가 고민을 한 번에 해결해드립니다!</p>
			<button onclick="chicken()" class="btn btn-review">리뷰 바로가기</button>
		</div>
	</div>

	<div class="receive-section">
		<div class="sm-center">
			<div class="receive-content">
				<div class="left">
					<div class="txt-wrap">
						<p class="main-sub-txt">foo-review System</p>
						<strong class="main-ttl"> Review <br> <span
							class="bold">먹어본 음식만!</span>
						</strong>
						<p class="main-sub-txt-02">
							먹어본 음식만 리뷰 <br /> 가능하여 신뢰도 100%
						</p>
					</div>
				</div>
				<div class="right">
					<div class="receive-grp">
						<div class="receive-list">
							<div class="img-grp">
								<img src="/FinalProject0430/img/이미지3/achicken.png" alt="">
							</div>
							<div>
								<strong class="ttl">영수증 리뷰 시스템</strong>
								<p class="sub-txt">믿고 보는 리뷰! 시스템</p>
							</div>
						</div>
						<div class="receive-list">
							<div class="img-grp">
								<img src="/FinalProject0430/img/이미지3/bpizza.png" alt="">
							</div>
							<div>
								<strong class="ttl">영수증 리뷰 시스템</strong>
								<p class="sub-txt">믿고 보는 리뷰! 시스템</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="pick-section">
		<div class="sm-center">
			<div class="pick-wrap">
				<p class="ttl">foo review pick</p>
				<p class="desc">
					고객의 니즈에 맞는 <br> <strong class="primary-txt">다양한 음식리뷰
						제공</strong>
				</p>
				<p class="txt">따로 찾아볼 필요 없이 간편하게!</p>
				<div class="pick-conts">
					<div onclick="chicken()" class="pick-card">
						<div class="img-grp">
							<img src="/FinalProject0430/img/이미지3/achicken.png" alt="">
						</div>
						<p class="pick-tt">치킨</p>
						<p class="pick-desc">
							치킨 리뷰도 푸리뷰!<br> 치킨 리뷰 바로가기
						</p>
					</div>
					<div onclick="pizza()" class="pick-card">
						<div class="img-grp">
							<img src="/FinalProject0430/img/이미지3/bpizza.png" alt="">
						</div>
						<p class="pick-tt">피자</p>
						<p class="pick-desc">
							피자 리뷰도 푸리뷰!<br> 피자 리뷰 바로가기
						</p>
					</div>
					<div onclick="gogi()" class="pick-card">
						<div class="img-grp">
							<img src="/FinalProject0430/img/이미지3/cgogi.png" alt="">
						</div>
						<p class="pick-tt">고기</p>
						<p class="pick-desc">
							고기 리뷰도 푸리뷰!<br> 고기 리뷰 바로가기
						</p>
					</div>
					<div onclick="zzim()" class="pick-card">
						<div class="img-grp">
							<img src="/FinalProject0430/img/이미지3/dzzim.png" alt="">
						</div>
						<p class="pick-tt">찌개</p>
						<p class="pick-desc">
							찌개 리뷰도 푸리뷰!<br> 찌개 리뷰 바로가기
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="foo-footer">
		<div class="footer-inner">
			<p class="footer-ttl">주식회사 푸리뷰</p>
			<div class="foot-info-grp">
				<p class="foot-info">대표 : 이다빈</p>
				<p class="foot-info">청주 이다빈 집 청주 이다빈 집</p>
			</div>
			<p class="copyright">Copyright©2024 foo-review All rights
				reserved.</p>
		</div>
	</footer>

	<script>
    function loginPage() {
    	window.location.href = "login?toUrl=${toUrl}";
    }
    
        function menu() {
            window.location.href = "/miniproject/food";
        }
        function chicken() {
            window.location.href = "<c:url value='food?food=achicken'/>";
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

        let cover = document.getElementById("cover");
        //over는 요소쪽으로 커서이동
        cover.addEventListener("mouseover",changePic);
        //out은 요소에서 커서 떠날때
        cover.addEventListener("mouseout",originPic);

        function changePic(){
            cover.src = "/FinalProject0430/img/이미지3/화살표 클릭.png";
        }
        
        function originPic(){
            cover.src = "/FinalProject0430/img/이미지3/화살표.png";
        }

        // 버튼 요소와 부가 메뉴 요소 가져오기
        var toggleButton = document.getElementById("toggleButton");
        var additionalMenu = document.getElementById("additionalMenu");
        var closeButton = document.getElementById("closeButton");

        // 버튼을 클릭할 때 이벤트 처리
        toggleButton.addEventListener("click", function() {
        // 부가 메뉴가 보이는지 여부를 확인하여 토글
            if (additionalMenu.style.right === "-235px") {
                additionalMenu.style.right = "0";
            } else {
                additionalMenu.style.right = "-235px";
            }
        });

// 닫기 버튼을 클릭할 때 이벤트 처리
closeButton.addEventListener("click", function() {
  additionalMenu.style.right = "-235px";
});

document.querySelector(".menu").addEventListener("mouseover", function() {
  this.src = "/FinalProject0430/img/이미지3/메뉴클릭.png"; // 다른 이미지로 변경
});

document.querySelector(".menu").addEventListener("mouseout", function() {
  this.src = "/FinalProject0430/img/이미지3/메뉴.png"; // 원래 이미지로 변경
});

// back 클래스 요소에 대한 이벤트 처리
document.querySelector(".back").addEventListener("mouseover", function() {
  this.src = "/FinalProject0430/img/이미지3/돌아가기클릭.png"; // 다른 이미지로 변경
});

document.querySelector(".back").addEventListener("mouseout", function() {
  this.src = "/FinalProject0430/img/이미지3/돌아가기.png"; // 원래 이미지로 변경
});
    </script>
</body>
</html>