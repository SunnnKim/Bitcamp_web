package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/custuserupdate")
public class CustUserUpdate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		CustUserDao dao = CustUserDao.getInstance();
		// 수정하기 view 입력
		if(command.equals("view")) {
			String id = req.getParameter("id");
	
			CustUserDto dto = dao.showCustUserDetail(id);
			
			req.setAttribute("dto", dto);
			this.forward("custuserUpdate.jsp", req, resp);
		}
		else {
			//수정하기 DB
			String id = req.getParameter("id");
			String address = req.getParameter("address");
		
			boolean isS = dao.updateCustUser(id, address);
			this.forward("finding.jsp?isS="+isS, req, resp);
			
		}
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);
		
	}
}
