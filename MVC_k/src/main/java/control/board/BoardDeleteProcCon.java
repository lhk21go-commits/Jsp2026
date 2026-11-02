package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;


@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			reqPro(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			reqPro(request, response);
		}

		protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			int num = Integer.parseInt(request.getParameter("num"));
			String dbPw = request.getParameter("dbPw");
			String userPw = request.getParameter("userPw");
			
			response.setContentType("text/html; charset=uft-8");
			PrintWriter out = response.getWriter();
			
			if(userPw.equals(dbPw) && userPw != null) {
				BoardDAO bdao = new BoardDAO();
				bdao.deleteBoard(num);
				response.sendRedirect("BoardListCon.do");
			}else {
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
				out.flush();
			}
		
		
		}

	}