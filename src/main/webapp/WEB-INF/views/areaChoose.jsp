<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프리뷰</title>
<link rel="stylesheet" href="/FinalProject0430/css/dis.css">
<link rel="stylesheet" href="/FinalProject0430/css/right.css">
<link rel="stylesheet" href="/FinalProject0430/css/food.css">
<link rel="stylesheet" href="/FinalProject0430/css/back.css">

<style>
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
    .container {
    display: flex;
    flex-direction: column; 
    justify-content: center;
    align-items: center;
    height: 20vh; 
    }

    .container > div {
        margin-bottom: -300px; 
    }

    .foodre{
        width: 1000px;  
        height:850px;  
    }
    
    select{
    border: 3px solid black;
    border-radius: 10px;
    background-color: white;
    font-family: 'aa';
        height: 30px;
    }
    option{
        background-color: white;
    }
    .garo{
        display: flex;
    }
</style>
</head>
<body>
    <img src="/FinalProject0430/img/이미지3/화살표.png" id="cover" onclick="back()" style="margin-left:25px;">

    <div class="container">
        <div>
            <img src="/FinalProject0430/img/이미지2/음리1.png" alt="" class="foodre">
            
            
        </div>
        
    <div class="garo">
    <select id="categoryselect" onchange="select()">
        <option value="">지역선택(충북 청주만)</option>
        <option value="category1">충청북도</option>
        <option value="category2">충청남도</option>
        <option value="category3">대전 광역시</option>
    </select>

        <select id="optionselect">
            <option value="">옵션 선택</option>
    </select>
            <c:if test="${sessionScope.nickname eq '관리자' }">
    <button class="log"style="width:110px; margin-top:1px;"  onclick="location.href='admin'">관리자 페이지</button>
	</c:if>		
    </div>
    <button id="toggleButton">
          <img src="/FinalProject0430/img/이미지3/메뉴.png" alt=""  class="menu">
    </button>

    <div id="additionalMenu">
        <div class="closeButton">
            <button id="closeButton">
                <img src="/FinalProject0430/img/이미지3/돌아가기.png" alt="" class="back" width="40px">
            </button>
        </div>
        <br>
        <br>
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
						<p>좋아요: <input type="button" value="${idl }" style="padding:5px; border-radius:7px;" onclick="location.href='likeboard'"></p>
						<br>
						<button class="log" onclick="location.href='/FinalProject0430/logout'">로그아웃</button>
						<button class="log" onclick="location.href='/FinalProject0430/mypage1?id=${sessionScope.id}&toUrl=${toUrl}'">마이 페이지</button>
					</c:if>
<c:if test="${empty sessionScope.id}">
    <button class="log" onclick="location.href='login'">로그인</button>
</c:if>
        </div>
    </div>
<script>
function select() {
    var categoryselect = document.getElementById("categoryselect");
    var optionselect = document.getElementById("optionselect");

    // 하위 셀렉트 태그 초기화
    optionselect.innerHTML = "";

    // 선택된 카테고리에 따라 옵션을 추가
    if (categoryselect.value === "category1") {
        optionselect.innerHTML += "<option value='option1'>지역선택</option>";
        optionselect.innerHTML += "<option value='option2'>청주시</option>";
        optionselect.innerHTML += "<option value='option3'>충주시</option>";
    } else if (categoryselect.value === "category2") {
    	optionselect.innerHTML += "<option value='option4'>지역선택</option>";
        optionselect.innerHTML += "<option value='option5'>천안시</option>";
        optionselect.innerHTML += "<option value='option6'>서산시</option>";
    }else if (categoryselect.value === "category3") {
        window.location.href = "https://example.com/page3"; // 카테고리 3에 해당하는 웹페이지로 이동
    }
}

// 카테고리 선택 이벤트에 이벤트 리스너 추가
document.getElementById("categoryselect").addEventListener("change", select);

// 옵션 선택 이벤트에 이벤트 리스너 추가
document.getElementById("optionselect").addEventListener("change", redirectToWebsite);

// 옵션에 해당하는 웹사이트 URL 매핑
var websiteUrls = {
		  "option2":  "foodChoose",
    "option3": "https://example.com/websiteC",
    "option4": "https://example.com/websiteD",
    "category3": "https://example.com/websiteD"
};

function loginPage() {
    window.location.href = "login";
}

// 옵션을 선택하면 해당하는 웹사이트로 이동하는 함수
function redirectToWebsite() {
    var optionselect = document.getElementById("optionselect");
    var selectedoption = optionselect.value;
    
    var websiteUrl = websiteUrls[selectedoption];

    // 선택된 옵션에 해당하는 웹사이트로 이동
    if (websiteUrl) {
        window.location.href = websiteUrl;
    }
}

function back() {
            window.location.href = "login?toUrl=${toUrl}";
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
</div>
</body>
</html>