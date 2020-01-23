import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// gson 사용하기 
		List<CustUserDto> list = new ArrayList<>();
		int num = Integer.parseInt(req.getParameter("number"));
		list.add(new CustUserDto(num, req.getParameter("name")));
		list.add(new CustUserDto(2,"아구몬"));
		
		resp.setContentType("application/json");	// 보내는 데이터 형식을 json으로 변환
		resp.setCharacterEncoding("utf-8");			// 한글을 정상으로 출력
		
		String gson = new Gson().toJson(list);		// list를 json 형식으로 바꿔줌
		
		// 리턴해주는 함수
		resp.getWriter().write(gson);
		
	}

}
