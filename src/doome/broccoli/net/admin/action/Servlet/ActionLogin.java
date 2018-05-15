package doome.broccoli.net.admin.action.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import doome.broccoli.net.Config;
import doome.broccoli.net.admin.action.LoginWorker;
import doome.broccoli.net.admin.bean.User;

/**
 * Servlet implementation class ActionLogin
 */
@WebServlet("/ActionLogin")
public class ActionLogin extends HttpServlet {
	Logger logger = Logger.getLogger(ActionLogin.class.getSimpleName());
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionLogin() {
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
		LoginWorker action = new LoginWorker();
		User user = new User();
		
		response.setContentType("text/html; charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String id = request.getParameter("login_id");
		String pwd = request.getParameter("login_pwd");
		
		user.setLogin(id);
		user.setPwd(pwd);
		User loginedUser = action.login(user);

		int loginResult = -1;
		String error_txt = new String();		
		if(loginedUser.getId() == 0) {
			// ID 가 없습니다.
			loginResult = User.NO_LOGIN;
			error_txt = User.NO_LOGIN_TXT;
		} else if(loginedUser.getPwd() != null){
			final String decryptedPwd = action.getDecryptedPwd(loginedUser.getPwd());
			if(!user.getPwd().equals(decryptedPwd)) {
				// 비밀번호가 틀립니다
				loginResult = User.PWD_INVALID;
				error_txt = User.PWD_INVALID_TXT;
			}else {
				// 로그인 성공입니다
				loginResult = User.SUCCESS_LOGIN;
				setSession(loginedUser, request);
			}
		}
		
		PrintWriter out;
		try {
			out = response.getWriter();
			JSONObject resultJson = new JSONObject();
			resultJson.put("login_result", loginResult);
			resultJson.put("error_txt", error_txt);
			out.print(resultJson.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 로그인 성공시 세션 정보 셋팅
	 * @param loginedUser
	 * @param request
	 */
	private void setSession(User loginedUser, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		session.setAttribute(Config.SESSION_IS_LOGIN, true);
		session.setAttribute(Config.SESSION_LOGIN_USERID, loginedUser.getId());
		session.setAttribute(Config.SESSION_LOGIN_USERNAME, loginedUser.getLogin());
	}
}
