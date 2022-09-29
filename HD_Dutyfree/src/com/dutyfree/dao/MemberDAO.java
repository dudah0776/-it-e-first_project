package com.dutyfree.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.dutyfree.dto.MemberVO;
import com.dutyfree.util.DBConnection;
import com.dutyfree.util.JDBCUtil;

import oracle.jdbc.OracleTypes;

public class MemberDAO {
	Connection conn = DBConnection.getConnection();
	CallableStatement cstmt = null;
	String sql;
	int result = 0;
	ResultSet rs = null;

	private MemberDAO() {

	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	// 김나형 추가
	// 회원가입 정보
	public int insertMember(MemberVO member) {
		// sql문 선언
		String sql = "{call dutyfree_pkg.JoinMember(?, ?, ?, ?, ?, ?, ?)}";
		try {
			// DB와 연결
			conn = DBConnection.getConnection();

			// SQL문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 cstmt에 넣음
			cstmt = conn.prepareCall(sql);

			// ?에 대한 값들 넣기
			cstmt.setString(1, member.getMemId());
			cstmt.setString(2, member.getMemPw());
			cstmt.setString(3, member.getMemName());
			cstmt.setString(4, member.getMemGender());
			cstmt.setDate(5, member.getMemBirth());
			cstmt.setString(6, member.getMemPassport());
			cstmt.setString(7, member.getMemPhone());

			// 프로시저 실행
			result = cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn 및 cstmt 연결 끊기
			JDBCUtil.close(conn);
			JDBCUtil.close(cstmt);
		}

		return result;
	}

	// 김나형 추가
	// 아이디 중복체크
	public int confirmID(String memid) {
		// 아이디 중복을 체크하는 변수 선언
		int result = -1;

		// sql문 선언
		String sql = "{call dutyfree_pkg.idCheck(?,?)}";
		try {
			// DB와 연결
			conn = DBConnection.getConnection();

			// SQL문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 cstmt에 넣음
			cstmt = conn.prepareCall(sql);

			// ?에 대한 값들 넣기
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setString(2, memid);

			// 프로시저 실행
			cstmt.executeUpdate();

			// out파라미터의 값을 돌려받는다.
			rs = (ResultSet) cstmt.getObject(1); // cstmt 실행결과를 object로 받아 downcast

			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn 및 cstmt 연결 끊기
			JDBCUtil.close(conn);
			JDBCUtil.close(cstmt);
		}
		return result;
	}

	//박진수 회원 수정
	public int updateMember(String memId, String memPassport, String memPhone) {
		try {
			//DB와 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문 선언한다.
			sql = "{call dutyfree_pkg.updateMember(?,?,?)}";
			
			//SQL문을 미리 가져와서 유효한 쿼리인지 확인한 뒤 pstmt에 넣음
			cstmt = conn.prepareCall(sql);
			
			//?에 대한 값들을 넣는다.
			cstmt.setString(1, memId);
			cstmt.setString(2, memPassport);
			cstmt.setString(3, memPhone);
			
			//SQL문을 실행시킨다.
			result = cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			//conn 및 cstmt 연결 끊는다.
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return result;
	}

	//박진수 회원 삭제
	public int deleteMember(String memId) {
		try {
			//DB 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문 선언한다.
			sql = "{call dutyfree_pkg.deleteMember(?)}";
			
			//SQL문을 미리 가져와서 유효한 쿼리인지 확인한 뒤 pstmt에 넣음
			cstmt = conn.prepareCall(sql);
			
			//? 에 값을 넣는다.
			cstmt.setString(1, memId);
			
			//SQL문을 실행시킨다.
			result = cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			//conn 및 cstmt 연결을 끊는다.
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return result;
	}

	//박진수 회원 정보 불러오기
	public MemberVO getMember(String memId) {
		MemberVO member = null;
		try {
			//DB 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문 선언한다.
			sql = "{call dutyfree_pkg.getMember(?,?) }";
			
			//SQL문을 미리 가져와서 유효한 쿼리인지 확인한 뒤 pstmt에 넣음
			cstmt = conn.prepareCall(sql);
			
			//?에 대한 값들을 넣는다.
			cstmt.setString(1, memId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			//SQL문을 실행시킨다.
			cstmt.executeUpdate();
			
			//2번 컬럼에 결과 값을 rs에 가져온다.
			rs = (ResultSet) cstmt.getObject(2);
			
			//가져온 rs에 행이 있다면 memberVO로 가지고 온다.
			if (rs.next()) {
				member = new MemberVO();
				member.setMemId(memId);
				member.setMemPw(rs.getString("mem_pw"));
				member.setMemName(rs.getString("mem_name"));
				member.setMemBirth(rs.getDate("mem_birth"));
				member.setMemPassport(rs.getString("mem_passport"));
				member.setMemPhone(rs.getString("mem_phone"));
				member.setMemGender(rs.getString("mem_gender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			//conn 및 cstmt의 연결을 끊는다.
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return member;

	}

	//박진수 로그인 수행
	public String LoginMember(String memId, String memPw) {
		String result = "";
		try {
			
			//DB 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문 선언한다.
			sql = "{? = call dutyfree_pkg.LoginMember(?,?)}";
			
			//SQL문을 미리 가져와서 유효한 쿼리인지 확인한 뒤 pstmt에 넣음
			cstmt = conn.prepareCall(sql);
			
			//?에 대해 값들을 넣는다.
			cstmt.registerOutParameter(1, OracleTypes.VARCHAR);
			cstmt.setString(2, memId);
			cstmt.setString(3, memPw);
			
			//SQL문을 실행시킨다.
			cstmt.executeUpdate();
			
			//1번 컬럼의 값을 result로 가지고 온다.
			result = cstmt.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//conn 및 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return result;
	}

	//박진수 회원 비밀번호 찾기
	public String FindPw(String memId, String memPhone) {
		String result = "";
		try {
			//DB와 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문을 선언한다.
			sql = "{?=call dutyfree_pkg.FindPw(?,?)}";
			
			//SQL문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 pstmt에 넣는다.
			cstmt = conn.prepareCall(sql);
			
			//?에 대해 값들을 넣는다.
			cstmt.registerOutParameter(1, OracleTypes.VARCHAR);
			cstmt.setString(2, memId);
			cstmt.setString(3, memPhone);
			
			//SQL을 실행시킨다.
			cstmt.executeUpdate();
			
			//1번 컬럼에 대한 결과값을 result에 넣는다.
			result = cstmt.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			//conn 및 cstmt 연결을 끊는다.
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}

		return result;
	}

	//박진수 회원의 id를 찾는다.
	public String FindId(String memName, String memPhone) {
		String result = "";
		try {
			
			//DB와 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문을 선언한다.
			sql = "{?=call dutyfree_pkg.FindId(?,?)}";
			
			//SQL문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 pstmt에 넣는다.
			cstmt = conn.prepareCall(sql);
			
			//?에 대해 값들을 넣는다.
			cstmt.registerOutParameter(1, OracleTypes.VARCHAR);
			cstmt.setString(2, memName);
			cstmt.setString(3, memPhone);
			
			//SQL을 실행시킨다.
			cstmt.executeUpdate();
			
			//1번 컬럼에 대한 결과값을 result에 넣는다.
			result = cstmt.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//conn 및 cstmt 연결을 끊는다.
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
	
		return result;
	}

	// 박진수 회원 비밀번호 변경 추가
	public String ChangePw(String memId, String oldPw, String newPw) {
		String result = "";
		try {
			//DB와 연결한다.
			conn = DBConnection.getConnection();
			
			//SQL문을 선언한다.
			sql = "{call dutyfree_pkg.changePw(?,?,?,?)}";
			
			//SQL문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 pstmt에 넣는다.
			cstmt = conn.prepareCall(sql);
			
			//?에 대해 값들을 넣는다.
			cstmt.setString(1, memId);
			cstmt.setString(2, oldPw);
			cstmt.setString(3, newPw);
			cstmt.registerOutParameter(4, OracleTypes.VARCHAR);
			
			//SQL을 실행시킨다.
			cstmt.executeUpdate();
			
			//4번 컬럼에 대한 결과값을 result에 넣는다.
			result = cstmt.getString(4);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//conn 및 cstmt 연결을 끊는다.
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return result;
	}

	/*
	 * 관리자 메뉴에서 사용
	 */
	// 김가희 - member 전체목록 조회(관리자용)
	public ArrayList<MemberVO> listMember() {
		ArrayList<MemberVO> memList = new ArrayList<>();
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.selectAllMember(?)}";
		ResultSet rs = null;
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);

			// 프로시저에 인자넣기
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);

			// 프로시저 실행
			cstmt.executeUpdate();

			// out파라미터의 값을 돌려받는다.
			rs = (ResultSet) cstmt.getObject(1);

			// 회원데이터 하나하나를 vo객체를 넣고, vo들을 memList에 추가
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemId(rs.getString("mem_id"));
				vo.setMemName(rs.getString("mem_name"));
				vo.setMemGender(rs.getString("mem_gender"));
				vo.setMemBirth(rs.getDate("mem_birth"));
				vo.setMemRegDate(rs.getTimestamp("mem_regdate"));
				vo.setMemPhone(rs.getString("mem_phone"));
				vo.setMemPassport(rs.getString("mem_passport"));
				memList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}

		return memList;
	}

}
