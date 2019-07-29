package doome.broccoli.net.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import doome.broccoli.net.board.bean.Board;
import doome.broccoli.net.board.bean.Paging;
import doome.broccoli.net.db.DBconn;

public class BoardAction {
	
	/**
	 * 게시글 삭제하기 
	 * 
	 * @param id
	 * @return 
	 */
	public int deleteBoard(int id) {
		int result = 0;
		
		DBconn db = new DBconn();
		Connection conn= null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("Delete from board where id=?");
		
		try {
			conn = db.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		}catch(ClassNotFoundException c) {
			
		}catch(SQLException s) {
			
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public Board getBoard(int id) {
		Board result = new Board();
		DBconn db = new DBconn();
		Connection conn = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT " ); 
		sb.append("    a.id,");
		sb.append("    a.title,");
		sb.append("    a.content,"); 
		sb.append("    a.write_date,"); 
		sb.append("    a.attach,"); 
		sb.append("    a.user,"); 
		sb.append("    b.name"); 
		sb.append("		FROM"); 
		sb.append("    board a,"); 
		sb.append("    User b"); 
		sb.append("		WHERE"); 
		sb.append("    a.id = ? AND a.user = b.id");
				
		try {
			conn = db.getConnection();
			
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
	public int getBoardCount() {
		int result = 0;
		
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT count(*) FROM board");
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
	
	/**
	 * 공지사항 리스트 받아오기
	 * 
	 * @param paging
	 * @return
	 */
	public ArrayList<Board> getBoard(Paging paging) {
		ArrayList<Board> list = new ArrayList<>();
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();

			StringBuilder builder = new StringBuilder();
			builder.append("SELECT a.*, b.name ");
			builder.append("	FROM board a, User b");
			builder.append("	WHERE a.user = b.id");
			builder.append("	order by a.id desc ");
			builder.append("	limit ?, ?");
			
			// board 에 user 는 
			// User 테이블의 id 의 Foreign Key
			// User 테이블의 name 을 가져와서 저장한다
			PreparedStatement stmt = conn.prepareStatement(builder.toString());
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
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	public boolean writeBoard(Board input) {
		boolean result = false;
		
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