<!-- 김가희 -->
<!-- 주문목록을 보여주는 페이지(관리자용) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>

<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<!-- 주문의 배송상태에 따라 다른 동작을 하는 function -->
	<script type="text/javascript">
		function order(status,orderNo) {
			/* status가 1이면 주문접수 상태 -> 이때 클릭하면 배송을 인도중 상태로 변경시키는 action으로 이동  */
			if(status=='1'){
				if (confirm("상품이 출고되었습니까?")) {
					location.href= 'DutyfreeServlet?command=admin_order_ready&status=1&orderNo='+orderNo;
				} else {
					return;
				}
			}
			/* status가 2이면 인도중 상태 -> 이때 클릭하면 배송을 인도완료 상태로 변경시키는 action으로 이동  */
			if(status=='2'){
				if (confirm("상품이 인도되었습니까?")) {
					location.href= 'DutyfreeServlet?command=admin_order_ready&status=2&orderNo='+orderNo;
				} else {
					return;
				}
			}
			

		}
	</script>
	<head>
<meta charset="UTF-8">
<title>현대백화점인터넷면세점</title>
	</head>
	<body>
		<main id="container" class="container">
			<section>
				<div class="breadcrumb"></div>
				<div class="lnb_content">
					<%@ include file="/admin/menu.jsp"%>

					<div class="content_wrap">
						<h3 class="h3_type line">주문목록</h3>
						<div class="notice_list_wrap">

							<div class="tb_list">
								
								<table id="orderList" class="table table-sm">
									<colgroup>
										<col style="width: 90px">
										<col style="width: 120px">
										<col style="width: auto">
										<col style="width: 95px">
										<col style="width: 100px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">주문번호</th>
											<th scope="col">주문상세번호</th>
											<th scope="col">상품명</th>
											<th scope="col">주문수량</th>
											<th scope="col">가격</th>
											<th scope="col">상태</th>
											<th scope="col">주문일시</th>
											<th scope="col">주문자</th>
										</tr>
									</thead>
									<!-- 전달받은 orderList에서 orderVO 하나씩 꺼내서 내용출력 -->
									<c:forEach items="${orderList}" var="orderVO">
										<tbody>
											<tr>
												<td>${orderVO.oNo}</td>
												<td>${orderVO.odNo}</td>
												<td>${orderVO.pName}</td>
												<td>${orderVO.odAmount}</td>
												<td>${orderVO.pPrice}</td>
												<!-- oShipping이 0(주문완료)상태이면 버튼이 눌렸을 때 인자로 1을, -->
												<!-- oShipping이 1(인도중)상태이면 버튼이 눌렸을 떄 인자를 2로해서 javascript order 함수호출 -->
												<td><c:choose>
														<c:when test="${orderVO.oShipping==0}">
															<button type="button" class="btn_basic4"
																style="border-color: red;"
																onclick="javascript: order(1,${orderVO.oNo})">주문접수</button>
														</c:when>
														<c:when test="${orderVO.oShipping==1}">
															<button type="button" class="btn_basic4"
																style="border-color: blue;"
																onclick="javascript: order(2,${orderVO.oNo})">인도중</button>
														</c:when>
														<c:when test="${orderVO.oShipping==2}"> 인도완료 </c:when>
													</c:choose></td>
												<td><fmt:formatDate value="${orderVO.oDate}"
														type="date" /></td>
												<td>${orderVO.mId}</td>
											</tr>
									</c:forEach>
									</form>
									</tbody>
								</table>
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</body>
	</html>