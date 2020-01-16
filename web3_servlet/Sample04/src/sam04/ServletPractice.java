package sam04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletPractice extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	public void createHTML(String methodType, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String addr = req.getParameter("addr");
		
		System.out.println(name);
		System.out.println(age);
		System.out.println(addr);
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("name : " );
		
		
	}
	
	
	
}
