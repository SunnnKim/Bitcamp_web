import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dto.HumanDto;

@WebServlet("/man")
public class ManServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// reDirect로 들어왔기 때문에 이쪽으로 이동
		// 확인
//		System.out.println("ManServlet Redirect");
		
		// 화면에 뿌리기
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<h1>Man Servlet</h1>");
		
		
		// Session으로 받음
		HttpSession session = req.getSession();
		
		// 세션확인
//		String hobby0= (String)session.getAttribute("hobby0");
//		String hobby1= (String)session.getAttribute("hobby1");
//		System.out.println("hobby0:" +hobby0);
//		System.out.println("hobby1:" +hobby1);
		
		HumanDto dto  = (HumanDto)session.getAttribute("dto");
		String hobby[] = dto.getHobby();
		pw.println("<p> 이름 : "+ dto.getName()+"</p>");
		pw.println("<p> 나이 : "+ dto.getAge()+"</p>");
		pw.println("<p> 성별 : "+ dto.getGender()+"</p>");
		pw.print("<p> 취미: ");
		for (int i = 0; i < hobby.length-1; i++) {
			pw.print(hobby[i] + ", ");
		}
		pw.println(hobby[hobby.length-1]+"</p>");
		

		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
