package sample07;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResultServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// System.out.println("ResultServlet doGet");
		
		// 들고온 짐 풀기
		ObjectDto dto = (ObjectDto)req.getAttribute("Obj");	// 기본 데이터 타입이 Object이므로 캐스트변환해야함
		
		// 들고온 짐의 데이터 확인
		String name = dto.getName();
		int age = dto.getAge();
		String[] fruits = dto.getFruits();
		
		
		// html 시각화
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		
		pw.println("<p>이름: "+ name +"</p>");
		pw.println("<p>나이: "+ age +"</p>");
		for (int i = 0; i < fruits.length; i++) {
			pw.println("<p>좋아하는 과일:"+ fruits[i] +"</p>");
		}
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();		
	
	}

}
