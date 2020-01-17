import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginId")
public class LoginidServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<p>Login Id Servlet</p>");
		
		HttpSession session = null;
		
		if(session == null) {
			// 아예 session이 없음
			pw.println("<p>session을 등록합니다.</p>");
			session = req.getSession(true);
			session.setAttribute("name", "홍길동");
			session.setAttribute("age", "25");
								// key : value
		}
		pw.println("<p>등록되어있는 session을 표시합니다.</p>");

//		String name = (String)session.getAttribute("name");
//		pw.println("<p>name : " +name+ "</p>");
//		String age = (String)session.getAttribute("age");
//		pw.println("<p>age : " +age+ "</p>");
		
		
		// 세션의 정보를 한번에 볼 수 있는 것 : Enumeration
		Enumeration<String> enum_session = session.getAttributeNames();
		
		while(enum_session.hasMoreElements()) {	// iterator의 hasNext와 비슷한 기능
			String key = enum_session.nextElement();
			String value = (String)session.getAttribute(key);
			pw.println("<p>"+key+" : " +value+ "</p>");
		}
		
		
		pw.println("<a href=delObject>age 삭제하기</a><br>");
		pw.println("<a href=sessionDel>세션 삭제</a>");

		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
	
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
