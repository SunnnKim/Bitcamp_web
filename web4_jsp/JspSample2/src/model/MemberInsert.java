package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.MemberDto;

@WebServlet("/memberinsert")
public class MemberInsert extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// service는 doGet + doPost 모두 가능 
		
		// 짐 풀기	
		String id = req.getParameter("id");
		String pwd = req.getParameter("password");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		
		System.out.println("id:" + id);
		System.out.println("pwd:" + pwd);
		System.out.println("email:" + email);
		System.out.println("name:" + name);
		
		
		MemberDto newMem = new MemberDto(id, pwd, name, email, 3);
		
		MemberDao dao = MemberDao.getInstance();
		boolean success = dao.insertMember(newMem);
		
		resp.getWriter().write(success+"");
//		
//		if(success) {
//			// 추가 성공
//			resp.sendRedirect("./login_form/index.html");	// 로그인 폼으로 이동
//		}
//		else {
//			resp.sendRedirect("./member_jsp/join.html");	// 회원가입 폼으로 이동
//			
//		}
		
	
	
	
	}

	
	
}
