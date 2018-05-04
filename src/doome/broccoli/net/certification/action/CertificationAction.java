package doome.broccoli.net.certification.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import doome.broccoli.net.certification.bean.CertificationInfo;
import doome.broccoli.net.db.DBconn;

public class CertificationAction {

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
