package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/custusersearch")
public class CustUserSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		String search = req.getParameter("search");
		String option = req.getParameter("option");
		int choice=0;
		if(option.equalsIgnoreCase("id")) choice = 1;	
		else if(option.equalsIgnoreCase("name")) choice = 2;	
		else choice = 3;	
		
		CustUserDao dao = CustUserDao.getInstance();
		List<CustUserDto> list = dao.searchCustuser(choice, search);
		req.setAttribute("custlist", list);
		this.forward("custusersearch.jsp", req, resp);
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher(link);
		dis.forward(req, resp);
		
	}
	

}
