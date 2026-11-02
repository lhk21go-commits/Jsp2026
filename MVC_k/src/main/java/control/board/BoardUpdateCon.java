package control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardDTO;


@WebServlet("/BoardUpdateCon.do")
public class BoardUpdateCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = new BoardDTO();
		
		request.setAttribute("bdto", bdto);
		
		//수정폼 화면으로 이동 BoardUpdateForm.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=board/BoardUpdateForm.jsp");
		rd.forward(request, response);
	}

}
