package doome.broccoli.net.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doome.broccoli.net.menu.action.MenuAction;
import doome.broccoli.net.menu.bean.Menu;

/**
 * Servlet implementation class ActionMenuInsert
 */
@WebServlet("/ActionMenuInsert")
public class ActionMenuInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Logger logger = Logger.getLogger(ActionMenuInsert.class.getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionMenuInsert() {
        super();
        // TODO Auto-generated constructor stub
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
		Menu menu = new Menu();
		
		menu.setId(Integer.parseInt(request.getParameter(Menu.ID_KEY)));
		menu.setImage(request.getParameter(Menu.IMAGE_KEY));
		menu.setLink(request.getParameter(Menu.LINK_KEY));
		menu.setName(request.getParameter(Menu.NAME_KEY));
		menu.setPageDescription(request.getParameter(Menu.DESCRIPTION_KEY));
		
		MenuAction action = new MenuAction();
		int result = action.updateMenuInfo(menu);
		
		if(result > 0) {
			PrintWriter out = response.getWriter();
			out.print("success");
		}
	}

}
