package doome.broccoli.net.menu.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
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
	String pageDescription;
	
	public static final String MENUID_KEY = "menu_id";
	public static final String ID_KEY = "id";
	public static final String UPPERID_KEY = "upper_id";
	public static final String NAME_KEY = "name";
	public static final String LINK_KEY = "link";
	public static final String IMAGE_KEY = "image";
	public static final String IS_CATEGORY_KEY = "is_category";
	public static final String DESCRIPTION_KEY = "page_description";
	
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
	public String getPageDescription() {
		return pageDescription;
	}
	public void setPageDescription(String pageDescription) {
		this.pageDescription = pageDescription;
	}
	
	public static Menu parseToMenu(JSONObject input) {
		Menu menu = new Menu();
		
		menu.setId((int)input.get(ID_KEY));
		menu.setUpperId((int)input.get(UPPERID_KEY));
		menu.setName((String)input.get(NAME_KEY));
		menu.setLink((String)input.get(LINK_KEY));
		menu.setImage((String)input.get(IMAGE_KEY));
		menu.setCategory((String)input.get(IS_CATEGORY_KEY));
		menu.setPageDescription((String)input.get(DESCRIPTION_KEY));
		return menu;
	}
	public static JSONObject parseToJSON(ResultSet rs) throws SQLException {
		JSONObject item = new JSONObject();
		int id 		 		= rs.getInt(Menu.ID_KEY);
		String name  		= rs.getString(Menu.NAME_KEY);
		int upperId  		= rs.getInt(Menu.UPPERID_KEY);
		String link  		= rs.getString(Menu.LINK_KEY);
		String image 		= rs.getString(Menu.IMAGE_KEY);
		String isCategory 	= rs.getString(Menu.IS_CATEGORY_KEY);
		String pageDesc		= rs.getString(Menu.DESCRIPTION_KEY);
		
		item.put(Menu.ID_KEY, id);
		item.put(Menu.NAME_KEY, name);
		item.put(Menu.UPPERID_KEY, upperId);
		item.put(Menu.LINK_KEY, link);
		item.put(Menu.IMAGE_KEY, image);
		item.put(Menu.IS_CATEGORY_KEY, isCategory);
		item.put(Menu.DESCRIPTION_KEY, pageDesc);
		
		return item;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
