import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionDel")
public class SessionDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 세션 자체를 삭제함
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<h1>SessionDelete Servlet</h1>");
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		// 주로 로그아웃일 경우, 호출한다
		// 로그인 정보를 세션에 저장한 뒤 로그아웃시 세션을 삭제한다
		
		if(req.getSession(false) == null) {
			pw.println("<p>세션이 비어있음</p>");
			
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
