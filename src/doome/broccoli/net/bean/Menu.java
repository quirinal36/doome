package doome.broccoli.net.bean;

import java.util.ArrayList;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.json.simple.JSONObject;

public class Menu {
	int id;
	int upperId;
	String link;
	String name;
	ArrayList<Menu> children;
	
	public static final String ID_KEY = "id";
	public static final String UPPERID_KEY = "upper_id";
	public static final String NAME_KEY = "name";
	public static final String LINK_KEY = "link";
	
	public Menu (){
		children = new ArrayList<>();
	}
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
	public ArrayList<Menu> getChildren() {
		return children;
	}
	public void setChildren(ArrayList<Menu> children) {
		this.children = children;
	}
	public static Menu parseToMenu(JSONObject input) {
		Menu menu = new Menu();
		
		menu.setId((int)input.get(ID_KEY));
		menu.setUpperId((int)input.get(UPPERID_KEY));
		menu.setName((String)input.get(NAME_KEY));
		menu.setLink((String)input.get(LINK_KEY));
		
		return menu;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
