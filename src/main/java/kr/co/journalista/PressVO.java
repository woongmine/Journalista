package kr.co.journalista;

public class PressVO {
	private String press_name, press_pass, press_type;
	private float press_score;

	public float getPress_score() {
		return press_score;
	}

	public void setPress_score(float press_score) {
		this.press_score = press_score;
	}

	public String getPress_name() {
		return press_name;
	}

	public void setPress_name(String press_name) {
		this.press_name = press_name;
	}

	public String getPress_pass() {
		return press_pass;
	}

	public void setPress_pass(String press_pass) {
		this.press_pass = press_pass;
	}

	public String getPress_type() {
		return press_type;
	}

	public void setPress_type(String press_type) {
		this.press_type = press_type;
	}
}
