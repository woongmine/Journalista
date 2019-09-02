package kr.co.journalista;

public class LoginDTO {
	
		private String email;
		private String password;
		private static boolean useCookie;
		private int leave;
		private int auth;
		
		
		
		
		public int getAuth() {
			return auth;
		}
		public void setAuth(int auth) {
			this.auth = auth;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public static boolean isUseCookie() {
			return useCookie;
		}
		public void setUseCookie(boolean useCookie) {
			this.useCookie = useCookie;
		}
		
		public int isLeave() {
			return leave;
		}
		public void setLeave(int leave) {
			this.leave = leave;
		}
		@Override
		public String toString() {
			return "LoginDTO [email=" + email + ", password=" + password + ", useCookie=" + useCookie + ", leave=" + leave+ "]";
		}
		
		
}
