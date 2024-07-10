# Fooreview

## 개요
비대면 모임 빌딩 플랫폼 '홈택트' Front-end  

## 목표
웹 디자인/퍼블리싱 및 홈택트 API를 사용하는 Web Front-end 개발

## 비즈니스 요구사항
- 이메일, 닉네임은 중복 불가능  
- 음식점 조회를 제외한 모든 기능은 인증된 사용자만 가능  
- 음식점/리뷰 수정, 삭제는 해당 글을 작성한 사용자만 가능  
- 한 사용자는 한 게시글에 하나의 리만 등록 가능  

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
- Editor : VS Code
- Framework : Vue-cli 2

## 디렉토리 구조
    ├── public
    │   ├── favicon.ico
    |   └── index.html
    ├── src
    │   ├── api
    │   ├── assets
    │   │   └── styles
    │   ├── components
    │   │   ├── layout
    │   │   └── views
    │   ├── images
    │   ├── router
    │   │   └── index.js
    │   ├── store
    │   │   └── index.js
    │   ├── App.vue
    │   └── main.js
    ├── .env.development
    ├── .env.production
    ├── .eslintrc.js
    ├── .gitignore
    ├── .babel.config.js
    ├── jsconfig.json
    ├── package-lock.json
    ├── package.json
    ├── README.md
    └── vue.config.js
