<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String id = request.getParameter("id");
    String pw = request.getParameter("password");
    String passwordCheck = request.getParameter("passwordCheck");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String birthYear = request.getParameter("birth_year");
    String birthMonth = request.getParameter("birth_month");
    String birthDay = request.getParameter("birth_day");
    String birth = birthYear + birthMonth + birthDay;
    String role = request.getParameter("role");
    String management_access = null;

    if (!pw.equals(passwordCheck)) {
        out.println("<script type='text/javascript'>alert('비밀번호를 확인해주세요'); history.back();</script>");
        return;
    }

    if (role != null) {
        if (role.equals("S")) {
            management_access = "o";
        } else if (role.equals("P")) {
            management_access = "x";
        }
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3308/capstone?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8";
        String dbUser = "root";
        String dbPassword = "1234";
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        
        String sql = "INSERT INTO private_info (p_student_number, student_name, id, pw, phone_number, email, birth) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, id);
        pstmt.setString(2, username);
        pstmt.setString(3, id);
        pstmt.setString(4, pw);
        pstmt.setString(5, phone);
        pstmt.setString(6, email);
        pstmt.setString(7, birth);
        
        int result = pstmt.executeUpdate();
        rs = pstmt.getGeneratedKeys();

        if (result > 0 && rs.next()) {
            int studentNumber = rs.getInt(1);
            rs.close(); // ResultSet 닫기
            pstmt.close(); // 첫 번째 PreparedStatement 닫기

            String sql1 = "INSERT INTO class_info (c_student_number, management_access) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql1);
            pstmt.setInt(1, studentNumber);
            pstmt.setString(2, management_access);
            int result1 = pstmt.executeUpdate();

            if (result1 > 0) {
                out.println("<script type='text/javascript'>alert('회원가입 성공!'); location.href='index.jsp';</script>");
                response.sendRedirect("index.jsp");                
            } else {
                out.println("<script type='text/javascript'>alert('회원가입 실패, 다시 시도해주세요'); history.back();</script>");
            }
        } else {
            out.println("<script type='text/javascript'>alert('회원가입 성공!'); history.back();</script>");
            response.sendRedirect("index.jsp");            
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
</body>
</html>
