package control.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardListCon.do")	//header.jsp의 게시판메뉴 클릭하면 목록이 출력되도록 작성
public class BoardListCon extends HttpServlet {
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		reqPro(request, response);
 	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// header.jsp로 넘어갈 때 페이징할 변수를 담아서 떠넘겨 주어야 함
		// 아래 부분은 페이징을 하기 위한 기본 변수와 연산식을 작성할 예정임
		// board테이블의 모든 레코드가 넘겨져야 함 => DAO 가 필요 => getAllboard() 메소드
		
		
		
		
	}
}
