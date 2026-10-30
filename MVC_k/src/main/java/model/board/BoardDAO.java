package model.board;

import java.sql.*;
import java.util.ArrayList;

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
			String sql = "select * from board order by ref desc limit ?, ?";
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
			String sql = "select count(*) from board";
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
	
	
	
	
	
}