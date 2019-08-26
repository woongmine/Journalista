package kr.co.journalista;

import java.util.Date;

public class EreplyVO {
	
	private Integer ere_no;
	private Integer m_no;
	private Integer e_no;
	private String email;
	private String name;
	private String ere_text;
	private String ere_ip;
	private Date regdate;
	private Date updatedate;
	public Integer getEre_no() {
		return ere_no;
	}
	public void setEre_no(Integer ere_no) {
		this.ere_no = ere_no;
	}
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	public Integer getE_no() {
		return e_no;
	}
	public void setE_no(Integer e_no) {
		this.e_no = e_no;
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
	public String getEre_text() {
		return ere_text;
	}
	public void setEre_text(String ere_text) {
		this.ere_text = ere_text;
	}
	public String getEre_ip() {
		return ere_ip;
	}
	public void setEre_ip(String ere_ip) {
		this.ere_ip = ere_ip;
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
	
	
}
