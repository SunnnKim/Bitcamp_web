import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.HumanDto;

@WebServlet("/woman")
public class WomanServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post로 설정했기 때문에 여기로 들어옴
//		System.out.println("Woman Servlet");
		
		
		// 짐풀기 
		HumanDto dto = (HumanDto)req.getAttribute("dto");

		// 화면에 뿌리기
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		
		pw.println("<body>");
		pw.println("<h1>Woman Servlet</h1>");
		
		
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

}
