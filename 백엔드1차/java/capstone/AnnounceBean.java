package capstone;

import java.sql.Timestamp;

import java.sql.Timestamp;

public class AnnounceBean {
	 private int post_num;
    private String post_name;
    private String post_comment;
    private String a_student_number;
    private Timestamp post_writtendate; 
    private String management_access;
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getPost_name() {
		return post_name;
	}
	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}
	public String getPost_comment() {
		return post_comment;
	}
	public void setPost_comment(String post_comment) {
		this.post_comment = post_comment;
	}
	public String getA_student_number() {
		return a_student_number;
	}
	public void setA_student_number(String a_student_number) {
		this.a_student_number = a_student_number;
	}
	public Timestamp getPost_writtendate() {
		return post_writtendate;
	}
	public void setPost_writtendate(Timestamp post_writtendate) {
		this.post_writtendate = post_writtendate;
	}
	public String getManagement_access() {
		return management_access;
	}
	public void setManagement_access(String management_access) {
		this.management_access = management_access;
	}

}
