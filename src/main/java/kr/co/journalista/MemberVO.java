package kr.co.journalista;

import java.util.Date;

public class MemberVO {
	private int m_no;
	private String email;
	private String name;
	private String password;
	private String passwordCheck;
	private int leave;
	private int auth;
	private String email_key;
	private Date Reg_date;
	private Date withdrawal_date;
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}
	public int getLeave() {
		return leave;
	}
	public void setLeave(int leave) {
		this.leave = leave;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getEmail_key() {
		return email_key;
	}
	public void setEmail_key(String email_key) {
		this.email_key = email_key;
	}
	public Date getReg_date() {
		return Reg_date;
	}
	public void setReg_date(Date reg_date) {
		Reg_date = reg_date;
	}
	public Date getWithdrawal_date() {
		return withdrawal_date;
	}
	public void setWithdrawal_date(Date withdrawal_date) {
		this.withdrawal_date = withdrawal_date;
	}
	

	
}