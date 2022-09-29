// 22/09/08 김가희 생성
package com.dutyfree.controller;

import com.dutyfree.admin.controller.action.*;
import com.dutyfree.controller.action.*;

public class ActionFactory {
	
	//ActionFactory 객체를 선언
	private static ActionFactory instance = new ActionFactory();

	public ActionFactory() {
		super();
	}
	
	//ActionFactory의 객체를 가져오는 메서드 
	public static ActionFactory getInstance() {
		return instance;
	}
	
	//Action 객체를 가져오는 메서드
	public Action getAction(String command) {
		Action action = null;

		System.out.println("ActionFactory : " + command);

		//김가희
		//고객센터를 접속했을 떄 실행
		if (command.equals("cs_list")) {
			action = new CsListAction();
		} 
		//고객센터-문의내역(나의문의내역)
		else if (command.equals("cs_Mylist")) {
			action = new CsMyListAction();
		}
		//고객센터 게시글 작성 버튼눌렀을때 작성화면으로 이동
		else if (command.equals("cs_write_form")) {
			action = new CsWriteFormAction();
		} 
		//고객센터 게시글 작성화면에서 작성버튼 눌렀을 때
		else if (command.equals("cs_write")) {
			action = new CsWriteAction();
		}
		//고객센터 게시글 상세보기
		else if (command.equals("cs_view")) {
			action = new CsViewAction();
		}
		//고객센터 게시글 삭제
		else if (command.equals("cs_delete")) {
			action = new CsDeleteAction();
		}

		//김가희
		//관리자-상품목록
		if (command.equals("admin_product_list")) {
			action = new AdminProductListAction();
		}
		//관리자-회원목록
		else if (command.equals("admin_member_list")) {
			action = new AdminMemberListAction();
		}
		//관리자-주문목록
		else if (command.equals("admin_order_list")) {
			action = new AdminOrderListAction();
		}
		//관리자-Q&A목록
		else if (command.equals("admin_cs_list")) {
			action = new AdminCsListAction();
		}
		//관리자-고객센터 게시글 상세보기
		else if (command.equals("admin_cs_view")) {
			action = new AdminCsViewAction();
		}
		//관리자-고객센터 게시글 답변달기
		else if (command.equals("admin_cs_reply")) {
			action = new AdminCsReply();
		}
		//관리자-주문 배송처리
		else if (command.equals("admin_order_ready")) {
			action = new AdminOrderReady();
		}
		//관리자-상품수정
		else if (command.equals("admin_prod_update")) {
			action = new AdminProdUpdate();
		}//관리자-에러페이지
		else if (command.equals("admin_error")) {
			action = new AdminErrorAction();
		}

		// 김민선
		// order
		// 주문 목록페이지로 이동
		if (command.equals("order_detail")) {
			action = new OrderDetailAction();
		}
		// 주문 상세페이지로 이동
		else if (command.equals("order_specificdetail")) {
			action = new OrderSpecificDetailAction();
		}
		// 주문 취소
		else if (command.equals("order_cancle")) {
			action = new OrderCancleAction();
		}
		// cart에서 주문으로 이동 + orders table 생성
		else if (command.equals("cart_to_order")) {
			action = new CartToOrderAction();
		}
		// orders_detail table 생성
		else if (command.equals("order_insert")) {
			action = new OrderInsertAction();
		}

		// 박진수
		// 로그인을 수행할 때 실행
		if (command.equals("login")) {
			action = new LoginMemberAction();
			// 로그인 페이지로 이동할 때 실행
		} else if (command.equals("login_form")) {
			action = new LoginFormAction();
			// 로그아웃을 수행할 때 실행
		} else if (command.equals("Logout")) {
			action = new LogoutAction();
			// 아이디 찾기 페이지로 갈 때 실행
		} else if (command.equals("FindId_Page")) {
			action = new FindId_page();
			// 아이디 찾기를 수행
		} else if (command.equals("FindId")) {
			action = new FindIdAction();
		}
		// 비밀번호 찾기 페이지로 이동
		else if (command.equals("FindPw_Page")) {
			action = new FindPw_pageAction();
			// 비밀번호 찾기를 수행
		} else if (command.equals("FindPw")) {
			action = new FindPwAction();
		}
		// 마이 페이지로 이동할 때 실행
		else if (command.equals("Update_page")) {
			action = new Update_pageAction();
		}
		// 마이 페이지에서 휴대폰 번호 및 여권 번호를 수정할 때 실행
		else if (command.equals("Update")) {
			action = new UpdateAction();
		}
		// 마이페이지에서 회원탈퇴를 수행할 때 실행
		else if (command.equals("Delete")) {
			action = new DeleteAction();
		}
		// 마이페이지에서 비밀번호 변경을 수행했을 때 실행
		else if (command.equals("ChangePw")) {
			action = new ChangePwAction();
		}
		// 로그인하지 않은 사용자가 회원만 사용할 수 있는 서비스를 사용할 때 에러 페이지로 이동한다.
		else if (command.equals("Error")) {
			action = new Error_pageAction();
		}

		// 김나형
		// 회원가입 중 약관동의를 수행했을 때 실행
		if (command.equals("contract")) {
			action = new ContractAction();
		}
		// 회원가입 중 정보를 입력할 때 실행
		else if (command.equals("join_form")) {
			action = new JoinFormAction();
		}
		// 회원가입 정보 입력 후 실행
		else if (command.equals("join")) {
			action = new JoinAction();
		}
		// id 중복 체크할 때 실행
		else if (command.equals("id_check_form")) {
			action = new IdCheckFormAction();
		}
		// 장바구니에 상품을 추가할 때 실행
		else if (command.equals("cart_insert")) {
			action = new CartInsertAction();
		}
		// 장바구니 리스트 불러올 때 실행
		else if (command.equals("cart_list")) {
			action = new CartListAction();
		}
		// 장바구니에서 상품을 삭제할 때 실행
		else if (command.equals("cart_delete")) {
			action = new CartDeleteAction();
		}

		else if (command.equals("index")) {
			action = new IndexAction();
		}
	    //구영모
	    //상품 페이지로 이동해 주는 메소드
	    //서블릿으로 받아온 값이 product_detail이면
		if (command.equals("product_detail")) {
			action = new ProductDetailAction();
		}
		//상품 브랜드페이지로 이동해 주는 메소드
		//서블릿으로 받아온 값이 product_brand이면
		else if (command.equals("product_brand")) {
			action = new BrandAction();
		}
		//관리자 계정 페이지의 차트를 나타내는 메소드
		//서블릿으로 받아온 값이 cs_chart이면
	    else if(command.equals("admin_cs_chart")) {
	    	//ProductDetailAction 클래스 파일의 내용의 인자를 action에 넣는다.
	    	action = new CsChartAction();
	     }
		//action의 값을 리턴해준다
		return action;
	}

}
