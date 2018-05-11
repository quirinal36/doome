package doome.broccoli.net.admin.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import doome.broccoli.net.admin.bean.User;
import doome.broccoli.net.db.DBconn;

public class LoginWorker {

	public User login(User user) {
		User result = new User();
		
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM User WHERE name=? and password=?");
			stmt.setString(1, user.getLogin());
			
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
