package sample10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/dispCookie")
public class DisplayCookie extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		
		pw.println("<p>Display Cookie</p>");
		
		// Java를 사용해서 쿠키를 보여주기
		Cookie cookies[] = req.getCookies();	// 배열로 받아야함
		
		if( cookies != null ) {
			for (int i = 0; i < cookies.length; i++) {
				String value = cookies[i].getValue();	
				// getValue 사용해서 쿠키 값(String) 가져오기
				pw.println("<p>");
				pw.println(cookies[i].getName()); //getName으로 쿠키 이름을 가져오기 (String)
				pw.println(":");
				pw.println(value);
				pw.println("</p>");
			}
		}
		
		pw.println("<a href=visitedCookie>방문횟수</a>");
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

	
	
	
}
