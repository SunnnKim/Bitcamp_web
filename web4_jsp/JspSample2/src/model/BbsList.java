package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import com.google.gson.Gson;

import dao.BbsDao;
import dto.BbsDto;

@WebServlet("/bbslist")
public class BbsList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		BbsDao dao = BbsDao.getInstance();
		List<BbsDto> list = dao.getBbsList(0);
		req.setAttribute("list", list);
		
		// forward로 보내기
		RequestDispatcher dis = req.getRequestDispatcher("./bbs_jsp/bbslist.jsp");
		dis.forward(req, resp);
		
	
	}

	

	
}
