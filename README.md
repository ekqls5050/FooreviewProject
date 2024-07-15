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
- 관리자아이디(ekqls5050)는 관리자 페이지를 통해서 회원가입한 아이디의 정보 변경,삭제 가능
- 음식점 리뷰를 통해 별점 평가 가능
- view페이지에서 카카오API를 통해 지도위치 표시
- 사용자가 쓴 리뷰의 음식점, 좋아요를 누른 음식점 펼쳐보기 가능

## 개발 프로세스
- 디자인/퍼블리싱
- POM.XML 라이브러리 설정
- 비즈니스 로직 생성
- 요구사항에 맞는 인증, 인가 적용
- 기능 구현
  
## 구현 내용
- 디자인/퍼블리싱 및 각 페이지 스크립트 개발
- Junit을 사용하여 테스트 수행
- 사용자가 로그인할때 세션에 정보를 저장하고 로그인된 상태를 유지하기 위해 Cookie를 생성했으며,
  이를통해 사용자의 인증과 권한 부여를 관리
- 각 입력 필드에 대해 기본 유효성 검사를 수행하며 사용자의 데이터를 검증
- 사용자 로그인, 회원가입, 음식점 정보 조회, 리뷰 작성 및 수정 등의 기능을 위한 RESTful API를 설계및 구현.
- 다양한 예외 상황을 처리하기 위해 이메일, 생년월일, 지역 등의 정보는 세션에 저장된 ID를 통해 가져오고, 예외 발생 시 이를 처리하는 코드를 구현
## 프로젝트 환경
- IDE: Eclipse,STS
- Framework : Spring Framework
- Language: Java 11
- DB: Mysql
- Server: Tomkat 9.0

## 디렉토리 구조
    ├── .settings
    ├── src
    │   ├── main
    │   │   ├── java
    │   │   │   └── com
    │   │   │       └── ekqlsart
    │   │   │           └── ekqls
    │   │   │               ├── Controller
                                ├── AreaController.java
                                ├── EmailController.java
                                ├── FoodChooseController.java
                                ├── FoodController.java
                                ├── LoginController.java
                                ├── RegiController.java
                                └── ViewController.java
    │   │   │               ├── dao
                                ├── BoardDao1.java
                                ├── BoardDao1Impl.java
                                ├── CommentDao1.java
                                ├── CommentDao1Impl.java
                                ├── LikeboardDao1.java
                                ├── LikeboardDao1Impl.java
                                ├── MailService.java
                                ├── MemberDao1.java
                                └── MemberDao1Impl.java
    │   │   │               └── dto
                                ├── board.java
                                ├── comment.java
                                ├── likeboard.java
                                └── member.java
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
