package doome.broccoli.net.admin.action.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.DigestException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import java.util.logging.Logger;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import doome.broccoli.net.admin.action.SignUpWorker;
import doome.broccoli.net.admin.bean.User;

/**
 * Servlet implementation class ActionSignUp
 */
@WebServlet("/ActionSignUp")
public class ActionSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Logger logger = Logger.getLogger(ActionSignUp.class.getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionSignUp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("login_id");
		String email = request.getParameter("login_email");
		String pwd = request.getParameter("login_pwd");
		
		User user = new User();
		user.setLogin(id);
		user.setEmail(email);
		user.setPwd(pwd);
		
		SignUpWorker signUp = new SignUpWorker();
		boolean result = signUp.makeSignUp(user);
		
		PrintWriter out;
		out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		if (result && session != null) {
			logger.info("result : " + result);
			session.setAttribute("login_result", result);
			
			JSONObject json = new JSONObject();
			json.put("result", result);
			out.print(json.toJSONString());
		}
	}
}
