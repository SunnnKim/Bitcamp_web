import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.impl.protocol.RequestDispatcherRegistryImpl;

import dto.HumanDto;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송 확인하기
//		System.out.println("HelloServlet doPost");
	
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		String age = req.getParameter("age");		
		String gender = req.getParameter("gender");
		String hobby[] = req.getParameterValues("hobby");
		
		
//		System.out.println("name: " + name);
//		System.out.println("age: " + age);
//		System.out.println("gender: " + gender);
//		
//		for (int i = 0; i < hobby.length; i++) {
//			System.out.println("hobby : " + hobby[i]);
//		}

		HumanDto dto = new HumanDto(name, age, gender, hobby);
		
		// 남성일 경우, manServlet으로 전송 (Redirect)이용
		if(gender.equals("man")) {
			HttpSession session = req.getSession();
			// 세션 없으면 새로 생성
			session.setAttribute("dto",dto );
			session.setMaxInactiveInterval(300);
			
			resp.sendRedirect("man");
		}
		
		else {
			// 여성일 때
			// forward
			
			// 짐싸기
			req.setAttribute("dto", dto);
			RequestDispatcher dispatcher = req.getRequestDispatcher("woman");
			dispatcher.forward(req, resp);
		}
		
		
	}

	
}
