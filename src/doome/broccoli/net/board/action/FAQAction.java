package doome.broccoli.net.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import doome.broccoli.net.board.bean.Faq;
import doome.broccoli.net.db.DBconn;

public class FAQAction {
	
	public boolean writeBoard(Faq input) {
		boolean result = false;
		
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
			StringBuilder query = new StringBuilder();
			query.append("Insert into Faq (title, content)")
			.append("values (?,?)");
			PreparedStatement stmt = conn.prepareStatement(query.toString());
			stmt.setString(1, input.getTitle());
			stmt.setString(2, input.getContent());
			if(stmt.executeUpdate()>0) {
				result = true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Faq> getBoard(){
		ArrayList<Faq> list = new ArrayList<>();
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Faq");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Faq faq = Faq.parsToeFaq(rs);
				list.add(faq);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
