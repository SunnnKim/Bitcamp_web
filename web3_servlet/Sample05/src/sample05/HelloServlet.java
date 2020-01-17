package sample05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HelloServlet extends HttpServlet {

	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("hello Servlet");
		
		String age = req.getParameter("age");
		System.out.println("age: " + age);
		
		
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// resp.setHeader() : url사용
		
		String url = req.getParameter("url");
		
		
		// link 를 설정한 경우는 HttpServletResponse 설정을 해주어야 링크로 이동한다
		resp.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
		
		
		// 링크 걸어주기
		if(url.equals("naver.com")) {
			// setHeader : 링크걸어줌 Location은 고정 값 
			resp.setHeader("Location", "http://www.naver.com");
		}
		else if(url.equals("google.com")) {
			resp.setHeader("Location", "http://www.google.com");
		}
		else {
			resp.setHeader("Location", "http://www.zum.com");
		}
		
		
	}

}
