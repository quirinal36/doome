package doome.broccoli.net.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import doome.broccoli.net.board.bean.Board;
import doome.broccoli.net.board.bean.Pagination;
import doome.broccoli.net.db.DBconn;

public class BoardAction {

	public ArrayList<Board> getBoard(Board input, Pagination paging) {
		ArrayList<Board> list = new ArrayList<>();
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM board limit ?, ?");
			stmt.setInt(1, paging.getFrom());
			stmt.setInt(2, paging.getTo());
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
		return list;
	}
	public boolean writeBoard(Board input) {
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
		
			StringBuilder query = new StringBuilder();
			query.append("Insert into board (title, content, write_date, attach, user)")
			.append("values (?,?,?,?,?)");

			PreparedStatement stmt = conn.prepareStatement(query.toString());
			stmt.setString(1, input.getTitle());
			stmt.setString(2, input.getContent());
			stmt.setString(3, input.getWriteDate());
			stmt.setString(4, input.getAttach());
			stmt.setInt(5, input.getUser());

			//		ResultSet rs;
			int result = stmt.executeUpdate();
			conn.close();

			if(result > 0) {
				return true;
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
		return false;
	}
}
