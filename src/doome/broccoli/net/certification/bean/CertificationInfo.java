package doome.broccoli.net.certification.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CertificationInfo {
	public static final String ID_KEY = "ID";
	public static final String NAME_KEY = "NAME";
	public static final String IMG_SMALL_KEY = "IMG_SMALL";
	public static final String IMG_LARGE_KEY = "IMG_LARGE";
	
	int id;
	String name;
	String img_small;
	String img_large;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg_small() {
		return img_small;
	}
	public void setImg_small(String img_small) {
		this.img_small = img_small;
	}
	public String getImg_large() {
		return img_large;
	}
	public void setImg_large(String img_large) {
		this.img_large = img_large;
	}
	public static CertificationInfo parseToCertificationInfo(ResultSet rs) throws SQLException {
		CertificationInfo result = new CertificationInfo();
		
		result.setId(rs.getInt(ID_KEY));
		result.setImg_large(rs.getString(IMG_LARGE_KEY));
		result.setImg_small(rs.getString(IMG_SMALL_KEY));
		result.setName(rs.getString(NAME_KEY));
		
		return result;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
