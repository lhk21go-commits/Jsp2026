package control.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import model.board.BoardDAO;
import model.board.BoardDTO;


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
		// board테이블의 모든 레코드가 넘겨져야 함 => DAO 가 필요 => getAllboard(StartRow, pageSize) 메소드
		
		// 전체 게시글 리턴하여 담을 변수 선언
		int count = 0;
		// 한 화면에 보여질 행의 개수를 담을 변수 : 한 화면에 5개의 행만 보여짐
		int pageSize = 5;
		// 현재 보고 있는 페이지 넘버 : [1][2][3] ==> 현재 1페이지 있음
		// pageNum = 1;
		// 현재 pageNum = null이다.
		// 반드시 null처리한다.
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		// 게시글의 번호를 최신글 순으로 출력되도록 번호를 지정하기 위해
		// 각자의 기호에 맞게 개발한다.
		int number = 0;
		// 현재 보여지고 있는 페이지 문자를 숫자로 변환
		// 현재 currentPage = 1이 됨
		int currentPage = Integer.parseInt(pageNum);
		
		// 전체 게시글의 개수를 데이터 베이스에서 가져오기 위해 BoardDAO를 인스턴스한다.
		BoardDAO bdao = new BoardDAO();
		count = bdao.getAllCount();	//현재 count = 10;
		
		//startRow를 계산하여 시작하는 행번호를 [1][2][3]처럼 보고 있는 페이지의 
		//시작행을 출력할 수 있다.
		// limit 시작위치, 개수
		// currentPage = 1, 한 페이지의 출력할 개수는 pageSize = 5;
		// [1] => 첫 번째행은 0 마지막행은 4
		// [2] => 첫 번째행은 5 마지막행은 9
		// [3] => 첫 번째행은 10 마지막행은 14
		int startRow = (currentPage-1)*pageSize;
		
		//최신글 5개를 가져오는 DAO메소드를 이용해 리턴
		// ArrayList<BoardDTO> 
		ArrayList<BoardDTO> blist = bdao.getAllboard(startRow, pageSize);
		
		// jsp 화면에 [번호]부분에 들어갈 number 값 계산하기
		// 단, 최신글 순서대로 번호가 출력된다.
		// count = 10, currentPage = 1일 경우, 
		// 현재 보고있는 [1]페이지의 첫 번째 글 번호가 10, 마지막 글 번호가 6이어야 한다.
		/* number = count-(currentPage -1)*pageSize; */
		number = count - startRow;
		//----------------------------------------
		// 페이지 처리하는 계산로직
		int pageCount = 0;	//전체 페이지 넘버수를 담는 변수
		int pageBlock = 3;	// 한 화면에 페이징하고 싶은 개수
		int startPage = 1;	// 한 화면에 첫번째 페이징 넘버를 담는 변수
		int endPage = 0;	// 한 화면에 마지막 페이징 넘버를 담는 변수
		
		// pageBlock(3)만큼 묶음처리 로직 
		if(count > 0) {
			//			10	/	5 => 2 + 0
			pageCount = count/pageSize + (count%pageSize == 0 ? 0:1);
			
			if(currentPage % pageBlock != 0) {
				startPage = (currentPage / pageBlock)*pageBlock+1;
			}else {
				startPage = ((currentPage / pageBlock)-1)*pageBlock+1;
			}
		
		// pageBlock(3)만큼 묶음처리의 끝 페이지 번호를 구하는 로직  
		endPage = startPage + pageBlock - 1;
		}
	//-------------------------------
	// BoardList.jsp view단으로 Dispatcher 이용하여 떠넘기기
	request.setAttribute("blist", blist);
	
	// 페이징을 그릴 그림 변수 넘기기
	request.setAttribute("number", number);
	request.setAttribute("pageSize", pageSize);
	request.setAttribute("count", count);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("pageCount", pageCount);
	request.setAttribute("pageBlock", pageBlock);
	request.setAttribute("endPage", endPage);
	
	
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=board/BoardList.jsp");
	rd.forward(request, response);
	
	}
	
}
