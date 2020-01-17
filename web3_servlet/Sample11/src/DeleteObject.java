import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delObject")
public class DeleteObject extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 세션 정보를 삭제함
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<h1> DeleteObject Servlet</h1>");
		
		HttpSession session = req.getSession();
		session.removeAttribute("age");
		pw.println("<p>age 세션 정보는 삭제함</p>");
		pw.println("<p>현재 등록되어있는 세션표시</p>");
		
		
		// 세션의 정보를 한번에 볼 수 있는 것 : Enumeration
		Enumeration<String> enum_session = session.getAttributeNames();
		while(enum_session.hasMoreElements()) {	// iterator의 hasNext와 비슷한 기능
			String key = enum_session.nextElement();
			String value = (String)session.getAttribute(key);
			pw.println("<p>"+key+" : " +value+ "</p>");
		}
		
		
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
