package model.member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.Util;

public class MemberDAO {
	// 멤버변수
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// -------- 아래부분은 sql문 작성 메소드들의 모임이다.
	//id만 추출하는 메소드를 작성한다.
	//메소드이름 : getId()
	
	public String getId(String id) {
		String chkid = "";
		
		try {
			//DB연결
			con = Util.getConnection();
			//sql문 작성
			String sql = "select id from member where id=?";
			//실행객체
			pstmt = con.prepareStatement(sql);
			// ?에 대입
			pstmt.setString(1, id);
			// 쿼리실행
			rs = pstmt.executeQuery();
			// 현재 커서는 앞에 존재하므로 next() 사용
			if(rs.next()) {
				chkid = rs.getString(1);
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
		return chkid;
		
	}
	
	//---------------------------------------
	// 한 명의 데이터만 DB에 저장하는 메소드 작성
	public void insertMember(MemberDTO mdto) {
		
		try {
			con = Util.getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPass());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getTel());
			pstmt.setString(5, mdto.getHobby());
			pstmt.setString(6, mdto.getJob());
			pstmt.setString(7, mdto.getAge());
			pstmt.setString(8, mdto.getInfo());
			
			//SQL실행
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
	
	//-------------------------------------------------
	// 회원의 전체 정보를 추출하는 메소드 작성
	public ArrayList<MemberDTO> getAllMember(){
		
		//리턴 타입문을 선언
		ArrayList<MemberDTO> m = new ArrayList<MemberDTO>();
		
		try {
			con = Util.getConnection();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				
				m.add(mdto);
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
		return m;
		
	}
	
}
