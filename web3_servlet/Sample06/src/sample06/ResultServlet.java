package sample06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResultServlet extends HttpServlet {

	
	//Get
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ResultServlet까지 도착");
		
		// 이름 깨지는 것 해결하기
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String fruits[] = req.getParameterValues("fruits");
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		
		pw.println("<p>이름: "+ name +"</p>");
		pw.println("<p>나이: "+ age +"</p>");
		for (int i = 0; i < fruits.length; i++) {
			pw.println("<p>좋아하는 과일: "+ fruits[i] +"</p>");
		}
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
	
	}


}
