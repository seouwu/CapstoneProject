package com.cap.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.cap.comm.JdbcConnectUtil;
 
 public class PrivateDAO {    
 	private static PrivateDAO pDao;
 	private Connection con;
 	private PreparedStatement pstmt;
 	private ResultSet rs;
 	private int result;
 	
 	public PrivateDAO() {
 		con = JdbcConnectUtil.getConnection();
 	}
 	
 	public boolean loginCheck(String id, String pw) {
 		PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {   	
            String strQuery = "select id, pw from private_info where id = ? and pw = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	JdbcConnectUtil.close(con, pstmt, null);
        }
        return loginCon;
 	}
 	
 	public boolean privateInsert(PrivateDTO pDTO) {
 		PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            String strQuery = "insert into users values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, pDTO.getP_student_number());
            pstmt.setInt(2, pDTO.getStudent_grade());
            pstmt.setString(3, pDTO.getPhone_number());
            pstmt.setString(4, pDTO.getEmail());
            pstmt.setString(5, pDTO.getId());
            pstmt.setString(6, pDTO.getPw());
            int count = pstmt.executeUpdate();
            
            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	JdbcConnectUtil.close(con, pstmt, null);
        }
        return flag;
 		
 	}
 }//class