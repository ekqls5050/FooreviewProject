<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/FinalProject0430/css/dis.css">
    <style>
        
    
        .container{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: -200px 0 0 0 ;
        }
        img{
            margin-bottom: -300px;
        }
        #flex{
            display: flex;
            justify-content: center;
        }
        button{
            text-align: center;
            background-color: #4CAF50;
            color: #2c2b29;
            margin: 30px;
            border: 4px solid black;
            border-radius: 50px;
            width: 150px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        
        .login-wrap{
            display: flex;
            justify-content: center;
            margin: 30px 30px 0px 30px;
        }
        button:hover {
        background-color: #45a049;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .login-wrap .input-wrap input{
        display: block;
    color: rgba(0, 0, 0, 0.5); /* 반투명한 글자색 */
    width: 150px;
    height: 20px;
    border: 3px solid black;
    border-radius: 30px;
    text-align: center;
    margin-right: 10px;
    
    }

    .login-wrap .input-wrap input:first-child {
        margin-bottom: 10px;
    }
    .login-wrap{
        align-items: center;
        gap: 20px;
    }
     input[type="submit"]{
        text-align: center;
            display: block;
            background-color: #4CAF50;
            color: #2c2b29;
            border: 4px solid black;
            border-radius: 27px;
            width: 100px;
            height: 100px;
            display: flex;
            justify-content: center;
    
    }

    .login input[type="text"],
    .login input[type="password"] {
        color: black; 
    }
    .login-wrap{
        display: flex;
    }
    .box{
        margin-top: -40px;
        border: 3px solid black;
        border-radius: 10px;
        padding: 10px;
    }
    .remember{
    margin-left:60px;
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
</head>
<body>
    <div class="container">
        <main>
            <img src="/FinalProject0430/img/이미지2/음리1.png" alt="">
        </main>
        <%
		String rememberId = "";
		String check = "";
		Cookie[] cookies = request.getCookies(); // 요청 헤더의 모든 쿠키 얻기
		if (cookies != null) {
			for (Cookie c : cookies) { // 쿠키 각각의
				String cookieName = c.getName(); // 쿠키 이름 얻기
				if ("id".equals(cookieName)) {
			rememberId = c.getValue();
			check = "checked";
				}
			}
		}
				if (!rememberId.equals(""))
			check = "checked";
		%>
        <form action="<c:url value='./login'/>" method="post">
            <div class="box">
            <input type="hidden" name="toUrl"value="${param.toUrl}">
            <input type="hidden" name="num"value="${param.num}">
                <div class="login-wrap">
                    <div class="input-wrap">    
                        <input type="text" id="id" name="id" value="${cookie.id.value }" required placeholder="아이디를 입력하세요">
                        <input type="password" id="pwd" name="pwd" required placeholder="비밀번호를 입력하세요">
                    </div>
                            <c:if test="${not empty param.loginError}">
            아이디와 비밀번호를 확인해주세요
        </c:if>
                    <input type="submit" onclick="login()" value="로그인"></input>
                </div>
                <div class="remember">
                    <label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "" : "checked"}>아이디 기억</label>
                </div>
                <footer>
                	<div id="flex">	
                    	<button class="not" onclick="page()">비회원</button>	
                    	<button onclick="gogo()">회원가입</button>
                    </div>
                   <div id="flex" style="margin-top:-50px; ">
                    	<button onclick="checkid()">아이디 찾기</button>	
                    	<button onclick="checkpw()">비밀번호 찾기</button>
                    </div>
                </footer>

                </div>
        </form>
            </div>
    <script>
    <%if (request.getParameter("loginError") != null) {%>
	document.querySelector("#msg").innerText = "아이디와 비밀번호를 확인해주세요"
<%}%>
function formCheck(frm) {
	if (frm.id.value.length == 0) {
		setMessage("아이디를 입력해주세요", frm.id);
		return false;
	}

	if (frm.pass.value.length == 0) {
		setMessage("비밀번호를 입력해주세요", frm.pwd);
		return false;
	}
	return true;
}

function setMessage(msg, element) {
	document.getElementById("msg").innerHTML = msg;
	if (element) {
		element.select();
	}
}


         function page() {
        	 <%session.invalidate(); %>
            window.location.href = "area";
        }

        function gogo() {
            window.location.href = "register";
        }
        
        function checkid() {
            window.location.href = "checkid";
        }
        
        function checkpw() {
            window.location.href = "checkpw";
        }
        function setMessage(msg, element) {
			document.getElementById("msg").innerHTML = msg;
			if (element) {
				element.select();
			}
		}
        
    </script>
</body>
</html>