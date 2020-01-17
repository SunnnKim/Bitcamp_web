package sample08;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Member;


public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 깨짐 변경
		req.setCharacterEncoding("utf-8");
		
		
		// 이름/나이 데이터 : post방식
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		// 확인용
//		System.out.println("name: " + name);
//		System.out.println("age: " + age); 

/* 확인용
  	
  		// html코드를 여기서 작성함
 
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		
		pw.println("<p> 이름 : "+ name +"</p>");
		pw.println("<p> 나이 : "+ age+"</p>");
		
		
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
*/
		
		// 1. sendRedirect로 보내기 -> 무조건 get으로 보냄
		// 한글은 깨지기 때문에 한번더 인코딩 해주어야한다
//		String newName = URLEncoder.encode(name);
//		resp.sendRedirect("sample?name="+newName+"&age="+age);
		
		
		
		
		// 2. RequestDispatcher로 보내기
		
		// 짐싸기
		Member dto = new Member(name, age);	// 데이터 준비하기
		req.setAttribute("dto", dto);	// 보낼 짐 싸기
		// 따로 인코딩 할 필요 없음
		
		// 보내기
		RequestDispatcher dispatcher = req.getRequestDispatcher("sample");
		dispatcher.forward(req, resp);
		// 현재 이동방식에 맞추어 다음 서블릿으로 이동됨
		
	}

	
	
	
}
