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

@WebServlet("/custuserlist")
public class CustUserList extends HttpServlet {
	
	// servlet (controller)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	// 실제로 실행될 메소드
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 싱글턴 생성
		CustUserDao dao = CustUserDao.getInstance();
		
		List<CustUserDto> list = dao.getCustUserList();
		
		req.setAttribute("list", list); // 짐 싸기
		this.forward("custuserlist.jsp", req, resp);
		
		
		
	}
	// 링크 이동하는 함수
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher disp = req.getRequestDispatcher(link);
		disp.forward(req, resp);
		
	}
}

