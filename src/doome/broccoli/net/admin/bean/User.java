package doome.broccoli.net.admin.bean;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class User {
	public static final int NO_LOGIN = 0;
	public static final int PWD_INVALID = 1;
	public static final int SUCCESS_LOGIN = 2;
	
	public static final String PWD_INVALID_TXT	= "비밀번호가 맞지 않습니다.";
	public static final String NO_LOGIN_TXT		= "아이디가 존재하지 않습니다.";
	
	public static final String ID_KEY = "ID";
	public static final String NAME_KEY = "NAME";
	public static final String EMAIL_KEY = "EMAIL";
	public static final String PASSWORD_KEY = "PASSWORD";
	
	int id;
	String login;
	String pwd;
	String email;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
