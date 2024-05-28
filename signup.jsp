<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/signup.css">
</head>
<body>
    <header>
        <div id="Logo">
            <h1 id="logo">
                <a href="#">컴퓨터 소프트웨어 학과</a>
            </h1>
        </div>
        <div id="Menu">
            <ul id="menu">
                <li><a href="#">학과안내</a></li>
                <li><a href="#">교과과정</a></li>
                <li><a href="#">취업/게시판</a></li>
                <li><a href="#">수강/민원</a></li>
                <li><a href="#">이용시설</a></li>
             </ul>
        </div>
    </header>
    <div id="signBox">
        <h1 id="sign">회원가입</h1>
        <form action="signupProcess.jsp" method="post">
            <label class="id">이름</label>
            <input type="text" name="username" class="login" required><br>
            <label class="id">학번(아이디)</label>
            <input type="text" name="id" class="login" required><br>
            <label class="id">비밀번호</label>
            <input type="password" name="password" class="login" required><br>
            <label class="id">비밀번호 확인</label>
            <input type="password" name="passwordCheck" class="login" required><br>
            <label class="id">전화번호</label>
            <input type="tel" name="phone" class="login" required><br>
            <label class="id">이메일</label>
            <input type="email" name="email" class="login" required><br>
            <label class="id">생년월일</label>
            <ul id="Birth_li"><br>
                <li><input class="Birth_lists" type="number" name="birth_year" placeholder="년(4자)" required></li>                
                <li><input class="Birth_lists" type="number" name="birth_month" placeholder="월" required></li>
                <li><input class="Birth_lists" type="number" name="birth_day" placeholder="일" required></li>
            </ul>
            <label for="gender1">
                선택 <span class="identify">*</span>
            </label>
            <div>
                <label>
                <input type="radio" name="role" id="role1" value="S" required />
                학생
                </label>
                <label>
                <input type="radio" name="role" id="role2" value="P" required />
                조교, 교수
                </label>
            </div>
            <button type="submit">회원가입</button>
        </form>
    </div>
</body>
</html>