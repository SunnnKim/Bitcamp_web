package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/custuserdetail")
public class CustUserDetail extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		CustUserDao dao = CustUserDao.getInstance();
		CustUserDto dto = dao.showCustUserDetail(id);
		
		String gson = new Gson().toJson(dto);	// Object to Gson Data
		
		// GSON 으로 list를 json으로 변환해주기
		resp.setContentType("application/json");	// 보내는 데이터 형식을 json으로 변환
		resp.setCharacterEncoding("utf-8");			// 한글을 정상으로 출력
		
		resp.getWriter().write(gson);	// setAttribute and send
	
	
	}

	
	
}
