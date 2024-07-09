<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/FinalProject0430/css/food2.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<style type="text/css">
body{
    background-color: #fbd165;
}
.mybox {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

form {
	display: inline;
	align-items: center;
	justify-content: flex-start; /* 수평 정렬을 위해 요소를 우측으로 정렬 */
	position: static;
	top: 0px; /* 헤더 내부의 검색 폼 요소가 헤더 안에 위치하도록 조정합니다. */
	right: 0px; /* 오른쪽으로 여유 공간을 두어 정렬합니다. */
}
input{
	padding:5px;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<body>
	<header>
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
	<form action="./adminedit2" method="post">
	<c:set var="adlist" value="${ad}" />
					<c:if test="${not empty ad}">
					
		<div class="mybox" style="background-color:#fada8a; padding:10px; ">
			<input type="hidden" name="toUrl" value="${toUrl}">
			<input type="hidden"id="id" name="id" value="${ad.id}">
			<input type="hidden"id="name" name="name" value="${ad.name}">
			<p>아이디: ${ad.id}</p>
			<br>
			<p>이름: ${ad.name}</p>
			<br>
			<label for="name">닉네임: <input type="text" id="nickname" name="nickname" value="${ad.nickname}" required></label>
			<br>
			 <label for="name">이메일: <input type="text" id="email" name="email" value="${ad.email}" required></label>
			<br>
			 <label for="name">생년월일: <input type="text" id="birth" name="birth" value="${ad.birth}" required></label>
			<br>
			 <label for="name">비밀번호: <input type="password" id="pwd" name="pwd"  required></label>
			<br>
			 <label for="name">비밀번호 확인: <input type="password" id="pwdcon" name="pwdcon"  required></label>
			<br> <label for="area">지역:
			<select id="area" name="area" style="width:150px;">
				<c:choose>
					<c:when test="${ad.area eq '충북 청주시 서원구'}">
						<option value="충북 청주시 서원구" selected>충북 청주시 서원구</option>
						<option value="충북 청주시 상당구">충북 청주시 상당구</option>
						<option value="충북 청주시 청원구">충북 청주시 청원구</option>
						<option value="충북 청주시 흥덕구">충북 청주시 흥덕구</option>
						<option value="충남 천안시 땡땡구">충남 천안시 땡땡구</option>
						<option value="충남 천안시 땡땡2구">충남 천안시 땡땡2구</option>
					</c:when>
					<c:when test="${ad.area eq '충북 청주시 상당구'}">
						<option value="충북 청주시 서원구">충북 청주시 서원구</option>
						<option value="충북 청주시 상당구" selected>충북 청주시 상당구</option>
						<option value="충북 청주시 청원구">충북 청주시 청원구</option>
						<option value="충북 청주시 흥덕구">충북 청주시 흥덕구</option>
						<option value="충남 천안시 땡땡구">충남 천안시 땡땡구</option>
						<option value="충남 천안시 땡땡2구">충남 천안시 땡땡2구</option>
					</c:when>
					<c:when test="${ad.area eq '충북 청주시 청원구'}">
						<option value="충북 청주시 서원구">충북 청주시 서원구</option>
						<option value="충북 청주시 상당구">충북 청주시 상당구</option>
						<option value="충북 청주시 청원구" selected>충북 청주시 청원구</option>
						<option value="충북 청주시 흥덕구">충북 청주시 흥덕구</option>
						<option value="충남 천안시 땡땡구">충남 천안시 땡땡구</option>
						<option value="충남 천안시 땡땡2구">충남 천안시 땡땡2구</option>
					</c:when>
					<c:when test="${ad.area eq '충북 청주시 흥덕구'}">
						<option value="충북 청주시 상당구">충북 청주시 상당구</option>
						<option value="충북 청주시 서원구">충북 청주시 서원구</option>
						<option value="충북 청주시 청원구">충북 청주시 청원구</option>
						<option value="충북 청주시 흥덕구" selected>충북 청주시 흥덕구</option>
						<option value="충남 천안시 땡땡구">충남 천안시 땡땡구</option>
						<option value="충남 천안시 땡땡2구">충남 천안시 땡땡2구</option>
					</c:when>
					<c:when test="${ad.area eq '충남 천안시 땡땡구'}">
						<option value="충북 청주시 서원구">충북 청주시 서원구</option>
						<option value="충북 청주시 상당구">충북 청주시 상당구</option>
						<option value="충북 청주시 청원구">충북 청주시 청원구</option>
						<option value="충북 청주시 흥덕구">충북 청주시 흥덕구</option>
						<option value="충남 천안시 땡땡구" selected>충남 천안시 땡땡구</option>
						<option value="충남 천안시 땡땡2구">충남 천안시 땡땡2구</option>
					</c:when>
					<c:when test="${ad.area eq '충남 천안시 땡땡2구'}">
						<option value="충북 청주시 서원구">충북 청주시 서원구</option>
						<option value="충북 청주시 상당구">충북 청주시 상당구</option>
						<option value="충북 청주시 청원구">충북 청주시 청원구</option>
						<option value="충북 청주시 흥덕구">충북 청주시 흥덕구</option>
						<option value="충남 천안시 땡땡구">충남 천안시 땡땡구</option>
						<option value="충남 천안시 땡땡2구" selected>충남 천안시 땡땡2구</option>
					</c:when>

				</c:choose>
				
			</select>
			
			</label> 
			<div style="text-align:center;">
				<button class="log" type="button" style="width:150px;" onclick="mypagedelete('${sessionScope.id}')">탈퇴하기</button>
			</div>
			<div style="text-align:center; ">
			<button class="log"type="submit" style="width:150px;" >회원 정보 수정</button>
			<button class="log" type="button" style="width:150px;" onclick="javascript:history.back();">돌아가기</button>
			</div>
		</div>
					
				</c:if>
	</form>
<script>
function mypagedelete(id) {
    let check= confirm("정말로 삭제하시겠습니까?"); 
    if (check) {
        location.href="/FinalProject0430/iddedelete?id="+id;
    }
}
</script>
</body>
</html>