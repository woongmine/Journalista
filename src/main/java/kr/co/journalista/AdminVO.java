package kr.co.journalista;

public class AdminVO {
	private int a_no; //어드민 고유넘버
	private String admin_id;
	private String password;
	private String admin_name;

	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", password=" + password + ", admin_name=" + admin_name + "]";
	}
}
