<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/FinalProject0430/css/dis.css">
<link rel="stylesheet" href="/FinalProject0430/css/food.css">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style>
	.off{
		display: none;
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
	<header>
        <div class="img">
            <c:choose>
                <c:when test="${param.food eq 'achicken'}">
                    <img src="/FinalProject0430/img/이미지3/achicken.png" class="food">
                    <p>치킨</p>
                </c:when>
                <c:when test="${param.food eq  'bpizza'}">
                    <img src="/FinalProject0430/img/이미지3/bpizza.png" class="foodui">
                    <p>피자</p>
                </c:when>
                <c:when test="${param.food eq  'cgogi'}">
                    <img src="/FinalProject0430/img/이미지3/cgogi.png" class="foodui">
                    <p>고기</p>
                </c:when>
                <c:when test="${param.food eq  'dzzim'}">
                    <img src="/FinalProject0430/img/이미지3/dzzim.png" class="foodui">
                    <p>찜 · 탕 · 찌개</p>
                </c:when>
                <c:when test="${param.food eq  'ejok'}">
                    <img src="/FinalProject0430/img/이미지3/ejok.png" class="foodui">
                    <p>족발 · 보쌈</p>
                </c:when>
                <c:when test="${param.food eq  'fkaz'}">
                    <img src="/FinalProject0430/img/이미지3/fkaz.png" class="foodui">
                    <p>돈까스</p>
                </c:when>
                <c:when test="${param.food eq  'gjapanesef'}">
                    <img src="/FinalProject0430/img/이미지3/gjapanesef.png" class="foodui">
                    <p>회 · 일식</p>
                </c:when>
                <c:when test="${param.food eq  'hkoreanf'}">
                    <img src="/FinalProject0430/img/이미지3/hkoreanf.png" class="foodui">
                    <p>한식</p>
                </c:when>
                <c:when test="${param.food eq  'ichinesef'}">
                    <img src="/FinalProject0430/img/이미지3/ichinesef.png" class="foodui">
                    <p>중식</p>
                </c:when>
                <c:when test="${param.food eq  'jyangf'}">
                    <img src="/FinalProject0430/img/이미지3/jyangf.png" class="foodui">
                    <p>양식</p>
                </c:when>     
                <c:when test="${param.food eq  'kfastf'}">
                    <img src="/FinalProject0430/img/이미지3/kfastf.png" class="foodui">
                    <p>패스트푸드</p>
                </c:when>
                <c:when test="${param.food eq  'lcafe'}">
                    <img src="/FinalProject0430/img/이미지3/lcafe.png" class="foodui">
                    <p>카페</p>
                </c:when>                                                                                                                                             
            </c:choose>
        </div>
        <img src="/FinalProject0430/img/이미지3/음리수정.png" id="rogo">

	</header>


	<div class="food-section">
		<div class="food-wrap">
			<div class="leftbox">
				<div class="mybox">
					<img src="/FinalProject0430/img/이미지3/사람.png" alt="" style="margin-top:15px;">

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
<div style="text-align: center;">
    <c:if test="${not empty sessionScope.id and sessionScope.id eq 'ekqls5050'}">
        <button class="log" onclick="location.href='menu'">메뉴 등록</button>
    </c:if>
</div>
				<ul class="aa">
					<li onclick="menu()">전체 메뉴</li>
					<li data-menu="achicken" onclick="chicken()" >치킨</li>
					<li data-menu="bppiza" onclick="pizza()">피자</li>
					<li data-menu="cgogi" onclick="gogi()">고기</li>
					<li data-menu="dzzim" onclick="zzim()">찜 · 탕 · 찌개</li>
					<li data-menu="ejok" onclick="jok()">족발 · 보쌈</li>
					<li data-menu="fkaz" onclick="kaz()">돈까스</li>
					<li data-menu="gjapanesef" onclick="japanesef()">회 · 일식</li>
					<li data-menu="hkoreanf" onclick="koreanf()">한식</li>
					<li data-menu="ichinesef" onclick="chinesef()">중식</li>
					<li data-menu="jyangf" onclick="yangf()">양식</li>
					<li data-menu="kfastf" onclick="fastf()">패스트푸드</li>
					<li data-menu="lcafe" onclick="cafe()">카페</li>
				</ul>
			</div>



			<div class="swiper mySwiper food-swiper">
				<div class="swiper-wrapper rightbox" style="text-align: center;">
					<c:choose>
						<c:when test="${empty blist }">
							<br>
							<br>
							<br>
							<br>
							<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
						</c:when>
						<c:otherwise>
							<c:forEach items="${blist }" var="b">
								<div class="swiper-slide">
									<div class="smallbox" onclick="location.href = 'view?num=${b.num}'">
									
										<img class="food" src="/FinalProject0430/storeimg/${b.filename}" alt="" width="350px" height="220px"> <br>
										<div class="food-info-grp">
											<p>${b.title }</p>
											<br>
											<p>주소: ${b.addr}</p>
											<br>
											<p>전화번호: ${b.phone}</p>
											<br>
											<p>영업시간: ${b.hm }</p>
											<p>
												<img  src="/FinalProject0430/img/음식사진/하트.png" alt="" width="25px" height="25px"> ${b.likeCnt }
											</p>
											<p>
												<img class="food" src="/FinalProject0430/img/음식사진/노란별.png" alt=""width="25px" height="25px">${b.avg_star}
											</p>
											<br>
											<p>Foo-review(${b.commentCnt})</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

	</div>
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
        
		let slideCount = document.querySelectorAll('.food-swiper .swiper-slide').length;

		let swiperOptions = {
			    autoplay: { 
			        delay: 1000,
			        disableOnInteraction: false,
			    },
			    speed: 2000, 
			    loop: slideCount > 1, // 슬라이드 수가 1개 초과일 때만 무한 반복
			    loopAdditionalSlides: 1,
			    loopedSlides: Math.min(20, slideCount), // 실제 슬라이드 개수와 최대 20개 중 작은 값으로 설정
			    freeMode: true,
			    spaceBetween: 15, 
			    slidesPerView: Math.min(4, slideCount), // 실제 슬라이드 개수와 최대 4개 중 작은 값으로 설정
			};
		let swiper = new Swiper(".food-swiper", swiperOptions);
		
		
		
		 // 각 행을 클릭할 때 view 페이지로 이동하는 함수
	    function goToView(num) {
	        window.location.href = "view?num=" + num;
	    }

	</script>
</body>
</html>