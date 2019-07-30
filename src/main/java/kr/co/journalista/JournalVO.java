package kr.co.journalista;

public class JournalVO {
	private int p_no, j_no; //언론사고유번호,기자고유번호
	private String journal_name, journal_email, press, journal_part, journal_pass; //기자이름,기자 이메일,언론사,기자분야
	
	public String getJournal_pass() {
		return journal_pass;
	}
	public void setJournal_pass(String journal_pass) {
		this.journal_pass = journal_pass;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public String getJournal_name() {
		return journal_name;
	}
	public void setJournal_name(String journal_name) {
		this.journal_name = journal_name;
	}
	public String getJournal_email() {
		return journal_email;
	}
	public void setJournal_email(String journal_email) {
		this.journal_email = journal_email;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getJournal_part() {
		return journal_part;
	}
	public void setJournal_part(String journal_part) {
		this.journal_part = journal_part;
	}
}
