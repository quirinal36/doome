package doome.broccoli.net.board.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Media {
	
	public static final String ID_KEY 		= "ID";
	public static final String TITLE_KEY 	= "TITLE";
	public static final String CONTENT_KEY	= "CONTENT";
	public static final String DATE_KEY		= "DATE";
	public static final String USER_KEY		= "USER";
	public static final String IMAGE_KEY	= "IMAGE";
	public static final String URL_KEY		= "URL";
	
	int id;
	String title;
	String content;
	String date;
	int user;
	String image;
	String url;
	
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		/*
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date fDate = new Date();
		try {
			fDate = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		*/
		this.date = date;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public static Media parseToMedia(ResultSet rs) throws SQLException {
		Media media = new Media();
		
		media.setContent(rs.getString(CONTENT_KEY));
		media.setDate(rs.getString(DATE_KEY));
		media.setId(rs.getInt(ID_KEY));
		media.setImage(rs.getString(IMAGE_KEY));
		media.setTitle(rs.getString(TITLE_KEY));
		media.setUrl(rs.getString(URL_KEY));
		media.setUser(rs.getInt(USER_KEY));
		
		return media;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
