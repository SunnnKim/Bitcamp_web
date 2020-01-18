package sample09;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/include")	// web.xml 등록하기
public class IncludeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body bgcolor = 'olive'>");
		
		
		pw.println("<h1>Include Servlet</h1>");
		
		
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
//		pw.close();	
		// include할때는 close하면 안됨, 
		//불어오는 부분의 뒷부분이 적용이 안되기 때문에  
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	
}
