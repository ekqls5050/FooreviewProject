<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>별 평가</title>
<style>
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
</head>
<body>
<div class="stars" onclick="rateStars(event)">
    <img src="${pageContext.request.contextPath}/mini/음식사진/투명별.png" alt="별1" id="star1">
    <img src="${pageContext.request.contextPath}/mini/음식사진/투명별.png" alt="별2" id="star2">
    <img src="${pageContext.request.contextPath}/mini/음식사진/투명별.png" alt="별3" id="star3">
    <img src="${pageContext.request.contextPath}/mini/음식사진/투명별.png" alt="별4" id="star4">
    <img src="${pageContext.request.contextPath}/mini/음식사진/투명별.png" alt="별5" id="star5">
</div>
<div id="rating"></div>

<script>
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
            stars[j].src = "${pageContext.request.contextPath}/mini/음식사진/노란별.png"; // 클릭한 별부터 왼쪽 별까지 노란색 별로 변경
        } else {
            stars[j].src = "${pageContext.request.contextPath}/mini/음식사진/투명별.png"; // 클릭한 별 이후의 별은 투명별로 유지
        }
    }

    rating.textContent = "평점: " + clickedStar + "/5"; // 평점 표시
}
</script>
</body>
</html>