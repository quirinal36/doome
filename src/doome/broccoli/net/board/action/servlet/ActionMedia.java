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

import doome.broccoli.net.board.action.MediaAction;
import doome.broccoli.net.board.bean.Media;

/**
 * Servlet implementation class ActionMedia
 */
@WebServlet("/ActionMedia")
public class ActionMedia extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Logger logger = Logger.getLogger(ActionMedia.class.getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionMedia() {
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
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		final String titleParam 	= request.getParameter("meta_title");
		final String contentParam 	= request.getParameter("meta_content");
		final String dateParam		= request.getParameter("meta_published_time");
		final String urlParam		= request.getParameter("meta_url");
		final String imgParam		= request.getParameter("meta_img");
		
		Media media = new Media();
		media.setTitle(titleParam);
		media.setContent(contentParam);
		media.setDate(dateParam);
		media.setUrl(urlParam);
		media.setImage(imgParam);
		
		MediaAction action = new MediaAction();
		boolean writeResult = action.writeMedia(media);
		
		if(writeResult) {
			try {
				response.sendRedirect("/page.jsp?menu_id=13");
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
