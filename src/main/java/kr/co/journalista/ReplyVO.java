package kr.co.journalista;

import java.util.Date;

public class ReplyVO {
	
	private Integer re_no;
	private Integer wr_no;
	private String re_text;
	private String email;
	private String name;
	private Date regdate;
	private Date updatedate;
	
	
	public Integer getRe_no() {
		return re_no;
	}
	public void setRe_no(Integer re_no) {
		this.re_no = re_no;
	}
	public Integer getWr_no() {
		return wr_no;
	}
	public void setWr_no(Integer wr_no) {
		this.wr_no = wr_no;
	}
	public String getRe_text() {
		return re_text;
	}
	public void setRe_text(String re_text) {
		this.re_text = re_text;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "ReplyVO [re_no=" + re_no + ", wr_no=" + wr_no + ", re_text=" + re_text + ", email=" + email + ", name="
				+ name + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	
}
