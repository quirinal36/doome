package doome.broccoli.net.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import doome.broccoli.net.Config;
import doome.broccoli.net.bean.Menu;

public class DBconn {
	private String userName 	= "root";
	private String password 	= "789gagul";
	private String dbms 		= "mysql";
	private String dbName 		= "doome";
	private String serverName 	= Config.DB_URL;	
	private int portNumber 		= 3306;
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
	    Connection conn = null;
	    Properties connectionProps = new Properties();
	    connectionProps.put("user", this.userName);
	    connectionProps.put("password", this.password);

	    if (this.dbms.equals("mysql")) {
	        conn = DriverManager.getConnection(
	                   "jdbc:" + this.dbms + "://" +
	                   this.serverName +
	                   ":" + this.portNumber + "/" +
	                   this.dbName + "?" +
	                   "useSSL=false",
	                   connectionProps);
	    } else if (this.dbms.equals("derby")) {
	        conn = DriverManager.getConnection(
	                   "jdbc:" + this.dbms + ":" +
	                   this.dbName +
	                   ";create=true",
	                   connectionProps);
	    }
//	    System.out.println("Connected to database");
	    return conn;
	}
	
	public ArrayList<Menu> getMenus(JSONObject input){
		ArrayList<Menu> result = new ArrayList<>();
		JSONArray array = (JSONArray)input.get("list");
		for(int i=0; i<array.size(); i++) {
			result.add(Menu.parseToMenu((JSONObject)array.get(i)));
		}
		return result;
	}
	public JSONObject getMenus() {
		JSONObject resultObj = new JSONObject();
		Connection conn = null;
		try {
			conn = getConnection();
		
			Statement stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("SELECT * FROM menus");
			
			JSONArray array = new JSONArray();
			while(rs.next()){
				array.add(parseToJSON(rs));
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
	private JSONObject parseToJSON(ResultSet rs) throws SQLException {
		JSONObject item = new JSONObject();
		int id 		 = rs.getInt(Menu.ID_KEY);
		String name  = rs.getString(Menu.NAME_KEY);
		int upperId  = rs.getInt(Menu.UPPERID_KEY);
		String link  = rs.getString(Menu.LINK_KEY);
		String image = rs.getString(Menu.IMAGE_KEY);
		item.put(Menu.ID_KEY, id);
		item.put(Menu.NAME_KEY, name);
		item.put(Menu.UPPERID_KEY, upperId);
		item.put(Menu.LINK_KEY, link);
		item.put(Menu.IMAGE_KEY, image);
		return item;
	}
	public Menu getMenuInfo(String menuId) {
		Menu menu = null;
		Connection conn = null;
		if(menuId!=null && menuId.length() > 0) {
			try {
				conn = getConnection();
			
				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM menus WHERE id = ?");
				ResultSet rs;
				stmt.setString(1, menuId);
				rs = stmt.executeQuery();
				while(rs.next()) {
					menu = Menu.parseToMenu(parseToJSON(rs));
				}
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
			
		}
		return menu;
	}
}