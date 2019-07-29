package doome.broccoli.net.board.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Faq {
	public static final String ID_KEY 		= "ID";
	public static final String TITLE_KEY 	= "TITLE";
	public static final String CONTENT_KEY	= "CONTENT";
	
	int id;
	String title;
	String content;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public static Faq parsToeFaq(ResultSet input) throws SQLException {
		Faq result = new Faq();
		result.setId(input.getInt(ID_KEY));
		result.setTitle(input.getString(TITLE_KEY));
		result.setContent(input.getString(CONTENT_KEY));
		return result;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
