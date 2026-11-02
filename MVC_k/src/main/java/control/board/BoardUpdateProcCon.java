package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;

@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 실제 수정되는 처리부분
		int num = Integer.parseInt("num");
		String userpw = request.getParameter("userpw");
		// board DB 비밀번호
		String dbPw = request.getParameter("dbPw");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
	
		response.setContentType("text/html; charset=uft-8");
		PrintWriter out = response.getWriter();
		
		if(userpw.equals(dbPw)) {
			// db의 비밀번호와 내가 입력한 비밀번호가 같으면 수정
			BoardDAO bdao = new BoardDAO();
			bdao.updateBoard(num, subject, content);
			// 반드시 sendRedirect()로 넘기기
			response.sendRedirect("BoardListCon.do");
		}else {
			// 비밀번호가 일치하지 않으면 메시지창 띄우고 이전페이지로 이동
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();//
		}
		
	}

}
