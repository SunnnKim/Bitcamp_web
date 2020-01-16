package sample06;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("Hello Servlet doGet");
		
		
		// 이름 깨지는 것 해결하기
		req.setCharacterEncoding("utf-8");
		
		
		String name = req.getParameter("name");
		String sage = req.getParameter("age");
		int age =0;
		age = Integer.parseInt(sage);
		
//		if(sage==null || sage.trim().equals("")) {
//			resp.sendRedirect("index.html");
//			// 빈문자열 일 때 처리방법,
//			// 이렇게 하는 것보다는 html에서 값을 넘겨주기 전에 확인하는 작업을 거친다.
//		
//		}else {
//			age = Integer.parseInt(sage);
			
//		}

		
		String fruits[] = req.getParameterValues("fruits");
//		if(fruits == null || fruits.length <= 0 ) {	// null이거나 배열 길이가 0보다 같거나 작을때
//			resp.sendRedirect("index.html");	
//		}
		
		String fArr = "";	// 배열 데이터 전송을 위해 문자열에 모두 붙이기
		for (int i = 0; i < fruits.length; i++) {
			fArr = fArr + "&fruits="+ fruits[i];
			System.out.println();
		}
		
		
		// ResultServlet로 데이터 날려주기
		//
//		RequestDispatcher dispatch = req.getRequestDispatcher("ResultServlet");
//		dispatch.forward(req, resp);
		//또는
//		resp.sendRedirect("ResultServlet");
		// sendRedirect : 단순 이동시 사용
		resp.sendRedirect("ResultServlet?name="+URLEncoder.encode(name)+"&age="+age+ fArr );
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
