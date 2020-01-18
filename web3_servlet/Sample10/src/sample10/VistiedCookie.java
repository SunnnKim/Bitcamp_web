package sample10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/visitedCookie")
public class VistiedCookie extends HttpServlet {

	// 방문횟수를 볼 수 있는 쿠키 출력하기 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<p>Visited Cookie</p>");
		
		Cookie cookies[] = req.getCookies();
		Cookie visitCookie = null; // 방문횟수 데이터를 담을 쿠키
		
		if(cookies != null ) {
			// 쿠키는 있음
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("visited")) {
					// 방문횟수 쿠키가 있음
					visitCookie = cookies[i];
					break;
				}
			}
			// visited 라는 이름의 쿠키가 있음
			if(visitCookie != null) {
				int count = Integer.parseInt( visitCookie.getValue()) +1 ;
				pw.println("<p>"+count+"번째 방문입니다</p>");
				
				// 쿠키값을 갱신해서 넣는다
				visitCookie.setValue(count+"");
				visitCookie.setMaxAge(60);	
				// 기한 설정(초단위): 365 * 24 * 60 * 60 = 1년
				resp.addCookie(visitCookie);
			}
			
			// visited 라는 이름의 쿠키가 없음
			else {
				// 방문쿠키 생성하기 
				pw.println("<p>첫 번째 방문입니다</p>");
				Cookie newcookie = new Cookie("visited","1");
				resp.addCookie(newcookie);
				
			}
			
			
			
		}else {
			// 쿠키가 하나도 없음
			// 방문쿠키 생성하기 
			pw.println("<p>첫 번째 방문입니다</p>");
			Cookie newcookie = new Cookie("visited","1");
			resp.addCookie(newcookie);
		}
		
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}

	
	
}
