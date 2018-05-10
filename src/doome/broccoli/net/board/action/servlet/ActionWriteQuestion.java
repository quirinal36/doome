package doome.broccoli.net.board.action.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doome.broccoli.net.board.action.BoardAction;
import doome.broccoli.net.board.action.QuestionAction;
import doome.broccoli.net.board.bean.Board;

/**
 * Servlet implementation class ActionWriteQuestion
 */
@WebServlet("/ActionWriteQuestion")
public class ActionWriteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionWriteQuestion() {
        super();
        // TODO Auto-generated constructor stub
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
		board.setUser(1);
		board.setTitle(title);
		board.setWriteDate(dateFormat.format(date));
		
		QuestionAction action = new QuestionAction();
		Boolean writeResult = false;
		writeResult = action.writeBoard(board);
		
		if (writeResult) {
			try {
				response.sendRedirect("/page.jsp?menu_id=15&writeResult="+writeResult);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			PrintWriter out;
			try {
				out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('글이 정상적으로 등록되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}  
		}
	}

}
