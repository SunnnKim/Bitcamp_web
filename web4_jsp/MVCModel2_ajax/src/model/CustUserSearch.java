package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.http.HTTPException;

import com.google.gson.Gson;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/custusersearch")
public class CustUserSearch extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws HTTPException, IOException{
		
		CustUserDao dao = CustUserDao.getInstance();

		String soption = req.getParameter("option");
		String search = req.getParameter("search");
		
		
		int option = Integer.parseInt(soption);
		List<CustUserDto> list = dao.searchCustuser(option, search);
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		String gson = new Gson().toJson(list);
		
		resp.getWriter().write(gson);
		
		
	
	}
}
