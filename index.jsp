<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="postMgr" class="capstone.PostMgr" scope="page" />
<jsp:useBean id="announceMgr" class="capstone.AnnounceMgr" scope="page" />
<jsp:useBean id="privateDAO" class="capstone.PrivateDAO" scope="page" />

<%@ page import="capstone.PostBean" %>
<%@ page import="capstone.AnnounceBean" %>
<%@ page import="capstone.PrivateDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<%
	ArrayList<PostBean> posts = postMgr.getPosts();
	ArrayList<AnnounceBean> anns = announceMgr.getAnnounce();
	ArrayList<PrivateDTO> vecList = privateDAO.getMemberList();
%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>컴퓨터소프트웨어학과</title>
    <!-----------icon------------------ -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    
    <!-- css -->
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <div id="wrap">
        <%@ include file="menu.jsp" %>
        
        <div id="container">
            <!-- 이미지 -->
            <div id="imgContainer">
                <div id="imgController">
                    <button id="left"><i class='bx bx-chevron-left'></i></button>
                    <button id="right"><i class='bx bx-chevron-right'></i></button>
                </div>
                <div id="imgControllerBtn">
                    <button type="button"><i id="img1" class='bx bxs-circle'></i></button>
                    <button type="button"><i id="img2" class='bx bxs-circle'></i></button>
                    <button type="button"><i id="img3" class='bx bxs-circle'></i></button>
                </div>
                <input type="button" id="imgAdd" value="배너변경">
            </div>
            <!-- 게시판 -->
            <div id="boardContainer">
                <div id="board">
                    <div id="board1" class="boards">
                        <div class="boardHeader">
                            <div id="board1btn1" class="Info">공지사항</div>
                            <div id="board1btn2" class="Info">취업 커뮤니티</div>
                        </div>
                        <div id="boardContents1" class="boardContents">
                           <!-- 공지사항 (announce) 취업 (work)에 대한 java코드 필요 -->
                           <% if (anns != null && !anns.isEmpty()) { 
						        for (int i = 0; i < 4; i++) { 
						            if (i < anns.size()) {
						                AnnounceBean ann = anns.get(i); 
						                String postName = ann.getPost_name();
						                if (postName.length() > 30) {
					                        postName = postName.substring(0, 26) + "...";
					                    }%>
						                <div class="contents">
						                    <a href="#">
						                    	<%= ann.getPost_num() %>.
						                        <%= postName %> 
						                    </a>
						                </div>
						            <% } else { %>
						                <div class="contents">
						                <%= (i+1) %>.
						                    <a href="#"><%= (i+1) %>번째 게시물입니다.</a>
						                </div>
						            <% } 
						        	} 
							    } else { %>
							        <div class="contents">
							            <p>게시물이 없습니다.</p>
							        </div>
							<% } %>
                        </div>
                        <div id="boardContents2" class="boardContents">
                            <div id="Othercontents" class="contents">
                                <a href="#">취업 1번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">취업 2번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">취업 3번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">취업 4번째 내용입니다.</a>
                            </div>
                        </div>
                    </div>
                    <div id="board2" class="boards">
                        <div class="boardHeader">
                            <a href="#">
                                <span>재학생 커뮤니티</span>
                                <i class='bx bx-plus'></i>
                            </a>
                        </div>
                        <div class="boardContents">
    <% 
        if (posts != null && !posts.isEmpty()) { 
            for (int i = 0; i < 4; i++) { 
                if (i < posts.size()) {
                    PostBean post = posts.get(i);  
                    String studentName;
                    if ("x".equals(post.getP_student_number())) {
                        studentName = "익명";
                    } else {
                        studentName = privateDAO.getStudentNameByNumber(post.getP_student_number());
                    }
    %>
                    <div class="contents">
                        <a href="#">
                            <!-- 게시물 번호, 이름, 학생 이름을 출력 -->
                            <%= post.getPost_num() %>.
                            <%= post.getPost_name() %> - 
                            <%= studentName %>
                        </a>
                    </div>
    <% 
                } else { 
    %>
                    <div class="contents">
                        <%= (i+1) %>.
                        <a href="#"><%= (i+1) %>번째 게시물입니다.</a>
                    </div>
    <% 
                } 
            } } else { 
    %>
        <div class="contents">
            <p>게시물이 없습니다.</p>
        </div>
    <% 
        } 
    %>
</div>


                    </div>
                    <div id="board3" class="boards">
                        <div class="boardHeader">
                            <a href="#">
                                <span> 캡스톤 게시판</span>
                                <i class='bx bx-plus'></i>
                            </a>
                        </div>
                        <div class="boardContents">
                            <div class="contents">
                                <a href="#">1번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">2번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">3번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">4번째 내용입니다.</a>
                            </div>
                        </div>
                    </div>
                    <div id="board4" class="boards">
                        <div class="boardHeader">
                            <a href="#">
                                <span>학교 식단</span>
                                <i class='bx bx-plus'></i>
                            </a>
                        </div>
                        <div class="boardContents">
                            <div class="contents">
                                <a href="#">1번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">2번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">3번째 내용입니다.</a>
                            </div>
                            <div class="contents">
                                <a href="#">4번째 내용입니다.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 포탈 링크들 -->
            <div id="linkContainer">
                <div id="link">
                    <ul id="linkList">
                        <li>
                            <a href="https://jeiu.ac.kr/" class="main_links_a">
                                <i class='bx bx-laptop' ></i>
                                <h6>포탈</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bx-user' ></i>
                                <h6>입학</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bx-edit' ></i>
                                <h6>LMS</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bxs-notification' ></i>
                                <h6>공지사항</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bx-book-open'></i>
                                <h6>도서관</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bx-bowl-rice' ></i>
                                <h6>교내식당</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bx-bus'></i>
                                <h6>셔틀버스</h6>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="main_links_a">
                                <i class='bx bxs-map' ></i>
                                <h6>오시는 길</h6>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 기타 정보 -->
        <div id="footer" class="footer">
            <div id="footerInfo">
                <div id="info1">인천 재능대학교</div>
                <div id="info2">송도 위치 어쩌고</div>
                <div id="info3">기타 정보들</div>
                <div id="info4">기타 정보들 222</div>
            </div>
        </div>
    </div>
    <script src="index.js"></script>
</body>
</html>
