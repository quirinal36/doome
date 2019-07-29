package doome.broccoli.net.admin.action;

import java.nio.charset.StandardCharsets;
import java.security.DigestException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import doome.broccoli.net.Config;
import doome.broccoli.net.admin.bean.User;
import doome.broccoli.net.db.DBconn;

public class SignUpWorker {
	
	public boolean makeSignUp(User user) {
		boolean result = false;
		DBconn db = new DBconn();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			
			StringBuilder query = new StringBuilder();
			query.append("Insert into User (name, email, password)")
			.append("values (?,?,?)");
			PreparedStatement stmt = conn.prepareStatement(query.toString());
			
			stmt.setString(1, user.getLogin());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPwd());
			
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
