package doome.broccoli.net.bean;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Menu {
	int id;
	int upperId;
	String link;
	String name;
	public static final String ID_KEY = "id";
	public static final String UPPERID_KEY = "upper_id";
	public static final String NAME_KEY = "name";
	public static final String LINK_KEY = "link";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUpperId() {
		return upperId;
	}
	public void setUpperId(int upperId) {
		this.upperId = upperId;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
