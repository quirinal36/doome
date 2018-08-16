package doome.broccoli.net.board.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Board {
	public static final String ID_KEY = "ID";
	public static final String USER_KEY = "USER";
	public static final String TITLE_KEY = "TITLE";
	public static final String CONTENT_KEY = "CONTENT";
	public static final String ATTACH_KEY = "ATTACH";
	public static final String WRITE_DATE = "WRITE_DATE";
	public static final String WRITER_NAME = "NAME";
	public static final String USER_NAME = "USER_NAME";
	public static final String USER_PHONE = "USER_PHONE";
	
	int id;
	int user;
	String title;
	String content;
	String attach;
	String writeDate;
	String writerName;
	String userName;
	String userPhone;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public static Board parseToBoard(ResultSet rs) throws SQLException {
		Board result = new Board();
		
		result.setId(rs.getInt(ID_KEY));
		result.setTitle(rs.getString(TITLE_KEY));
		result.setUser(rs.getInt(USER_KEY));
		result.setWriteDate(rs.getString(WRITE_DATE));
		result.setContent(rs.getString(CONTENT_KEY));
		result.setWriterName(rs.getString(WRITER_NAME));
		result.setUserName(rs.getString(USER_NAME));
		result.setUserPhone(rs.getString(USER_PHONE));
		
		return result;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
