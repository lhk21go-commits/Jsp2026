package model.board;

import java.sql.*;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

import DBPKG.*;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// board데이터 시작행~끝행의 개수를 리턴하는 메소드
	public ArrayList<BoardDTO> getAllboard(int StartRow, int pageSize) {
		
		ArrayList<BoardDTO> a = new ArrayList<BoardDTO>();
		
		try {
			con = Util.getConnection();
			//쿼리문
			String sql = "select * from board where chkDel=0 order by ref desc limit ?, ?";
			//쿼리실행
			pstmt = con.prepareStatement(sql);
			//물음표 대입
			pstmt.setInt(1, StartRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setReg_date(rs.getString(6));
				bdto.setRef(rs.getInt(7));
				bdto.setRe_step(rs.getInt(8));
				bdto.setReadcount(rs.getInt(9));
				bdto.setContent(rs.getString(10));
				bdto.setId(rs.getString(11));
				
				//데이터 추가
				a.add(bdto);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		
		}
		return a;
	}
	
	// board의 전체 개수를 리턴하는 메소드 작성
	// 메소드 이름 : getAllCount();
	public int getAllCount() {
		int count = 0;
		try {
			con = Util.getConnection();
			//쿼리문
			String sql = "select count(*) from board where chkDel=0";
			//쿼리실행
			pstmt = con.prepareStatement(sql);
			//물음표 대입
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		
		}
		return count;
	}	
	
	//-----------------------------------
	// 하나의 게시글을 삽입하는 메소드 작성
	// 메소드이름 : insertBoard()
	
	public void insertBoard(BoardDTO bdto) {
		// ref, re_step 초기값
		int ref = 0;
		int re_step=0;
		
		try {
			con = Util.getConnection();
			//쿼리문 ref의 최대값을 검색해서 +1을 하는 select문 필요
			String sql = "select max(ref) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1)+1;	//가장 큰값에 더하기 1한다.
			}
			//pstmt.close();
			
			//insert하는 쿼리문 작성
			String sql02 = "insert into board value(null,?,?,?,?,current_date(),?,?,0,?,?)";
			pstmt = con.prepareStatement(sql02);
			// ? 대입
			pstmt.setString(1,  bdto.getWriter());
			pstmt.setString(2,  bdto.getEmail());
			pstmt.setString(3,  bdto.getSubject());
			pstmt.setString(4,  bdto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setString(7,  bdto.getContent());
			pstmt.setString(8,  bdto.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		
		}	
		
	}
	//----------------------------------------
	// 2026년 11월 02일 
	// 답글 삽입하는 메소드 작성
	// 메소드 이름 : reinsertBoard(BoardDTO bdto)
	// BoardInfo.jsp에서 get방식으로 num, ref, re_step 넘김
	
	public void reinsertBoard(BoardDTO bdto) {
		// 원래 글의 ref값을 추출
		int ref = bdto.getRef();
		// 1:1문의 이므로 답변의 re_step은 무조건 1로 고정
		int re_step=1;
		System.out.println("ref -> DB:"+ref);
		System.out.println("re_step -> DB:"+re_step);
		
		try {
			con = Util.getConnection();
			// insert
			String sql = "insert into board values(null,?,?,?,?,current_date(),?,?,0,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,  bdto.getWriter());
			pstmt.setString(2,  bdto.getEmail());
			pstmt.setString(3,  bdto.getSubject());
			pstmt.setString(4,  bdto.getPassword());
			pstmt.setInt(5, ref);	//원래 글
			pstmt.setInt(6, re_step);	//답글 : 1
			pstmt.setString(7,  bdto.getContent());
			pstmt.setString(8,  bdto.getId());
			
			pstmt.executeUpdate();
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		
		}	
		
	}

	public void readcountUper(int num) {
		try {
			int befor_readcount = 0;

			con = Util.getConnection();

			String sql = "select readcount from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if(rs.next()) {
			befor_readcount = rs.getInt(1);
			}

			pstmt.close();
			rs.close();

			int new_readcount = befor_readcount+1;

			sql = "update board set readcount=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, new_readcount);
			pstmt.setInt(2, num);

			pstmt.executeUpdate();

			}catch(Exception e){
			e.printStackTrace();
			}finally {
			try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			}catch (Exception e) {
			e.printStackTrace();
			}
			}
	}

	public BoardDTO getBoardInfo(int num) {
		BoardDTO bdto = new BoardDTO();

		try {
		con = Util.getConnection();

		String sql = "select * from board where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);

		rs = pstmt.executeQuery();

		if(rs.next()) {
		bdto.setNum(rs.getInt("num"));
		bdto.setWriter(rs.getString("writer"));
		bdto.setEmail(rs.getString("email"));
		bdto.setSubject(rs.getString("subject"));
		bdto.setReg_date(rs.getString("reg_date"));
		bdto.setReadcount(rs.getInt("readcount"));
		bdto.setContent(rs.getString("content"));
		bdto.setRef(rs.getInt("ref"));
		bdto.setRe_step(rs.getInt("re_step"));
		}

		}catch(Exception e){
		e.printStackTrace();
		}finally {
		try {
		if(con != null) con.close();
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		}catch (Exception e) {
		e.printStackTrace();
		}
		}

		return bdto;
	}
	
	//--------------------------------------------------
	
	public BoardDTO getOneUpdateBoard(int num) {
		BoardDTO bdto = new BoardDTO();

		try {
		con = Util.getConnection();

		String sql = "select * from board where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);

		rs = pstmt.executeQuery();

		if(rs.next()) {
		bdto.setNum(rs.getInt("num"));
		bdto.setWriter(rs.getString("writer"));
		bdto.setEmail(rs.getString("email"));
		bdto.setSubject(rs.getString("subject"));
		bdto.setReg_date(rs.getString("reg_date"));
		bdto.setReadcount(rs.getInt("readcount"));
		bdto.setContent(rs.getString("content"));
		bdto.setRef(rs.getInt("ref"));
		bdto.setRe_step(rs.getInt("re_step"));
		}

		}catch(Exception e){
		e.printStackTrace();
		}finally {
		try {
		if(con != null) con.close();
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		}catch (Exception e) {
		e.printStackTrace();
		}
		}

		return bdto;
	}
	//-----------------------------------
	// 업데이트 쿼리
	// 메소드 이름 : updateBoard(int num, String subject, String content)
	public void updateBoard(int num, String subject, String content) {

		
		try {
			con = Util.getConnection();
				
			//하나의 게시글 업데이트하는 쿼리문 작성
			
			String sql = "update board set subject=?, content=?, where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			//쿼리 실행
			pstmt.executeUpdate();

			rs = pstmt.executeQuery();

	
			}catch(Exception e){
			e.printStackTrace();
			}finally {
			try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			}catch (Exception e) {
			e.printStackTrace();
			}
			}
	}
	//---------------------------
	// 소프트 삭제하난 메소드 작성
	// 삭제버튼 클릭시 chkDel을 1로 업데이트
	// chkDel이 1인 데이터는 화면에 출력하지 않는다.
	public void deleteBoard(int num) {
		try {
			con = Util.getConnection();
				
			//데이터를 지우지 않고 chkDel을 1로 업데이트
			String sql = "undate board chkDel=1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
	
			}catch(Exception e){
			e.printStackTrace();
			}finally {
			try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			}catch (Exception e) {
			e.printStackTrace();
			}
			}
		
	}
	
	
}