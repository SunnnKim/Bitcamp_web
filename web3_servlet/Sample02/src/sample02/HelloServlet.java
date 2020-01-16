package sample02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// HttpServletRequest : jsp에서 request.getParameter( "name" )와 비슷, 서블릿은 HttpServletRequest 사용
		// HttpServletResponse : 응답을 위한 객체 
		
//		System.out.println("Hello Servlet goGet!");	// 확인용
		String name = req.getParameter("name");
		System.out.println("name: " + name);
		
		/*
		 	Servlet : java코드로 구성됨, java코드안에 html코드로 구성됨
		 	JSP : html코드 안에 java코드로 구성됨
		 	
		 	
		 	JSP : MVC model 1, model 2가 있음
		 	- servlet:model 2 에서만 사용함
		 	
		 	< MVC >
		 	model1 : 
		 	model2 : Servlet을 controller로 사용
		 	
		 */
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();	// html코드를 여기서 작성함
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		pw.println("<h1>Hello Servlet</h1>");
		pw.println("<p>Hello Servlet. This text is from Servlet</p>");
		
		pw.println("<p>"+ name +"</p>");
		
		
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		// Java 안에 html 코드 써서 화면에 뿌림
		
	}

	
	// post방식
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// HttpServletRequest : jsp에서 request.getParameter( "name" )와 비슷, 서블릿은 HttpServletRequest 사용
				// HttpServletResponse : 응답을 위한 객체 
				
//				System.out.println("Hello Servlet goGet!");	// 확인용
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
				
				pw.println("<p>"+ name +"</p>");
				
				
				
				pw.println("</body>");
				pw.println("</head>");
				pw.println("</html>");
				pw.close();
				
				// Java 안에 html 코드 써서 화면에 뿌림
				
	
	
	}

}
