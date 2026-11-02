package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.connector.Request;


@WebServlet("/BoardReWriterCon.do")
public class BoardReWriterCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//로그인된 아이디가 admin인지 확인이 필요
		//세션에서 id가져와야 하는 이유는 board DB에서 id필드명에 삽입해야 하므로
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		//삭제가능한 코드
		if(id == null || !id.equals("admin")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자만 답글을 작성할 수 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return;
		}
		//BoardInfo 넘겨준 데이터저장
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		
		//BoardReWriteForm.jsp로 넘겨주어야 한다.
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("num", num);
		
		// Request.Dispatcher로 View단으로 넘긴다.
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=board/BoardReWriteForm.jsp");
		
		
	}

}
