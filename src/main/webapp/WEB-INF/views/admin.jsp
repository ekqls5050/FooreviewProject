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
<link rel="stylesheet" href="/FinalProject0430/css/back.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<style>
.rrightbox {
	display: flex;
	flex-wrap: wrap;
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
		<img src="/FinalProject0430/img/이미지3/화살표.png" id="cover" onclick="back()">
		<img src="/FinalProject0430/img/이미지3/음리수정.png" id="rogo">
<%--  		<form action="">
			<input type="text" name="searchWord"
				value="${empty param.searchWord? '' : param.searchWord }"> <select
				name="searchField">
				<option value="title"
					${"title" eq param.searchField ? "selected" : "" }>제목</option>
			</select>
			<button class="log">검색</button>
		</form> --%>
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


			<div class="rrightbox">
			
				<c:set var="adlist" value="${adlist}" />
				<c:if test="${not empty adlist}">
					<c:forEach var="ad" items="${adlist}">
			
						<div class="cbox" style="margin-top: 50px; margin-left: 50px;">
							<div
								style="border: 3px solid black; border-radius: 20px; width: 300px; height: 350px; margin: 20px; padding: 10px;">
								<p>아이디 : ${ad.id }</p>
								<input type="hidden" id="id" name="id" value="${ad.id}" required>
								<br>
								<p>이름 : ${ad.name }</p>
								<br>
								<p>닉네임: ${ad.nickname }</p>
								<br>
								<p>이메일: ${ad.email }</p>
								<br>
								<p>생년월일: ${ad.birth }</p>
								<br>
								<p>비밀번호: 암호화되었습니다.</p>
								<br>
								<p>지역: ${ ad.area }</p>
								<br>
								<div class="buttonbox" style="text-align: center; ">
									<button type="button" class="log" onclick="add('${ad.id}');">수정하기</button>
									<button type="button" class="log" onclick="iddelete('${ad.id}');">삭제하기</button>
									
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		</div>

	<script>
	let msg = "${msg}";
	if(msg == "success") alert("성공적으로 삭제되었습니다.");
	
    function add(id) {
    	location.href="<c:url value='/adminedit?id='/>"+id;
    }
    
	function iddelete(id) {
	    let check= confirm("정말로 삭제하시겠습니까?"); 
	    if (check) {
	       
	        location.href="<c:url value='/iddelete?id='/>"+id;
	    }
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
			window.history.back(); 
		}


	</script>
</body>
</html>