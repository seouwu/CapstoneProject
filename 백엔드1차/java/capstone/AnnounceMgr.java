package capstone;

import java.sql.*;
import java.util.ArrayList;

public class AnnounceMgr {
    // 데이터베이스 연결 정보
    private final String jdbcURL = "jdbc:mysql://localhost:3308/capstone?characterEncoding=utf-8"; 
    private final String jdbcUsername = "root"; // 데이터베이스 사용자 이름
    private final String jdbcPassword = "1234"; // 데이터베이스 비밀번호

    public AnnounceMgr() {
        try {
            // MySQL JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<AnnounceBean> getAnnounce() {
        ArrayList<AnnounceBean> anns = new ArrayList<>();
        String sql = "SELECT post_num, post_name, post_comment, a_student_number, post_writtendate, management_access FROM announce";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                // 각 열의 데이터를 읽어와 AnnounceBean 객체에 설정합니다.
                AnnounceBean ann = new AnnounceBean();
                ann.setPost_num(resultSet.getInt("post_num"));
                ann.setPost_name(resultSet.getString("post_name"));
                ann.setPost_comment(resultSet.getString("post_comment"));
                ann.setA_student_number(resultSet.getString("a_student_number"));
                ann.setPost_writtendate(resultSet.getTimestamp("post_writtendate"));
                ann.setManagement_access(resultSet.getString("management_access"));

                // 리스트에 게시물을 추가합니다.
                anns.add(ann);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return anns;
    }
}
