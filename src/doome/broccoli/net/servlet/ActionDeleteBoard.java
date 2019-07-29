package doome.broccoli.net.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import doome.broccoli.net.board.action.BoardAction;

/**
 * Servlet implementation class ActionDeleteBoard
 */
@WebServlet("/deleteBoard")
public class ActionDeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Logger logger = Logger.getLogger(ActionDeleteBoard.class.getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionDeleteBoard() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// logger.info("delete board-->" + );
		String board_num = request.getParameter("num");
		
		if(board_num != null && board_num.length() > 0) {
			int id = Integer.parseInt(board_num);
			
			BoardAction action = new BoardAction();
			int result = action.deleteBoard(id);
			JSONObject json = new JSONObject();
			json.put("result", result);
			
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(json.toJSONString());
			}catch(IOException e) {
				
			}
		}
	}

}
