package control.member;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/Mypage.do")
public class Mypage extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//request.getSession(false) : 만약 세션이 존재하면 가져오고, 없으면 새로 만들지 않고 null로 리턴
		HttpSession session = request.getSession(false);
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		// 로그인된 아이디
		String loginId = (String)session.getAttribute("id");		

		// session != null => 로그인된 상태
		if(session != null) {
			mdto = mdao.getMemberDetail(loginId);
		}	

		//mdto가방에 담은 값들을 jsp view단으로 넘길 때는 setAttribute("작명",값)담는다.
			request.setAttribute("mdto", mdto);
		
		//떠넘기기	
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/Mypage.jsp");
		// select문을 제외한 나머지 쿼리문 작성시 F5로 새로고침 시 화면이 다시 재요청이 되는 현상이 존재한다.	
			rd.forward(request, response);
			
	}

}
