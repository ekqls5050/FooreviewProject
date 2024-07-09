<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="fileFrm" name="fileFrm" enctype="multipart/form-data">
	<input type="text" name="content">
    <!-- 실제 파일 정보가 저장됨  -->
	<input type="file" name="uploadFile" id="uploadFile"  accept="image/*"/>
	<label for="lfileName" id="lfileName"></label>
	<input class="btn btn-primary" id="deleteBtn" type="button" value="삭제" />
	<br>
   <!-- 파일 이름이 저장됨 -->
	<input type="hidden" name="fileName" id="fileName" value="">
	<input type='hidden' name="fileEx" id="fileEx" value=1><!--file등록여부 : 1 (등록)  0 (등록x)  -->
	<input type="button" id="writeBtn" value="등록">
	<div id="preview"><img id="previewImg" src="/bd/resources/24f50d0d-7fee-4792-8f49-abb2301906f7_computer-tower.png"></div>
</form>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>

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