import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//session으로 방문횟수 설정하기
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<h1>Hello Session Servlet</h1>");

		// session : HttpRequest 소속
		HttpSession session = req.getSession(false);	
		/*
			getSession(false)
			session Object가 존재하면, 현재 http 세션을 반환.
			존재하지 않으면 그냥 null을 반환

			getSession(true)
			session Object가 존재하면, 현재 http 세션을 반환.
			존재하지 않으면 새로생성한다
		
		*/
		// getSession(false) 일 경우, session=null일 때 null반환 
		if(session == null) {
			
			session = req.getSession(true);
			session.setMaxInactiveInterval(60);  // 365 * 24 * 60 * 6 (=1년)
			session.setAttribute("visited", "1");
			pw.println("<p>첫번째 방문 입니다.</p>");
		}
		else {
			// 이미 생성되있음
			String visited = (String)session.getAttribute("visited"); // Object 타입이므로 캐스트 변환
			int count = Integer.parseInt(visited);
			
			count++;
			
			
			pw.println("<p>방문횟수는  "+ count + "회 입니다.</p>");
			session.setAttribute("visited",count+"");
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
