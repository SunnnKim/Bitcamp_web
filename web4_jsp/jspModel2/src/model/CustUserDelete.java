package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;

@WebServlet("/custuserdel")
public class CustUserDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		String command = req.getParameter("command");
		CustUserDao dao = CustUserDao.getInstance();
		boolean isS = false;
		if(command.equals("one")) {
			// 하나만 삭제하기
			String id = req.getParameter("id");
			isS = dao.deleteOne(id);
			resp.sendRedirect("finding.jsp?isS="+isS);
		}
		else {
			// 여러개 삭제하기
			String ids[] = req.getParameterValues("delck");
			isS = dao.deleteCustusers(ids);
		}
		
		resp.sendRedirect("finding.jsp?isS="+isS);
		
	
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);
		
	}

}
