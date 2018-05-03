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
	String image;
	boolean isCategory;
	ArrayList<Menu> children;
	
	public static final String ID_KEY = "id";
	public static final String UPPERID_KEY = "upper_id";
	public static final String NAME_KEY = "name";
	public static final String LINK_KEY = "link";
	public static final String IMAGE_KEY = "image";
	public static final String IS_CATEGORY_KEY = "is_category";
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public boolean isCategory() {
		return isCategory;
	}
	public void setCategory(String isCategory) {
		this.isCategory = Integer.parseInt(isCategory) > 1 ? true : false;
	}
	public static Menu parseToMenu(JSONObject input) {
		Menu menu = new Menu();
		
		menu.setId((int)input.get(ID_KEY));
		menu.setUpperId((int)input.get(UPPERID_KEY));
		menu.setName((String)input.get(NAME_KEY));
		menu.setLink((String)input.get(LINK_KEY));
		menu.setImage((String)input.get(IMAGE_KEY));
		menu.setCategory((String)input.get(IS_CATEGORY_KEY));
		
		return menu;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
