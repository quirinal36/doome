package doome.broccoli.net.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import doome.broccoli.net.board.bean.Media;
import doome.broccoli.net.db.DBconn;

public class MediaAction {
	
	public Media getMedia(int id) {
		Media result = new Media();
		
		return result;
	}
	
	public ArrayList<Media> getMedia(){
		ArrayList<Media> result = new ArrayList<>();
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM media WHERE 1=1 order by id desc");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Media media = Media.parseToMedia(rs);
				result.add(media);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public boolean writeMedia(Media input) {
		boolean result = false;
		
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			StringBuilder query = new StringBuilder();
			query.append("Insert into media (title, content, date, image, url)")
				.append("values (?, ? , ?, ?, ?)");
			
			PreparedStatement stmt = conn.prepareStatement(query.toString());
			stmt.setString(1, input.getTitle());
			stmt.setString(2, input.getContent());
			stmt.setString(3, input.getDate());
			stmt.setString(4, input.getImage());
			stmt.setString(5, input.getUrl());
			
			if(stmt.executeUpdate() > 0) {
				result = true;
			}
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
