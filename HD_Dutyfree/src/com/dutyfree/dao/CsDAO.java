//김가희
//Q&A게시판(DB cs테이블) 처리관련 DAO
package com.dutyfree.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dutyfree.dto.CsVO;
import com.dutyfree.util.DBConnection;
import com.dutyfree.util.JDBCUtil;

import oracle.jdbc.OracleTypes;

public class CsDAO {
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;

	public CsDAO() {
	}

	private static CsDAO instance = new CsDAO();

	// 싱글톤패턴 적용
	public static CsDAO getInstance() {
		return instance;
	}

	// 김가희 - Q&A전체리스트 불러오기
	public ArrayList<CsVO> listCs() {
		ArrayList<CsVO> csList = new ArrayList<>();
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.selectAllCs(?)}";
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

			// Q&A데이터 하나하나를 vo객체에 넣고, vo들을 csList에 추가
			while (rs.next()) {
				CsVO vo = new CsVO();
				vo.setCsNo(rs.getInt("cs_no"));
				vo.setCsTitle(rs.getString("cs_title"));
				vo.setCsDate(rs.getTimestamp("cs_date"));
				vo.setCsCheck(rs.getString("cs_check"));
				vo.setMemId(rs.getString("member_mem_id"));
				csList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);

		}
		return csList;
	}

	// 김가희 - 내가쓴글 리스트 불러오기
	public ArrayList<CsVO> listMyCs(String memId) {
		ArrayList<CsVO> csMyList = new ArrayList<>();
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.selectMyCs(?,?)}";

		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);

			// 프로시저에 인자넣기
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setString(2, memId);

			// 프로시저 실행
			cstmt.executeUpdate();

			// out파라미터의 값을 돌려받는다.
			rs = (ResultSet) cstmt.getObject(1);

			// Q&A데이터 하나하나를 vo객체에 넣고, vo들을 csMyList에 추가
			while (rs.next()) {
				CsVO vo = new CsVO();
				vo.setCsNo(rs.getInt("cs_no"));
				vo.setCsTitle(rs.getString("cs_title"));
				vo.setCsDate(rs.getTimestamp("cs_date"));
				vo.setCsCheck(rs.getString("cs_check"));
				vo.setMemId(rs.getString("member_mem_id"));
				csMyList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);

		}
		return csMyList;
	}

	// 김가희 - 게시글내용 조회
	public CsVO getCs(int cs_no) {
		CsVO vo = null;
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.selectCs(?,?)}";

		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);

			// 프로시저에 인자넣기
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setInt(2, cs_no);

			// 프로시저 실행
			cstmt.executeQuery();

			// out파라미터의 값을 rs에 저장한다.
			rs = (ResultSet) cstmt.getObject(1);

			// rs에 값이 존재하면 vo에 내용저장
			if (rs.next()) {
				vo = new CsVO();
				vo.setCsNo(rs.getInt("cs_no"));
				vo.setCsContent(rs.getString("cs_content"));
				vo.setCsTitle(rs.getString("cs_title"));
				vo.setCsDate(rs.getTimestamp("cs_date"));
				vo.setCsReply(rs.getString("cs_reply"));
				vo.setCsCheck(rs.getString("cs_check"));
				vo.setMemId(rs.getString("member_mem_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);

		}
		return vo;
	}

	// 김가희 - 게시글 insert
	public void insertCs(CsVO vo) {
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.insertCs(?,?,?)}";

		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			
			// 프로시저에 인자넣기
			cstmt.setString(1, vo.getCsTitle());
			cstmt.setString(2, vo.getCsContent());
			cstmt.setString(3, vo.getMemId());
			
			// 프로시저 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
	}

	// 김가희 - 답변달기
	public void insertCsReply(int csNo, String reply) {
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.insertCsReply(?,?)}";
		
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			
			// 프로시저에 인자넣기
			cstmt.setString(1, reply);
			cstmt.setInt(2, csNo);
			
			// 프로시저 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
	}

	// 김가희 - 게시글삭제
	public void deleteCs(int csNo) {
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.deleteCs(?)}";

		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			
			// 프로시저에 인자넣기
			cstmt.setInt(1, csNo);
			
			// 프로시저 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}

	}
	
	   //구영모
	   //차트에서 답변완료와 답변 미완료를 불러오기 위해 만든 함수
	   public int[] getreply() {
	         String sql = "{call dutyfree_pkg.getreply(?)}";
	         ResultSet rs = null;
	         //답변완료 , 답변 미완료 배열 0-> 답변완료수, 1->답변 미완료 수
	         int result[]=new int[2];
	         try {
	            //DB연결
	            conn = DBConnection.getConnection();
	            cstmt = conn.prepareCall(sql);
	            //커서값 받아오기
	            cstmt.registerOutParameter(1, OracleTypes.CURSOR);
	            //프로시저 실행
	            cstmt.executeUpdate();
	            // out파라미터 값을 rs 변수에 object 타입으로 돌려받는다 
	            rs = (ResultSet) cstmt.getObject(1);
	            if(rs.next()) {            
	                result[0] = rs.getInt(1);
	                result[1] = rs.getInt(2);
	             }
	         //연결에 예외가 생기면 그 내용을 출력한다
	         }catch(Exception e) {
	            e.printStackTrace();
	         }finally {
	              //자원 누수를 막기 위한 connection 해제
	             JDBCUtil.close(conn);
	             //자원 누수를 막기 위한 CallableStatement 해제
	             JDBCUtil.close(cstmt);
	          }
	         return result;
	   }
}
