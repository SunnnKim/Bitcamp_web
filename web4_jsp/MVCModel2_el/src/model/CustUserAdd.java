package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;

@WebServlet("/custuseradd")
public class CustUserAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	// 실제 실행되는 함수
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 가지고 오기 
		String command = req.getParameter("command");
		
		// 회원추가 (고객추가) view 이동
		if(command.equals("add")) {
			
			resp.sendRedirect("custadd.jsp");
		}
		
		// 추가고객 정보 입력 후 고객추가 -> DB
		else if (command.equals("addAf")) {
			CustUserDao dao = CustUserDao.getInstance();
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			
			boolean b = dao.addCustUser(id, name, address);
			resp.sendRedirect("finding.jsp?isS="+b);
			
		}
		
		
	}
	
	

}
