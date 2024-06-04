package com.cap.mvc;


public class PostDTO {
	private int post_num;
	private String post_name;
	private String post_comment;
	private String p_student_number;
	private String post_writtendate;
	
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
	public String getP_student_number() {
		return p_student_number;
	}
	public void setP_student_number(String p_student_number) {
		this.p_student_number = p_student_number;
	}
	public String getPost_writtendate() {
		return post_writtendate;
	}
	public void setPost_writtendate(String post_writtendate) {
		this.post_writtendate = post_writtendate;
	}
		
}