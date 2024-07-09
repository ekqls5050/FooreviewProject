<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="/FinalProject0430/css/back.css">
<style>
        @font-face {
        font-family: 'aa';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
        font-weight: normal;
        font-style: normal; 
    }

    body {
        font-family: 'aa';
        background-color: #fbd165;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    form {
        background-color: #fff;
        border: 3px solid black;
        padding: 20px;
        border-radius: 10px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-top: 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background-color: #3CA140;
    }

    h2{
        text-align: center;
    }

    .id{
        display: flex;
        flex-direction: row;
    }
    .error-message {
        color: red;
        margin-top: 5px;
        display: none; /* 일치하지 않을 때 숨김 */
    }
    .message{
        color: green;
        margin-top: 5px;
        display: none; /* 일치할 때 숨김 */
    }

    button {
        width: 50%;
        margin-top: 10px;
        font-size: 15px;
        height: 37px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        margin-left: 10px;
        font-weight: bold;
    
    }
    button:hover {
        background-color:#3CA140;
    }
    select{
    border: 2px solid black;
    border-radius: 10px;
    background-color: white;
    font-family: 'aa';
        height: 30px;
        margin-top: -10px;
        margin-bottom: 10px ;
    }

</style>
<script s

rc="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<script>
		if(${not empty error}){
			alert("${error}")
		}

	</script>
    <img src="/FinalProject0430/img/이미지3/화살표.png" id="cover" onclick="back()">
    <form action="noticeMailid" method="post">
        <h2>아이디 찾기</h2>

        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="${member.name}" required>
        <br>
        <br>
     
        <label for="email">이메일</label>
        <div id="email_input">
            <input type="text" id="email" name="email" value='${member.email.split("@")[0]}' required style="width:55%; margin-right: 5px;">@
		<select id="domain" name="domain" style="width: 120px;" required>
    		<option value="domainchoose">도메인 선택</option>
    		<option value="naver.com" ${member.email.split("@")[1] eq 'naver.com' ? 'selected' : ''}>naver.com</option>
    		<option value="daum.net" ${member.email.split("@")[1] eq 'daum.net' ? 'selected' : ''}>daum.net</option>
    		<option value="gmail.com" ${member.email.split("@")[1] eq 'gmail.com' ? 'selected' : ''}>gmail.com</option>
    		<option value="kakao.com" ${member.email.split("@")[1] eq 'kakao.com' ? 'selected' : ''}>kakao.com</option>
		</select>
        </div>
        
        <br>


        <input type="submit" value="아이디 찾기" >
    </form>
    <script>
    	
    
        // 생년월일 옵션 생성
        var yearSelect = document.getElementById("year");
        for (var year = 1900; year <= 2024; year++) {
            var option = document.createElement("option");
            option.value = year;
            option.text = year + "년";
            yearSelect.add(option);
        }

        var monthSelect = document.getElementById("month");
        for (var month = 1; month <= 12; month++) {
            var option = document.createElement("option");
            option.value = month;
            option.text = month + "월";
            monthSelect.add(option);
        }

        var daySelect = document.getElementById("day");
        for (var day = 1; day <= 31; day++) {
            var option = document.createElement("option");
            option.value = day;
            option.text = day + "일";
            daySelect.add(option);
        }
    	var year = "${member.birth.split("-")[0]}";
    	var month= "${member.birth.split("-")[1]}";
    	var day = "${member.birth.split("-")[2]}";
    	
    	document.getElementById("year").value = year;
    	document.getElementById("month").value = month;
    	document.getElementById("day").value = day;
        // 비밀번호 일치 여부 체크
        function form() {
            if (!passwordsMatch()) {
                document.getElementById("passwordMatchMessage").innerText = "비밀번호가 일치하지 않습니다";
                return false;
                
                if (!frm.id.dataset.checked) {
                    setMessage("중복 확인을 해주세요", frm.id);
                    return false;
                }
            }
            return true;
        }

        function passwordsMatch() {
            var password = document.getElementById("pwd").value;
            var confirmPassword = document.getElementById("pwdcon").value;

            return password === confirmPassword;
        }

        function checkPasswordMatch() {
            if (passwordsMatch()) {
                document.getElementById("passwordMatchMessage1").innerText = "비밀번호가 일치합니다.";
                document.getElementById("passwordMatchMessage").style.display = "none";
                document.getElementById("passwordMatchMessage1").style.display = "inline-block";
            } else {
                document.getElementById("passwordMatchMessage").innerText = "비밀번호가 일치하지 않습니다.";
                document.getElementById("passwordMatchMessage").style.display = "inline-block";
                document.getElementById("passwordMatchMessage1").style.display = "none";
            }
        }
		
        
    	function setMessage(msg, element) {
    		document.getElementById("msg").innerHTML = msg;
    		if (element) {
    			element.select();
    		}
    	}
    	$(document).ready(function(){
    	    $(".wndqhr").click(function(){
    	        let id = $("#id").val(); // 입력된 아이디 값 가져오기
    	        $.ajax({
    	            url : "./idcheck",
    	            type: "get",
    	            data: {id: id}, // 서버에 전달하는 데이터 이름을 text로 지정하여 아이디 전달
    	            success: function(data) {
    	                if(data === "0") {
    	                    setMessage("사용 가능한 아이디입니다.", $("#id"));
    	                    $("#msg").css("color", "green");
    	                } else {
    	                    setMessage("이미 사용 중인 아이디입니다.", $("#id"));
    	                    $("#msg").css("color", "red"); 
    	                }
    	            },
    	            error: function(request, status, error){ 
    	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	            }
    	        })
    	    });
    	});
    	
    	
    	function setMessage2(msg2, element) {
    		document.getElementById("msg2").innerHTML = msg2;
    		if (element) {
    			element.select();
    		}
    	}
    	$(document).ready(function(){
    	    $(".wndqhr2").click(function(){
    	        let nickname = $("#nickname").val(); // 입력된 아이디 값 가져오기
    	        $.ajax({
    	            url : "./nickcheck",
    	            type: "get",
    	            data: {nickname: nickname}, // 서버에 전달하는 데이터 이름을 text로 지정하여 아이디 전달
    	            success: function(data) {
    	                if(data=== "0") {
    	                    setMessage2("사용 가능한 닉네임입니다.", $("#nickname"));
    	                    $("#msg2").css("color", "green");
    	                } else {
    	                    setMessage2("이미 사용 중인 닉네임입니다.", $("#nickname"));
    	                    $("#msg2").css("color", "red"); 
    	                }
    	            },
    	            error: function(request, status, error){ 
    	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	            }
    	        })
    	    });
    	});
    	
    	
    	
        // 이전 페이지로 이동
        function back() {
            window.location.href = "/FinalProject0430/login";
        }

        // 화살표 이미지 변경
        let cover = document.getElementById("cover");
        cover.addEventListener("mouseover", changePic);
        cover.addEventListener("mouseout", originPic);

        function changePic(){
            cover.src = "/FinalProject0430/img/이미지3/화살표 클릭.png";
        }
        
        function originPic(){
            cover.src = "/FinalProject0430/img/이미지3/화살표.png";
        }
        

        
    </script>
</body>
</html>