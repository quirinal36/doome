package doome.broccoli.net.certification.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import doome.broccoli.net.certification.bean.CertificationInfo;
import doome.broccoli.net.db.DBconn;

public class CertificationAction {

	public HashMap<Integer, String> getCertificationTypes(){
		HashMap<Integer, String> result = new HashMap<>();
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM CertificationType");
			while(rs.next()) {
				result.put(rs.getInt("ID"), rs.getString("name"));
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
	public ArrayList<CertificationInfo> getCertifications(){
		ArrayList<CertificationInfo> result = new ArrayList<>();
		
		DBconn db = new DBconn();
		Connection conn = null;
		try {
			conn = db.getConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Certifications");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				result.add(CertificationInfo.parseToCertificationInfo(rs));
			}
		}catch(ClassNotFoundException e) {
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
