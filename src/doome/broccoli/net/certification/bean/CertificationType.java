package doome.broccoli.net.certification.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CertificationType {
	public static final String ID_KEY = "ID";
	public static final String NAME_KEY = "NAME";
	public static final String CERT_DESC_KEY = "CERT_DESC";
	
	int id;
	String name;
	String certDesc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCertDesc() {
		return certDesc;
	}
	public void setCertDesc(String certDesc) {
		this.certDesc = certDesc;
	}
	
	public static CertificationType parseToCertificationInfo(ResultSet rs) throws SQLException {
		CertificationType result = new CertificationType();
		
		result.setId(rs.getInt(ID_KEY));
		result.setName(rs.getString(NAME_KEY));
		result.setCertDesc(rs.getString(CERT_DESC_KEY));
		
		return result;
	}
	
}
