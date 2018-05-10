package doome.broccoli.net.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import doome.broccoli.net.board.bean.Board;
import doome.broccoli.net.board.bean.Paging;
import doome.broccoli.net.db.DBconn;

public class QuestionAction {

	public Board getQuestion(int id) {
		Board result = new Board();
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM question WHERE id=?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				result = Board.parseToBoard(rs);
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
	public int getQuestionCount() {
		int result = 0;
		
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT count(*) FROM question");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
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
	public ArrayList<Board> getQuestion(Paging paging) {
		ArrayList<Board> list = new ArrayList<>();
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM question WHERE 1=1 order by id desc limit ?, ?");
			stmt.setInt(1, paging.getFrom());
			stmt.setInt(2, paging.getTo());
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Board board = Board.parseToBoard(rs);
				list.add(board);
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
		return list;
	}
	public boolean writeBoard(Board input) {
		boolean result = false;
		
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
		
			StringBuilder query = new StringBuilder();
			query.append("Insert into question (title, content, write_date, attach, user)")
			.append("values (?,?,?,?,?)");

			PreparedStatement stmt = conn.prepareStatement(query.toString());
			stmt.setString(1, input.getTitle());
			stmt.setString(2, input.getContent());
			stmt.setString(3, input.getWriteDate());
			stmt.setString(4, input.getAttach());
			stmt.setInt(5, input.getUser());

			if(stmt.executeUpdate() > 0) {
				result = true;
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
		return result;
	}
}
