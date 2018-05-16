package doome.broccoli.net.board.action.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAction
 */
@WebServlet("/FileUploadAction")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(FileUploadAction.class.getSimpleName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			//response.setContentType("multipart/form-data; charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String path = getServletContext().getRealPath("/");
		
		logger.info("path::"+path);
		
		MultipartRequest multi=new MultipartRequest(request, path, 15*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		String upFile = multi.getFilesystemName("Filedata");
		if(!upFile.equals("")) {
			logger.info("upFile::"+upFile);
		}
	}

}
