package doome.broccoli.net.menu.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Logger;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import doome.broccoli.net.db.DBconn;
import doome.broccoli.net.menu.bean.Menu;

public class MenuAction {
	Logger logger = Logger.getLogger(MenuAction.class.getSimpleName());
	
	public HashMap<Integer, Menu> getMenusMap(){
		HashMap<Integer, Menu> map = new HashMap<>();
		JSONArray array = (JSONArray)getMenusJson().get("list");
		for(int i=0; i<array.size(); i++) {
			Menu menu = Menu.parseToMenu((JSONObject)array.get(i));
			map.put(menu.getId(), menu);
		}
		return map;
	}
	public ArrayList<Menu> getMenus(){
		ArrayList<Menu> result = new ArrayList<>();
		JSONArray array = (JSONArray)getMenusJson().get("list");
		for(int i=0; i<array.size(); i++) {
			result.add(Menu.parseToMenu((JSONObject)array.get(i)));
		}
		return result;
	}
	
	public JSONObject getMenusJson() {
		DBconn db = new DBconn();
		JSONObject resultObj = new JSONObject();
		Connection conn = null;
		try {
			conn = db.getConnection();
		
			Statement stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("SELECT * FROM menus WHERE is_category = 1");
			
			JSONArray array = new JSONArray();
			while(rs.next()){
				array.add(Menu.parseToJSON(rs));
			}
			resultObj.put("list", array);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return resultObj;
	}
	public int updateMenuInfo(Menu menu) {
		int result = 0;
		
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			StringBuilder query = new StringBuilder();
			query.append("update menus set")
				.append(" name = ?,")
				.append(" link = ?,")
				.append(" image =?,")
				.append(" page_description=?")
				.append(" where id=?");
			
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement(query.toString());
			
			stmt.setString(1, menu.getName());
			stmt.setString(2, menu.getLink());
			stmt.setString(3, menu.getImage());
			stmt.setString(4, menu.getPageDescription());
			stmt.setInt(5, menu.getId());
			
			result = stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
