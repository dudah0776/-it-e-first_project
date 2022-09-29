// 김나형 생성
package com.dutyfree.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dutyfree.dto.CartVO;
import com.dutyfree.util.DBConnection;
import com.dutyfree.util.JDBCUtil;

import oracle.jdbc.OracleTypes;

public class CartDAO {
	Connection conn = DBConnection.getConnection();
	CallableStatement cstmt = null;
	String sql;
	int result = 0;
	ResultSet rs=null;

	
	private CartDAO() {
		
	}

	private static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
		return instance;
	}
	
	// 김나형 장바구니 리스트
	public ArrayList<CartVO> listCart(String memId){

		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		
		// sql문 선언
		String sql = "{call dutyfree_pkg.cartList(?,?)}";
		
		ResultSet rs = null;
	      try {
	    	  //DB와 연결
	         conn = DBConnection.getConnection();
	         
	         // SQL문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 cstmt에 넣음
	         cstmt = conn.prepareCall(sql);
	         
	         // ?에 대한 값들 넣기
	         cstmt.registerOutParameter(1, OracleTypes.CURSOR);
	         cstmt.setString(2, memId);

	         // 프로시저 실행
	         cstmt.executeUpdate();
	         
	         // out파라미터의 값을 돌려받는다.
	         rs = (ResultSet) cstmt.getObject(1); // cstmt 실행결과를 object로 받아 downcast
	         
			while(rs.next()) {
				// 레코드에 있는 내용을 입력
				CartVO cartVO = new CartVO();
				cartVO.setCartNo(rs.getInt("c_no"));
				cartVO.setMemId(rs.getString("m_id"));
				cartVO.setpNo(rs.getInt("p_no"));
				cartVO.setpName(rs.getString("p_name"));
				cartVO.setcDetailAmount(rs.getInt("c_amount"));
				cartVO.setpPrice(rs.getInt("p_price"));
				cartVO.setpDiscount(rs.getInt("p_discount"));
				cartVO.setpBrand(rs.getString("p_brand"));
				cartVO.setpImage(rs.getString("p_image"));
				cartVO.setPdc(rs.getInt("p_pdc"));
				cartVO.setPwon(rs.getInt("p_pwon"));
				// cartVO를 list에 추가
				cartList.add(cartVO);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn 및 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return cartList;
	}
	
	   // 김나형 장바구니에 상품 추가
	   public void insertCart(CartVO cartVO) {
		   // SQL문 선언
	      String sql = "{call dutyfree_pkg.insertCart(?, ?, ?)}";
	      
	      try {
	    	  // DB 연결
	         conn = DBConnection.getConnection();
	         
	         // SQL 문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 cstmt에 넣음
	         cstmt = conn.prepareCall(sql);
	         
	         // ?에 대한 값들 넣기
	         cstmt.setString(1, cartVO.getMemId());
	         cstmt.setInt(2, cartVO.getpNo());
	         cstmt.setInt(3, cartVO.getcDetailAmount());
	         
	         // 프로시저 실행
	         result = cstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
			// conn 및 cstmt 연결 끊기
	         JDBCUtil.close(conn);
	         JDBCUtil.close(cstmt);
	      }
	   }

	// 김나형 장바구니에서 상품 삭제
	public void deleteCart(int cartNo) {
		// SQL문 선언
		String sql = "{call dutyfree_pkg.deleteCart(?)}";
		try {
	    	// DB 연결
			conn = DBConnection.getConnection();
			
			// SQL 문을 미리 가져가서 유효한 쿼리인지 확인한 뒤 cstmt에 넣음
			cstmt = conn.prepareCall(sql);
			
			// ?에 대한 값들 넣기
			cstmt.setInt(1, cartNo);
			
			// 프로시저 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn 및 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
	}
}
