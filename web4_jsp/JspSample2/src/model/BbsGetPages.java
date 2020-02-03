package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDao;

@WebServlet("/bbsgetpages")
public class BbsGetPages extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String choice = req.getParameter("choice");
		String searchTxt = req.getParameter("searchTxt");
		// 페이지개수 구하는 서블릿
		BbsDao dao = BbsDao.getInstance();
		
		int num = 0;
		
		if(choice.equals("") || choice == null ) {
			num = dao.getListSize("", "");
		}
		else {
			num = dao.getListSize(choice, searchTxt);
		}
		System.out.println(num);
		
		// ajax로 보낼 것
		resp.getWriter().print(num);
		resp.setContentType("application/x-json; charset=UTF-8");	// 안쓰면 한글이 안됨
	
	
	}
	
	
	
}
