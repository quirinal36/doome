package doome.broccoli.net.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import doome.broccoli.net.Config;
import doome.broccoli.net.board.action.BoardAction;
import doome.broccoli.net.board.bean.Board;

/**
 * Servlet implementation class ActionWrite
 */
@WebServlet("/ActionWrite")
public class ActionWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Logger logger = Logger.getLogger(getClass().getSimpleName().toString());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionWrite() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		logger.info("doGet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		HttpSession session = request.getSession();
		int writerId = (Integer)session.getAttribute(Config.SESSION_LOGIN_USERID);
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		final String editorParam = request.getParameter("ir1");
		final String title = request.getParameter("title");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		Board board = new Board();
		board.setContent(editorParam);
		board.setUser(writerId);
		board.setTitle(title);
		board.setWriteDate(dateFormat.format(date));
		
		BoardAction action = new BoardAction();
		Boolean writeResult = false;
		writeResult = action.writeBoard(board);
		
		if (writeResult) {
			try {
				response.sendRedirect("/page.jsp?menu_id=12&writeResult="+writeResult);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			PrintWriter out;
			try {
				out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("swal('글이 정상적으로 등록되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}  
		}
	}

}
