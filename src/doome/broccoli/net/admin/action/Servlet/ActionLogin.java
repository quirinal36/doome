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
		response.setContentType("text/html; charset=UTF-8");
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String id = request.getParameter("login_id");
		String pwd = request.getParameter("login_pwd");
		
		logger.info("id::"+id);
		logger.info("pwd: " + pwd);
		
		User user = new User();
		user.setLogin(id);
		user.setPwd(pwd);
		
		LoginWorker action = new LoginWorker();
		User loginedUser = action.login(user);
		
		HttpSession session = request.getSession();
		
		if(loginedUser != null && loginedUser.getId()>0) {
			session.setAttribute(Config.SESSION_IS_LOGIN, true);
			response.sendRedirect("/index.jsp");
		}else {
			session.setAttribute(Config.SESSION_IS_LOGIN, false);
			
			PrintWriter out;
			try {
				out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('로그인이 실패했습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
