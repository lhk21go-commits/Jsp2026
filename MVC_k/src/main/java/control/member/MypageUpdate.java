package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MypageUpdate.do")
public class MypageUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		HttpSession session = request.getSession();
		
		// Mypage.jsp에서 input hidden의 value 받음
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String passchk = request.getParameter("passchk");
		String dbPass = mdao.getPass(id);
		
		// 비밀번호와 비밀번호체크가 다르면 수저을 하지 않고 오류메시지 띄울예졍
		//Mypage.do 서블릿에 result = passfail 지정
		if(!pass.equals(passchk)) {
			response.sendRedirect("MyPage.do?result=passfail");
		}
		
		String [] arr = request.getParameterValues("hobby");
		String oneHobby = "";
		
		if(arr != null) {
			for(String hob : arr) {
				oneHobby += hob + " ";
				break;
			}
		}
		
		// 나머지는 MemberDTO 가방에 담는다.
		mdto.setId(id);
		mdto.setPass(pass);
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setHobby(oneHobby);
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));
		
		//DAO update 실행
		mdao.updateMember(mdto);
		
		response.sendRedirect("Mypage.do?result=ok");
	}	
	
}
		
		
		