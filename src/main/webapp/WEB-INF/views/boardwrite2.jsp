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
* {
	padding: 0;
	margin: 0;
	font-family: 'aa';
}

@font-face {
	font-family: 'aa';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
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
   .input{
        display: block;
    color: rgba(0, 0, 0, 1); /* 반투명한 글자색 */
    width: 100px;
    height: 10px;
    border: 3px solid black;
    border-radius: 30px;
    
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
	width: 220px;
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
	width: 350px;
	height: 450px;
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
    select{
    border: 3px solid black;
    border-radius: 10px;
    background-color: white;
    font-family: 'aa';
        height: 30px;
	margin-left:10px; 
	margin-right:10px; 
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

			<div class="rightbox">
				<div class="up">
					<div class="smallbox" style="width: 500px; height:700px;">
						<form action="./menu" method="post"  enctype="multipart/form-data">
							<div id="preview"><img id="previewImg" src="/FinalProject0430/img/음식사진/img_01.jpg" width="500px"
							height="300px"></div>
							<input type="file" name="uploadFile" id="uploadFile"  accept="image/*"/>
							<br>
							<br>
							<select name="food">
								<option value="">음식 선택</option>
								<option value="achicken">치킨</option>
								<option value="bpizza">피자</option>
								<option value="cgogi">고기</option>
								<option value="dzzim">찜·탕·찌개</option>
								<option value="ejok">족발·보쌈</option>
								<option value="fkaz">돈까스</option>
								<option value="gjapanesef">회·일식</option>
								<option value="hkoreanf">한식</option>
								<option value="ichinesef">중식</option>
								<option value="jyangf">양식</option>
								<option value="kfastf">패스트푸드</option>
								<option value="lcafe">카페</option>
							</select> 
							<br>
							<br>
<div style="display: flex; align-items: center;">
    <p style="margin-left: 10px; margin-right: 10px;">지점명:</p>
    <div style="flex-grow: 1;">
        <input class="input"type="text" name="title" style="width: 90%; height: 20px; padding:3px; ">
    </div>
</div>
<br>
<br>
<div style="display: flex; align-items: center;">
    <p style="margin-left: 10px; margin-right: 10px;">주소:</p>
    <div style="flex-grow: 1;">
        <input class="input" name="addr" style="width: 90%; height: 20px; padding:3px; ">
    </div>
</div>
<br>
<br>
<div style="display: flex; align-items: center;">
    <p style="margin-left: 10px; margin-right: 10px;">전화번호:</p>
    <div style="flex-grow: 1;">
        <input class="input" name="phone" style="width: 90%; height: 20px; padding:3px; ">
    </div>
</div>
<br>
<br>
<div style="display: flex; align-items: center;">
    <label for="hm" style="margin-left: 10px; margin-right: 10px;">영업시간:</label>
    <select id="HH" name="HH" required></select>
    <label for="HH">:</label>
    <select id="mm" name="mm" required></select>
    <label for="mm"></label>
    <p>~</p>
    <select id="HH2" name="HH2" required></select>
    <label for="HH2">:</label>
    <select id="mm2" name="mm2" required></select>
    <label for="mm2"></label>
</div>
							<br>
							<div style="text-align: center; margin-bottom:30px;">
								<button class="log" type="submit">등록</button>
								<button class="log" type="button" onclick="javascript:history.back();">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</aside>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	var HHSelect = document.getElementById("HH");
	for (var HH = 0; HH <= 24; HH++) {
	    var option = document.createElement("option");
	    option.value = HH < 10 ? "0" + HH : HH;
	    option.text = option.value + "시";
	    HHSelect.add(option);
	}
	var mmSelect = document.getElementById("mm");
	for (var mm = 0; mm <= 59; mm++) {
	    var option = document.createElement("option");
	    option.value = mm < 10 ? "0" + mm : mm; 
	    option.text = option.value + "분";
	    mmSelect.add(option);
	}
	
	var HH2Select = document.getElementById("HH2");
	for (var HH2 = 0; HH2 <= 24; HH2++) {
	    var option = document.createElement("option");
	    option.value = HH2 < 10 ? "0" + HH2 : HH2; 
	    option.text = option.value + "시";
	    HH2Select.add(option);
	}
	var mm2Select = document.getElementById("mm2");
	for (var mm2 = 0; mm2 <= 59; mm2++) {
	    var option = document.createElement("option");
	    option.value = mm2 < 10 ? "0" + mm2 : mm2; 
	    option.text = option.value + "분";
	    mm2Select.add(option);
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
		

		function upload(){
			 var form = document.fileFrm;
			 form.action="<c:url value='/file/write'/>"; // 가장 최근에 작성한 글이므로 1페이지에 보이게 되므로 따로 페이지값 지정 x
			 form.method="post";
			 form.submit();
		}
		
		
		$(document).ready(function(){
			//file업로드에서 변화가 있을 때 실행
		    $('#uploadFile').on('change', function() {
		    	let inputFile = $(this)
		    	console.log(inputFile)
		    	console.log(inputFile[0].files[0]) // 배열형태로 값을 가져오기 때문에, dom element에 접근위해서는 인덱스 활용
		        $('#fileName').val(inputFile[0].files[0].name);
		        $('#lfileName').text(inputFile[0].files[0].name);
		      
		        
		        if(inputFile[0].files[0].length!=0){
		        	let render = new FileReader();
		        	render.onload = function(e){
		        		console.log(e.target.result)
		        		$("#previewImg").attr("src", e.target.result);
		        	};
		        	render.readAsDataURL(inputFile[0].files[0]);
		        }else{
		        	$("#previewImg").attr("src", "");
		        }
		    });

			
			$('#writeBtn').on("click", function(e){
				let inputFile = $("input[name='uploadFile']"); 
				let files = inputFile[0].files;// 실제 file 데이터
				console.log(files); 
				if(files.length==0){
					$("#fileEx").val(0) // file업로드 여부 확인 변수 ( 1 : 파일 업로드 한 경우, 0 : 파일 업로드 하지 않음)
					//alert($("#fileEx").val())
					alert("파일이 없습니다.")
					upload();
					return;
				}
				upload();
				
			});
			
		});	// document ready END    
	</script>
</body>
</html>