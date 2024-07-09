<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<style>
@font-face {
	font-family: 'aa';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	padding: 0;
	margin: 0;
	font-family: 'aa';
	box-sizing: border-box;
}

body {
	background-color: #fbd165;
}

header {
	position: relative;
	border-bottom: 3px solid black;
	height: 150px;
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
	width: 210px;
	height: 300px;
	border: 3px solid black;
	border-radius: 30px;
	list-style: none;
	margin: 10px;
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
	margin-left: 5px;
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
	/* display: flex; TR 삭제
    margin: 10px;
    height: 750px;
    flex-direction: column; */
	
}

.aa {
	width: 210px;
	border: 3px solid black;
	border-radius: 30px;
	margin-left: 10px;
	flex-direction: column;
}

.rightbox .smallbox {
	overflow: hidden;
	/* TR 추가: 상위에 border-radius 값 주고, overflow hidden주면 이미지에 굳이 넣을 필요 없고, 깔끔함 */
	margin-top: 20px;
	margin: 16px;
	/* width: 350px; TR: swiper는 자동으로 width값을 주기 때문에 넣을 필요 없음*/
	/* height: 450px; TR: 높이는 보통 컨텐츠와 padding으로 주는 것이 좋음 */
	border: 3px solid black;
	border-radius: 30px;
	/* display: flex; TR: 세로 정렬 flex가 필요 없음
    justify-content: center; /* 수평 가운데 정렬 */
	/*align-items: center; /* 수직 가운데 정렬 */
	/*flex-direction: column; /* 내부 요소들을 세로로 정렬 */
	flex-direction: column;
}

.food {
	width: 100%; /* TR 추가: width값 퍼센트 */
	object-fit: cover; /* TR 추가 */
	/*margin-top: -16px;
    border-radius:27px;
    border-bottom-right-radius:0px ;
    border-bottom-left-radius:0px ; TR: 싹 필요 없음*/
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
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
}

.rightbox .down {
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
}

p img {
	margin-top: 8px;
}

.food-info-grp {
	padding: 8px 8px 12px;
}

.smallbox {
	width: 1000px;
	height: 800px;
}

#form {
	margin-reft: 100px;
	width: 900px;
	height: 800px;
}
    .stars {
        unicode-bidi: bidi-override;
        text-align: center;
        font-size: 0; /* 글자 크기를 0으로 설정하여 별 이미지 간의 간격을 없앱니다. */
    }
    .stars > img {
        cursor: pointer; /* 커서를 포인터로 설정하여 클릭 가능함을 나타냅니다. */
        width: 50px; /* 별 이미지의 너비를 조정합니다. */
        height: auto; /* 이미지의 세로 길이를 자동으로 맞춥니다. */
    }
</style>

<body>
	<header>
		<img src="/FinalProject0430/img/이미지3/음리수정.png" id="rogo">
	</header>

	<aside>
		<div class="superbox">
			<div class="leftbox">
				<div class="mybox">
					<img src="/FinalProject0430/img/이미지3/사람.png" alt="">

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
						<c:if test="${sessionScope.nickname eq '관리자' }">
						<p style="width:92px;"></p>
						</c:if>
						<button class="log" onclick="location.href='/FinalProject0430/logout'">로그아웃</button>
						<button class="log" onclick="location.href='/FinalProject0430/mypage1?id=${sessionScope.id}&toUrl=${toUrl}'">마이 페이지</button>
					</c:if>
					<c:if test="${empty sessionScope.id}">
						<button class="log" onclick="loginPage()">로그인</button>
					</c:if>
				</div>
				<ul class="aa">
					<li onclick="menu()">전체 메뉴</li>
					<li onclick="chicken()">치킨</li>
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

			<div class="rightbox">
				<div class="up">
<div class="smallbox" style="display: flex; justify-content: center;">
    <h2 style="text-align: center; margin-top: 20px;">게시판 글쓰기</h2>
    <br><br>
    <form action="./commentwrite" method="post" onsubmit="return formCheck(this)">
        <div id="form" style="margin-left:30px;">
            <div id="msg" class="msg">${URLDecoder.decode(param.msg, 'utf-8')}</div>
            <div class="down" style="margin-top: 20px;">
                <div class="stars" onclick="rateStars(event)" style="text-align:center;">
                    <img src="/FinalProject0430/img/음식사진/투명별.png" alt="별1" id="star1">
                    <img src="/FinalProject0430/img/음식사진/투명별.png" alt="별2" id="star2">
                    <img src="/FinalProject0430/img/음식사진/투명별.png" alt="별3" id="star3">
                    <img src="/FinalProject0430/img/음식사진/투명별.png" alt="별4" id="star4">
                    <img src="/FinalProject0430/img/음식사진/투명별.png" alt="별5" id="star5">
                </div>
                <div id="rating" style="text-align: center; margin-top: 10px;"></div>
            </div>
            <br><br>
            <label for="comment" style="margin-left: 20px;">내용</label>
            <br>
            <textarea id="content" name="comment" rows="20" cols="100" style="border: 3px solid black; border-radius: 30px; width: 98%; margin-left: 20px; padding: 10px;" placeholder="리뷰가 악플이 될 수 있습니다. 좋은 마음으로 솔직한 리뷰를 전해주세요."></textarea>
            <input class="log"type="hidden" id="starValue" name="starVar">
            <input class="log" type="hidden" name="num" value="${param.num }">
            <br>
            <br>
            <input class="log"type="submit" value="작성완료" style="margin-left:710px;">
            <input class="log" type="button" value="이전 페이지" onclick="history.back()">
        </div>
    </form>
</div>
				</div>
			</div>
		</div>

	</aside>

	<script>
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
		function rateStars(event) {
		    var stars = document.querySelectorAll('.stars > img');
		    var rating = document.getElementById('rating');
		    var target = event.target;
		    var clickedStar = 0;

		    for (var i = 0; i < stars.length; i++) {
		        if (target === stars[i]) {
		            clickedStar = i + 1;
		            break;
		        }
		    }

		    for (var j = 0; j < stars.length; j++) {
		        if (j < clickedStar) {
		            stars[j].src = "/FinalProject0430/img/음식사진/노란별.png"; 
		        } else {
		            stars[j].src = "/FinalProject0430/img/음식사진/투명별.png"; 
		        }
		    }

		    rating.textContent = "평점: " + clickedStar + "/5";
		    document.querySelector("#starValue").value = clickedStar;
		    console.log(document.querySelector("#starValue").value)
		}
		function formCheck(form) {
	        var starValue = document.getElementById('starValue').value;
	        var contentValue = document.getElementById('content').value.trim();

	        if (starValue == 0) {
	            alert('별점을 입력해주세요.');
	            return false; // 폼 제출을 중지합니다.
	        }

	        if (contentValue === '') {
	            alert('내용을 입력해주세요.');
	            return false; // 폼 제출을 중지합니다.
	        }

	        return true; // 폼을 제출합니다.
	    }

	</script>
	
</body>
</html>