//김민선 작성
package com.dutyfree.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dutyfree.dto.CartVO;
import com.dutyfree.dto.MemberVO;
import com.dutyfree.dto.OrderVO;
import com.dutyfree.util.DBConnection;
import com.dutyfree.util.JDBCUtil;

import oracle.jdbc.OracleTypes;

public class OrderDAO {
	// DB연결
	Connection conn = DBConnection.getConnection();
	CallableStatement cstmt = null;
	String sql;
	int result = 0;
	ResultSet rs = null;

	private OrderDAO() {
	}

	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
		return instance;
	}

	// 김민선
	// 카트에 있는 내역 주문으로 넘겨오기
	public void cartToOrder(String memId) {
		// procedure 불러오기
		String sql = "{call dutyfree_pkg.cartToOrder(?)}";

		try {
			// DB 연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			// SQL parameter에 넣는다
			cstmt.setString(1, memId);
			// 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(conn);
			JDBCUtil.close(cstmt);
		}
	}

	// 카트 객체 가져오기
	// 김민선
	// 김가희 수정
	public ArrayList<CartVO> getCart(String memId) {
		ArrayList<CartVO> cartList = new ArrayList<>();
		try {
			// DB연결
			conn = DBConnection.getConnection();
			// procedure 불러오기
			sql = "{call dutyfree_pkg.getCart(?,?) }";
			cstmt = conn.prepareCall(sql);
			// SQL parameter에 넣는다
			cstmt.setString(1, memId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			// 실행
			cstmt.executeUpdate();
			// out parameter를 받아오기
			rs = (ResultSet) cstmt.getObject(2);

			// VO에 입력
			while (rs.next()) {
				CartVO cart = new CartVO();
				cart.setCartNo(rs.getInt("cart_no"));
				cart.setcDetailAmount(rs.getInt("cart_amount"));
				cart.setMemId(rs.getString("member_mem_id"));
				cart.setpNo(rs.getInt("product_prod_no"));
				cartList.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return cartList;

	}

	// 오더 넘버 불러오기
	// 김민선
	// 김가희 수정
	public int getOrder(String memId) {
		int result = 0;
		try {
			// DB연결
			conn = DBConnection.getConnection();
			// procedure 불러오기
			sql = "{call dutyfree_pkg.getOrder(?,?) }";
			cstmt = conn.prepareCall(sql);
			// SQL parameter에 넣는다
			cstmt.setString(1, memId);
			cstmt.registerOutParameter(2, OracleTypes.NUMBER);
			// 실행
			cstmt.executeQuery();
			// 두번째 parameter의 값을 result에 넣는다
			result = cstmt.getInt(2);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return result;
	}

	// 오더 insert
	// 김민선
	// 김가희 수정
	public void orderInsert(CartVO cartVO, int orderNo) {
		// procedure 불러오기
		String sql = "{call dutyfree_pkg.orderDetailInsert(?,?,?)}";

		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			// SQL parameter에 넣는다
			cstmt.setInt(1, cartVO.getpNo());
			cstmt.setInt(2, cartVO.getcDetailAmount());
			cstmt.setInt(3, orderNo);
			// 실행
			result = cstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(conn);
			JDBCUtil.close(cstmt);
		}

	}

	// 김민선
	// 주문자 정보 가져오기
	public MemberVO getMember(String memId) {
		MemberVO member = null;
		try {
			// DB연결
			conn = DBConnection.getConnection();
			// procedure 불러오기
			sql = "{call dutyfree_pkg.getMember(?,?) }";
			cstmt = conn.prepareCall(sql);
			// SQL parameter에 넣는다
			cstmt.setString(1, memId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			// 실행
			cstmt.executeUpdate();
			rs = (ResultSet) cstmt.getObject(2);
			// VO에 입력
			if (rs.next()) {
				member = new MemberVO();
				member.setMemId(memId);
				member.setMemName(rs.getString("mem_name"));
				member.setMemBirth(rs.getDate("mem_birth"));
				member.setMemPassport(rs.getString("mem_passport"));
				member.setMemPhone(rs.getString("mem_phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return member;

	}

	// 사용자가 주문 내역 검색
	// 김민선 추가
	public ArrayList<OrderVO> listOrderById(String memId) {

		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		// procedure 불러오기
		String sql = "{call dutyfree_pkg.orderlist(?,?)}";
		ResultSet rs = null;
		try {
			// DB연결
			conn = DBConnection.getConnection();
			// SQL parameter에 넣는다
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setString(2, memId);

			// 프로시저 실행
			cstmt.executeUpdate();
			// out 파라미터의 값을 돌려받는다.
			rs = (ResultSet) cstmt.getObject(1);
			// VO에 입력
			while (rs.next()) {
				OrderVO vo = new OrderVO();
				vo.setoNo(rs.getInt("o_no"));
				vo.setodNo(rs.getInt("od_no"));
				vo.setpNo(rs.getInt("p_no"));
				vo.setpName(rs.getString("p_name"));
				vo.setOdAmount(rs.getInt("od_amount"));
				vo.setpPrice(rs.getInt("p_price"));
				vo.setpPricedc(rs.getInt("p_pdc"));
				vo.setpPricewon(rs.getInt("p_pwon"));
				vo.setpDiscount(rs.getInt("p_dc"));
				vo.setoShipping(rs.getString("o_shipping"));
				vo.setoDate(rs.getTimestamp("o_date"));
				vo.setmId(rs.getString("m_id"));
				vo.setpImage(rs.getString("p_image"));

				orderList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return orderList;
	}

	// 김가희 추가
	public ArrayList<OrderVO> detailOrderByOrderNo(int oNo) {
		System.out.println("DAO");
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		// procedure 불러오기
		String sql = "{call dutyfree_pkg.orderDetailList (?,?)}";
		ResultSet rs = null;
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.setInt(2, oNo);

			// 프로시저 실행
			cstmt.executeUpdate();
			// out 파라미터의 값을 돌려받는다.
			rs = (ResultSet) cstmt.getObject(1);
			// VO에 입력
			while (rs.next()) {
				OrderVO vo = new OrderVO();
				vo.setoNo(rs.getInt("o_no"));
				vo.setodNo(rs.getInt("od_no"));
				vo.setpNo(rs.getInt("p_no"));
				vo.setpName(rs.getString("p_name"));
				vo.setOdAmount(rs.getInt("od_amount"));
				vo.setpPrice(rs.getInt("p_price"));
				vo.setpPricedc(rs.getInt("p_pdc"));
				vo.setpPricewon(rs.getInt("p_pwon"));
				vo.setpDiscount(rs.getInt("p_dc"));
				vo.setoShipping(rs.getString("o_shipping"));
				vo.setoDate(rs.getTimestamp("o_date"));
				vo.setmId(rs.getString("m_id"));
				vo.setpImage(rs.getString("p_image"));
				vo.setpDetail(rs.getString("p_detail"));
				vo.setpBrand(rs.getString("p_brand"));
				orderList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
		return orderList;
	}

	// 김민선 추가
	// 주문 삭제
	public void deleteOrder(int oNo) {
		// procedure 불러오기
		String sql = "{call dutyfree_pkg.deleteOrder(?)}";
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, oNo);
			// 프로시저 실행
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// conn과 cstmt 연결 끊기
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
	}

	// 김가희 추가
	// 주문시 장바구니삭제
	public void deleteAllCart(String memId) {
		String sql = "{call dutyfree_pkg.deleteAllCart(?)}";
		try {
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, memId);
			cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);
		}
	}

	/*
	 * 관리자 메뉴에서 사용
	 */

	// 김가희 - 주문목록 출력
	public ArrayList<OrderVO> listOrder() {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.orderAllList(?)}";
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

			// order데이터 하나하나를 vo객체에 넣고, vo들을 orderList에 추가
			while (rs.next()) {
				OrderVO vo = new OrderVO();
				vo.setoNo(rs.getInt("o_no"));
				vo.setodNo(rs.getInt("od_no"));
				vo.setpNo(rs.getInt("p_no"));
				vo.setpName(rs.getString("p_name"));
				vo.setOdAmount(rs.getInt("od_amount"));
				vo.setpPrice(rs.getInt("p_price"));
				vo.setpDiscount(rs.getInt("p_dc"));
				vo.setoShipping(rs.getString("o_shipping"));
				vo.setoDate(rs.getTimestamp("o_date"));
				vo.setmId(rs.getString("m_id"));
				orderList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);

		}
		return orderList;
	}

	// 김가희 - 주문 배송처리
	public void ordersReady(String status, int oNo) {
		// 프로시저 호출문
		String sql = "{call dutyfree_pkg.ordersReady(?,?)}";
		try {
			// DB연결
			conn = DBConnection.getConnection();
			cstmt = conn.prepareCall(sql);

			// 프로시저에 인자넣기
			cstmt.setString(1, status);
			cstmt.setInt(2, oNo);

			// 프로시저 실행
			result = cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(cstmt);
			JDBCUtil.close(conn);

		}
	}
}