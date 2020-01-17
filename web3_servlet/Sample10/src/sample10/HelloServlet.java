package sample10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	// cookie & Session
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// Cookie : HttpServletRequest 소속의 addCookie로 저장해준다
		Cookie cookie = new Cookie("id", "abcd123");
		resp.addCookie(cookie);
		
		cookie = new Cookie("pwd", "aabbcc");
		resp.addCookie(cookie);
		
		
		
		
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<p>Hello Servlet</p>");
		pw.println("<a href= dispCookie> Cookie를 표시</a>");
		
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

	
	
	
	
}
