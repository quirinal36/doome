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
	
	int id;
	int user;
	String title;
	String content;
	String attach;
	String writeDate;
	
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
	public static Board parseToBoard(ResultSet rs) throws SQLException {
		Board result = new Board();
		result.setId(rs.getInt(ID_KEY));
		result.setTitle(rs.getString(TITLE_KEY));
		result.setUser(rs.getInt(USER_KEY));
		result.setWriteDate(rs.getString(WRITE_DATE));
		
		return result;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
