# Fooreview

## 개요
각 지역별 음식점 리뷰 플랫폼 'Fooreview'   

## 목표
웹 디자인/퍼블리싱 및 JAVA,SPRING,MYSQL을 통한 Web 개발

## 비즈니스 요구사항
- 이메일, 닉네임은 중복 불가능  
- 음식점 조회를 제외한 모든 기능은 인증된 사용자만 가능  
- 음식점/리뷰 수정, 삭제는 해당 글을 작성한 사용자만 가능  
- 한 사용자는 한 게시글에 하나의 리뷰만 등록 가능
- 마이페이지 기능은 이메일, 생년월일, 비밀번호, 지역 변경가능
- 음식점 리뷰를 통해 별점 평가 가능
- 사용자가 쓴 리뷰의 음식점, 좋아요를 누른 음식점 펼쳐보기 가능

## 개발 프로세스
- Vue-cli 2, Proxy, env, eslint 설정
- 디자인/퍼블리싱
- 기능 구현
- AWS EC2 배포

## Client-Side에서의 역할
- API Validation을 1차적으로 client-side에서 검증
- Validation에 어긋나는 부분을 사용자가 명확하게 인지할 수 있도록 구현
- Jwt Refresh Token Request를 사용자가 인지하지 못하도록 구현(끊김 없는 서비스 이용 가능)

## 구현 내용
- 디자인/퍼블리싱 및 각 페이지 스크립트 개발
- 권한이 없는 접근 방지를 위한 Router Guard 구현
- 짧은 AccessToken을 통한 보안 강화, Axios Interceptors 및 RefreshToken을 통한 끊김 없는 서비스 구성

## 프로젝트 환경
- Editor : Eclipse,STS
- Framework : Spring Framework

## 디렉토리 구조
├── .settings
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── ekqlsart
│   │   │           └── ekqls
│   │   │               ├── Controller
│   │   │               ├── dao
│   │   │               └── dt
│   │   ├── webapp
│   │   │   ├── WEB-INF
│   │   │   │   └── views
│   │   │   │       ├── admin.jsp
│   │   │   │       ├── adminedit.jsp
│   │   │   │       ├── areachoose.jsp
│   │   │   │       ├── boardwrite2.jsp
│   │   │   │       ├── checkedid.jsp
│   │   │   │       ├── checkedpw.jsp
│   │   │   │       ├── commentboard.jsp
│   │   │   │       ├── commentedit.jsp
│   │   │   │       ├── editboard.jsp
│   │   │   │       ├── firstPage.jsp
│   │   │   │       ├── foodChoose.jsp
│   │   │   │       ├── foood.jsp
│   │   │   │       ├── likeboard.jsp
│   │   │   │       ├── mypage.jsp
│   │   │   │       ├── regipage.jsp
│   │   │   │       └── view.jsp
│   │   │   │           
│   │   │   │           
├── target
├── .classpath
├── .project
├── .springBeans
├── README.md
└── pom.xml
