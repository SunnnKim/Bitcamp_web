package sam04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String code = req.getParameter("code");
		System.out.println(code);
		
		String name = req.getParameter("name");
		System.out.println("name: " + name);
		
		String tax = this.getInitParameter("tax");
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();	// html코드를 여기서 작성함
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		pw.println("<h1>Hello Servlet</h1>");
		pw.println("<p>Hello Servlet. This text is from Servlet</p>");
		
		if(code.equals("200")) {
			pw.println("<p>200:SC_OK</p>");
		}else{
			if(code.equals("404")) {
				resp.sendError(HttpServletResponse.SC_NOT_FOUND, "못 찾겠다는 에러");			
			}
			else if(code.equals("500")) {
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "코드가 틀렸다는 에러");			
			}
			
		}
		
		
		pw.println("<p> init-value인 tax : " + tax + "</p>");
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
		// Java 안에 html 코드 써서 화면에 뿌림
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}
