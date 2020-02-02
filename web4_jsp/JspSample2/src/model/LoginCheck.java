package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.MemberDao;
import dto.MemberDto;

@WebServlet("/logincheck")
public class LoginCheck extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		MemberDao dao = MemberDao.getInstance();
		boolean b = dao.checkLogin(id, pwd);
		System.out.println(b);
		
		if(b) {
			MemberDto dto = dao.getLoginUser(id);
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", dto);
		}
		
		resp.sendRedirect("login_form/logincheck.jsp?b="+b+"&id="+id);
		
	}
	
}
