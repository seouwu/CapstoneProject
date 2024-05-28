package capstone;

 import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
 
 public class PrivateDAO {    
 	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
 	private final String JDBC_URL = "jdbc:mysql://localhost:3306/capstone?characterEncoding=utf-8";
 	private final String USER = "root";
 	private final String PASS = "1234";
 
 	public PrivateDAO() {
 	 try{
 	   Class.forName(JDBC_DRIVER);
 	   }catch(Exception e){
 	      System.out.println("Error : JDBC 드라이버 로딩 실패");
 	   }
     }
 
    public void insertMember(PrivateDTO mem) {
  	   Connection conn = null;
  	   PreparedStatement pstmt = null;
          try {
            conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
            
    		pstmt =  conn.prepareStatement("insert into private_info values (?, ?, ?, ?, ?, ?, ?)");
    		pstmt.setString(1, mem.getStudent_name());
    		pstmt.setString(2, mem.getP_student_number());
    		pstmt.setString(3, mem.getPhone_number());
    		pstmt.setString(4, mem.getEmail());
    		pstmt.setString(5, mem.getId());
    		pstmt.setString(6, mem.getPw());
    		pstmt.setInt(7, mem.getStudent_grade());
    		
    		pstmt.executeUpdate();
         } catch (Exception ex) {
            System.out.println("Exception" + ex);
         } finally {
  		  if(pstmt!=null) try{pstmt.close();}catch(SQLException e){}
  	      if(conn!=null) try{conn.close();}catch(SQLException e){}
         }
         return ;
      }
    
    public ArrayList<PrivateDTO> getMemberList() {
	   Connection conn = null;
	   Statement stmt = null;
       ResultSet rs = null;
       ArrayList<PrivateDTO> vecList = new ArrayList<PrivateDTO>();
       try {
          conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
          String strQuery = "select * from private_info";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			 PrivateDTO regBean = new PrivateDTO();
		 	 regBean.setStudent_name(rs.getString("student_name"));
			 regBean.setP_student_number(rs.getString("p_student_number"));
 			 regBean.setId(rs.getString("id"));
 			 regBean.setPw(rs.getString("pw"));
 			 regBean.setEmail(rs.getString("email"));
 			 regBean.setPhone_number(rs.getString("phone_number"));
 			 regBean.setStudent_grade(rs.getInt(rs.getString("student_grade")));
             vecList.add(regBean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
          if(rs!=null)   try{rs.close();}  catch(SQLException e){}
		  if(stmt!=null) try{stmt.close();}catch(SQLException e){}
	      if(conn!=null) try{conn.close();}catch(SQLException e){}
       }
       return vecList;
    }
    
    public int loginControll(String id, String pw) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
           conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
           String strQuery = "select * from private_info where id = ?";
           pstmt = conn.prepareStatement(strQuery);
           pstmt.setString(1, id);
           rs = pstmt.executeQuery();
           if (rs.next()) {
        	   if (rs.getString(1).contentEquals(pw)) {
        		   return 1; //로그인 성공
        	   } else {
        		   return 0; //비밀번호 불일치
        	   }
           }
           return -1; //아이디가 없음
        } catch (Exception ex) {
        	System.out.println("Exception" + ex);
        } finally {
        	if(rs!=null)   try{rs.close();}  catch(SQLException e){}
        	if(pstmt!=null) try{pstmt.close();}catch(SQLException e){}
        	if(conn!=null) try{conn.close();}catch(SQLException e){}
        }
        return -2; //db 오류
    }

 }//class