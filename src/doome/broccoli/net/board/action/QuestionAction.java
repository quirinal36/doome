package doome.broccoli.net.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

import doome.broccoli.net.board.bean.Board;
import doome.broccoli.net.board.bean.Paging;
import doome.broccoli.net.db.DBconn;

public class QuestionAction {
	Logger logger = Logger.getLogger(this.getClass().getSimpleName());
	
	public Board getQuestion(int id) {
		Board result = new Board();
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT " );
			sb.append("    a.id,");
			sb.append("    a.title,");
			sb.append("    a.content,");
			sb.append("    a.write_date,");
			sb.append("    a.attach,");
			sb.append("    a.user,");
			sb.append("		a.user_name,");
			sb.append("		a.user_phone,");
			sb.append("    b.name");
			sb.append("		FROM");
			sb.append("    question a,");
			sb.append("    User b");
			sb.append("		WHERE");
			sb.append("    a.id = ? AND a.user = b.id");
			
			PreparedStatement stmt = conn.prepareStatement(sb.toString());
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
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT a.*, b.name ");
			sb.append("	FROM question a, User b");
			sb.append("	WHERE a.user = b.id");
			sb.append("	order by a.id desc");
			sb.append("	limit ?, ?");
			
			PreparedStatement stmt = conn.prepareStatement(sb.toString());
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
			query.append("Insert into question (title, content, write_date, attach, user, user_name, user_phone)")
			.append("values (?,?,?,?,?,?,?)");

			PreparedStatement stmt = conn.prepareStatement(query.toString());
			stmt.setString(1, input.getTitle());
			stmt.setString(2, input.getContent());
			stmt.setString(3, input.getWriteDate());
			stmt.setString(4, input.getAttach());
			stmt.setInt(5, input.getUser());
			stmt.setString(6, input.getUserName());
			stmt.setString(7, input.getUserPhone());

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
