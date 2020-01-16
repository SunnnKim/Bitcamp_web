package sample07;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		int age  = Integer.parseInt(req.getParameter("age"));
		String fruits[] = req.getParameterValues("fruits");
		
		
		//짐싸기
		// setAttribute ("이름",실제 짐이되는 데이터) 
		// : 데이터를 클래스로 묶어 이름을 정해 보낸다.
		ObjectDto dto = new ObjectDto(name, age, fruits);	//데이터 모으기
		req.setAttribute("Obj", dto);
		// dto 클래스는 직렬화(Serializable 인터페이스 상속) 해주기
		// 직렬화 ? 웹에서 처리하도록 데이터를 일렬로 세워놓는 작업 
		
		
		
		/////////// 보내주기
		// 1번
		// sendRedirect : 단순이동할 때 사용하는 함수 (데이터 넘기는것보다 단순하게 페이지 이동할 때)
		// 짐을 가져가지 않음 (가져갈 수 있으나 매우 귀찮음)
		// resp.sendRedirect("ResultServlet");
	
		// 2번
		// forward (전진)
		// 짐(데이터)을 들고 감
		// getRequestDispatcher("가려고하는 곳의 servlet name).forward(req, resp);
		req.getRequestDispatcher("ResultServlet").forward(req, resp);
		

		
	}

}
