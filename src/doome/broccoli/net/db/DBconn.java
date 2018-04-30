package doome.broccoli.net.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import doome.broccoli.net.bean.Menu;

public class DBconn {
	private String userName 	= "root";
	private String password 	= "789gagul";
	private String dbms 		= "mysql";
	private String dbName 		= "doome";
	private String serverName 	= "35.194.236.5";
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
	
	public String getData() throws SQLException, ClassNotFoundException{
		JSONObject resultObj = new JSONObject();
		Connection conn;
		conn = getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs;
		rs = stmt.executeQuery("SELECT * FROM menus");
		
		JSONArray array = new JSONArray();
		while(rs.next()){
			int id = rs.getInt(Menu.ID_KEY);
			String name = rs.getString(Menu.NAME_KEY);
			int upperId = rs.getInt(Menu.UPPERID_KEY);
			String link = rs.getString(Menu.LINK_KEY);
			
			JSONObject item = new JSONObject();
			item.put(Menu.ID_KEY, id);
			item.put(Menu.NAME_KEY, name);
			item.put(Menu.UPPERID_KEY, upperId);
			item.put(Menu.LINK_KEY, link);
			
			array.add(item);
		}
		resultObj.put("list", array);
		
		return resultObj.toJSONString();
	}
}