package doome.broccoli.net.board.action.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doome.broccoli.net.board.action.FAQAction;
import doome.broccoli.net.board.bean.Faq;

/**
 * Servlet implementation class ActionFaq
 */
@WebServlet("/ActionFaq")
public class ActionFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Logger logger = Logger.getLogger(ActionFaq.class.getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionFaq() {
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
		final String titleParam = request.getParameter("faq_input_title");
		final String contentParam = request.getParameter("faq_input_content");
		
		Faq faq = new Faq();
		faq.setTitle(titleParam);
		faq.setContent(contentParam);
		
		FAQAction action = new FAQAction();
		boolean writeResult = action.writeBoard(faq);
		
		if(writeResult) {
			try {
				response.sendRedirect("/page.jsp?menu_id=14");
			}catch(IOException e) {
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
