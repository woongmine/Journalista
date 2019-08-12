package kr.co.journalista;

import java.util.Date;

public class WrBoardVO {
	private int wr_no;
	private int m_no;
	private String email;
	private String name;
	private int wr_hit;
	private Date wr_datetime;
	private String wr_title;
	private String wr_contents;
	private String wr_ip;
	private int wr_del;
	private String category;
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	private int num;
	

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getWr_no() {
		return wr_no;
	}
	public void setWr_no(int wr_no) {
		this.wr_no = wr_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getWr_hit() {
		return wr_hit;
	}
	public void setWr_hit(int wr_hit) {
		this.wr_hit = wr_hit;
	}
	public Date getWr_datetime() {
		return wr_datetime;
	}
	public void setWr_datetime(Date wr_datetime) {
		this.wr_datetime = wr_datetime;
	}
	public String getWr_title() {
		return wr_title;
	}
	public void setWr_title(String wr_title) {
		this.wr_title = wr_title;
	}
	public String getWr_contents() {
		return wr_contents;
	}
	public void setWr_contents(String wr_contents) {
		this.wr_contents = wr_contents;
	}
	public String getWr_ip() {
		return wr_ip;
	}
	public void setWr_ip(String wr_ip) {
		this.wr_ip = wr_ip;
	}
	public int getWr_del() {
		return wr_del;
	}
	public void setWr_del(int wr_del) {
		this.wr_del = wr_del;
	}
	 
	 
}
