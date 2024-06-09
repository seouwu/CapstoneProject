package capstone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3308/capstone?characterEncoding=utf-8";
    private final String jdbcUsername = "root"; // 데이터베이스 사용자 이름
    private final String jdbcPassword = "1234"; // 데이터베이스 비밀번호

    public PostDAO() {
        try {
            // MySQL JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean insertPost(PostBean post) {
        try (
            // 데이터베이스 연결
            Connection conn = DBConnectionMgr.getInstance().getConnection();
            // SQL 쿼리 실행을 위한 PreparedStatement 생성
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO post (post_name, p_student_number, post_writtendate, post_content) VALUES (?, ?, ?, ?)")
        ) {
            // PreparedStatement에 값 설정
            pstmt.setString(1, post.getPost_name());
            pstmt.setString(2, post.getP_student_number());
            pstmt.setTimestamp(3, post.getPost_writtendate());
            pstmt.setString(4, post.getPost_content());

            // 쿼리 실행 및 결과 확인
            int rowCount = pstmt.executeUpdate();
            return rowCount > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
