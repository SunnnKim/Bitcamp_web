package sample03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	// sample03
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 공개
		
		this.createHTML("get", req, resp);
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 비공개
		this.createHTML("post", req, resp);
		// 한글 전송하면 깨짐 (인코딩 방식 문제)
	}
	
	
	// get / post는 client에게 더 중요하고, 서버에서는 똑같이 코드를 만들어 보내면 되기 때문에 
	// html코드를 만드는 메소드를 만들어 사용하도록 한다.
	public void createHTML(String methodType, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String name = req.getParameter("name");
		System.out.println("name: " + name);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();	// html코드를 여기서 작성함
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		pw.println("<h1>Hello Servlet</h1>");
		pw.println("<p>Hello Servlet. This text is from Servlet</p>");
		pw.println("<p>methodType : "+ methodType+"</p>");
		
		pw.println("<p>"+ name +"</p>");
		
		
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
	}

}
