package capstone;

import java.sql.*;
import java.util.ArrayList;

public class PostMgr {
    // 데이터베이스 연결 정보
    private final String jdbcURL = "jdbc:mysql://localhost:3308/capstone?characterEncoding=utf-8"; 
    private final String jdbcUsername = "root"; // 데이터베이스 사용자 이름
    private final String jdbcPassword = "1234"; // 데이터베이스 비밀번호

    public PostMgr() {
        try {
            // MySQL JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<PostBean> getPosts() {
        ArrayList<PostBean> posts = new ArrayList<>();
        String sql = "SELECT post_num, post_name, post_comment, p_student_number, post_writtendate, management_access FROM post";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                // 각 열의 데이터를 읽어와 PostBean 객체에 설정합니다.
                PostBean post = new PostBean();
                post.setPost_num(resultSet.getInt("post_num"));
                post.setPost_name(resultSet.getString("post_name"));
                post.setPost_comment(resultSet.getString("post_comment"));
                post.setP_student_number(resultSet.getString("p_student_number"));
                post.setPost_writtendate(resultSet.getTimestamp("post_writtendate"));
                post.setManagement_access(resultSet.getString("management_access"));

                // 리스트에 게시물을 추가합니다.
                posts.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }
}
