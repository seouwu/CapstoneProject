<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="capstone.PrivateDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css -->
    <link rel="stylesheet" href="board.css">
    <!-- title -->
    <title>게시판</title>
</head>
<body>
    <div id="wrap">
        <div id="board">
            <form action="PostServlet" method="post">
                <h3 name="student_board" id="board_name">학생 게시판</h3>
                <div>
                    <!-- 상단바 -->
                    <div id="board_up" class="board">
                        <h3>제목</h3>
                        <input name="post_name" type="text"> <!-- 변경된 부분 -->
                    </div>
                    <div id="board_nav">
                        <div>
                            <h3>작성일:</h3>
                            <h3 name="writeDate" id="writeDate">
                                <% 
                                    Date now = new Date();
                                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                                    out.print(format.format(now));
                                %>
                            </h3>
                        </div>
                        <div>
                            <h3>작성자:</h3>
                            <h3 name="writerName" id="writerName">
                                <% 
                                    PrivateDTO privateInfo = (PrivateDTO) session.getAttribute("privateInfo");
                                    if(privateInfo != null) {
                                        out.print(privateInfo.getStudent_name());
                                    } else {
                                        out.print("회원정보 없음");
                                    }
                                %>
                            </h3>
                        </div>
                    </div>
                    <!-- 글쓰는 곳 -->
                    <div id="board_mid" class="board">
                        <h3>내용</h3>
                        <textarea name="post_content" id="post_content"></textarea> <!-- 변경된 부분 -->
                    </div>
                    <!-- 하단바 -->
                    <div id="board_down">
                        <button name="submit" type="submit">
                            글 쓰기
                        </button>
                    </div>
                </div>
                <div class="board">
                    <input type="text" name="reply" id="reply">
                    <button type="submit">댓글달기</button>
                </div>
                <div id="" class="board">
                    
                </div>
            </form>
        </div>
    </div>
    <script src="board.js"></script>
</body>
</html>
