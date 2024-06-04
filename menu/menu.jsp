<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="menu.css">
    <title>Document</title>
</head>
<body>
    <header>
        <h1 id="logo">
            <a href="#">컴퓨터 소프트웨어학과</a>
        </h1>
        <nav id="nav" class="nav">
            <div id="nav__menus">
                <div class="nav__main_menu">
                    <h3 class="nav__menu">
                        <a href="#">학과안내</a>
                    </h3>
                    <ul class="nav__list">
                        <li><a href="#">학과 소개</a></li>
                        <li><a href="#">교수진 소개</a></li>
                        <li><a href="#">전공심화</a></li>
                    </ul>
                </div>
                <div class="nav__main_menu">
                    <h3 class="nav__menu"><a href="#">교과 과정</a></h3>
                    <ul class="nav__list">
                        <li><a href="#">1학년</a></li>
                        <li><a href="#">2학년</a></li>
                        <li><a href="#">전공심화</a></li>
                    </ul>
                </div>
                <div class="nav__main_menu">
                    <h3 class="nav__menu"><a href="#">취업/학생 게시판</a></h3>
                    <ul class="nav__list">
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">취업 게시판</a></li>
                        <li><a href="#">재학생 게시판</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                    </ul>
                </div>
                <div class="nav__main_menu">
                    <h3 class="nav__menu"><a href="#">수강/민원</a></h3>
                    <ul class="nav__list">
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">수강신청 문의</a></li>
                        <li><a href="#">민원 문의</a></li>
                    </ul>
                </div>
                <div class="nav__main_menu">
                    <h3 class="nav__menu"><a href="#">이용시설</a></h3>
                    <ul class="nav__list">
                        <li><a href="#">교내 시설</a></li>
                        <li><a href="#">기숙사</a></li>
                        <li><a href="#">편의시설</a></li>
                        <li><a href="#">오시는 길</a></li>
                    </ul>
                </div>
                <div id="nav__login">
                    <h3 class="nav__menu"><a href="Login/Login.html">로그인/회원가입</a></h3>
                </div>
                <!-- x 아이콘 -->
                <i id="exit" class='bx bx-x' ></i>
            </div>
            <!-- 메뉴바 아이콘 -->
        </nav>
        <i id="menubar" class='bx bx-menu'></i>
    </header>
    <script src="menu.js"></script>
</body>
</html>
