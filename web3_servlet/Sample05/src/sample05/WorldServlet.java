package sample05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WorldServlet extends HttpServlet {

	// 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//sendRedirect () : 자주쓰이는 링크 이동, url사용하지 않고 다른 html페이지로 갔다가 그곳에서 이동
		String url = req.getParameter("url");
		
		
		// link 를 설정한 경우는 HttpServletResponse 설정을 해주어야 링크로 이동한다
		resp.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);	
		
		// 링크 걸어주기
		if(url.equals("naver.com")) {
			// 이동시켜주는 또다른 함수
			// sendRedirect
			resp.sendRedirect("naver.html");
			// naver.html 페이지로 이동함
		}
//		else if(url.equals("google.com")) {
//			resp.sendRedirect("http://www.google.com");
//		}
//		else {
//			resp.sendRedirect("http://www.zum.com");
//		}
		

	
	}

}
