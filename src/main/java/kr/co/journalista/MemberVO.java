package kr.co.journalista;

public class MemberVO {
	private String email;
	private String name;
	private String password;
	private int leave;
	private int auth;
	private String email_key;
	
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
	
	
}
