package doome.broccoli.net.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		logger.info("doPost");
		final String editorParam = request.getParameter("ir1");
		final String title = request.getParameter("title");
		
		logger.info("editorParam::"+editorParam +"//title::"+title);
		
		Board board = new Board(); 
		board.setContent(editorParam);
		board.setUser(1);
		board.setTitle(title);
		
		BoardAction action = new BoardAction();
		Boolean writeResult = false;
		writeResult = action.writeBoard(board);
		
		try {
			response.sendRedirect("/page.jsp?menu_id=12&writeResult="+writeResult);
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

}
