package com.dutyfree.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dutyfree.dao.CsDAO;
import com.dutyfree.dto.CsVO;
//구영모 작성
public class CsChartAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자 페이지에서 고객의 답변 여부를 나타내는 차트 페이지의 경로
		String url = "admin/cs/cschart.jsp";
		//결과 값을 받아오기 위한 int형 배열 선언 0번째 배열->답변 완료, 1번째 배열->답변 미완료
		int[] result = new int[2];
		//CsDao의 인스턴스 값을 받아온다.
		CsDAO csDAO = CsDAO.getInstance();
		//답변 완료와 답변 미완료에 대한 프로시저에서 받아온 값을 result 배열에 넣는다.
		result = csDAO.getreply();
		//chart라는 이름의 object값으로 넘겨준다.
		request.setAttribute("chart", result);
	    //각 조건에 맞는 브랜드 뷰 페이지의 경로로 해당 주소에 request값을 요청하고 response한다.
		request.getRequestDispatcher(url).forward(request, response);
	}
}