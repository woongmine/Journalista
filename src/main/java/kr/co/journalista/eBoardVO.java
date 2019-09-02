package kr.co.journalista;

import java.util.Date;

public class eBoardVO {
	private int e_no;
	private int m_no;
	private String email;
	private String name;
	private int e_hit;
	private Date e_datetime;
	private String e_title;
	private String e_contents;
	private String e_ip;
	private int e_del;
	private String category;
	private int score;
	private int like;
	private int like_check;
	private int recnt;
	private String trackback;
	private String evaluation;
	private int j_no;
	private double total_score;
	private String articletitle;
	
	
	public double getTotal_score() {
		return total_score;
	}
	public void setTotal_score(double total_score) {
		this.total_score = total_score;
	}
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public String getTrackback() {
		return trackback;
	}
	public void setTrackback(String trackback) {
		this.trackback = trackback;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
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
	public int getE_hit() {
		return e_hit;
	}
	public void setE_hit(int e_hit) {
		this.e_hit = e_hit;
	}
	public Date getE_datetime() {
		return e_datetime;
	}
	public void setE_datetime(Date e_datetime) {
		this.e_datetime = e_datetime;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_contents() {
		return e_contents;
	}
	public void setE_contents(String e_contents) {
		this.e_contents = e_contents;
	}
	public String getE_ip() {
		return e_ip;
	}
	public void setE_ip(String e_ip) {
		this.e_ip = e_ip;
	}
	public int getE_del() {
		return e_del;
	}
	public void setE_del(int e_del) {
		this.e_del = e_del;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getArticletitle() {
		return articletitle;
	}
	public void setArticletitle(String articletitle) {
		this.articletitle = articletitle;
	}
	
	 
}
