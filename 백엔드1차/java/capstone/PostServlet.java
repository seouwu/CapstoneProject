package capstone;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자가 입력한 데이터를 얻어옴
        String post_name = request.getParameter("post_name");
        String student_number = request.getParameter("student_number");
        String post_content = request.getParameter("post_content");

        // 현재 시간을 Timestamp 형식으로 가져옴
        Timestamp post_writtendate = new Timestamp(System.currentTimeMillis());

        // PostBean 객체 생성 및 데이터 설정
        PostBean post = new PostBean();
        post.setPost_name(post_name);
        post.setP_student_number(student_number);
        post.setPost_writtendate(post_writtendate);
        post.setPost_content(post_content);

        // PostDAO 객체 생성
        PostDAO postDAO = new PostDAO();

        // insertPost 메서드 호출
        boolean result = postDAO.insertPost(post);

        // 처리 결과에 따른 응답
        if (result) {
            // 처리 성공
            response.sendRedirect("success.jsp");
        } else {
            // 처리 실패
            String errorMessage = "글을 작성하시려면 로그인 절차가 필요합니다.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
