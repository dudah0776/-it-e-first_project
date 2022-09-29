<!-- 김가희 -->
<!-- 상품목록을 보여주는 페이지(관리자용) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>

<div style="width: 100%; min-width: 1340px; padding-top: 121px;">

<script type="text/javascript">
		/* 상품 입고  */
		function insertAmount(prodNo) {
			var amount = prompt("입고할 수량을 입력하세요", 0);
			if(amount != null){
				location.href= 'DutyfreeServlet?command=admin_prod_update&type=1&pNo='+prodNo+'&pamount='+amount;
			}
		}
		/* 할인율 변경 */
		function updateDC(prodNo,prodDC){
			var dc = prompt("변경할 할인율을 입력하세요", prodDC);
			if(dc != null){
				location.href= 'DutyfreeServlet?command=admin_prod_update&type=2&pNo='+prodNo+'&pDC='+dc;
			}
		}
		/* 가격 변경 */
		function updatePrice(prodNo,prodPrice){
			var price = prompt("변경할 가격을 입력하세요", prodPrice);
			if(price != null){
				location.href= 'DutyfreeServlet?command=admin_prod_update&type=3&pNo='+prodNo+'&pPrice='+price;
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
						<h3 class="h3_type line">상품목록</h3>
						<div class="notice_list_wrap">

							<div class="tb_list">
								<form name="formm" method="post">
									<%-- <input type="hidden" name="prodNo" value="${prodVO.pNo}"> --%>
									<table id="prodList" class="table table-sm">
										<colgroup>
											<col style="width: 90px">
											<col style="width: 120px">
											<col style="width: auto">
											<col style="width: 95px">
											<col style="width: 100px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">상품번호</th>
												<th scope="col">상품명</th>
												<th scope="col">브랜드</th>
												<th scope="col">카테고리</th>
												<th scope="col">정가</th>
												<th scope="col">할인율</th>
												<th scope="col">재고량</th>
												<th scope="col"></th>												
												<th scope="col">제품등록일</th>
											</tr>
										</thead>
										<tbody>
											<!-- 전달받은 pList(상품목록)에서 prodVO하나씩 꺼내서 내용출력 -->
											<c:forEach items="${pList}" var="prodVO">
												<tr>
													<td>${prodVO.pNo}</td>
													<td>${prodVO.pName}</td>
													<td>${prodVO.pBrand}</td>
													<td>${prodVO.pCategory}</td>
													<!-- 가격을 누르면 상품번호,가격을 인자로 넣어서 updatePrice함수 호출 -->
													<td><button type="button" class="btn_basic5"
																	onclick="javascript: updatePrice(${prodVO.pNo},${prodVO.pPrice})">${prodVO.pPrice}</button></td>
													<!-- 할인율을 누르면 상품번호,할인율을 인자로 넣어서 updateDC함수 호출  -->
													<td><button type="button" class="btn_basic5"
																	onclick="javascript: updateDC(${prodVO.pNo},${prodVO.pDiscount})">${prodVO.pDiscount}</button></td>
													<td>
													<!-- 상품의 재고량이 20미만이면 빨간색으로 재고표시 -->
													<c:choose>
														<c:when test="${prodVO.pStock lt '20'}"><span style="color:red"> ${prodVO.pStock} </span> </c:when>
														<c:when test="${prodVO.pStock  ge '20'}"> ${prodVO.pStock}</c:when>
													</c:choose>
													</td>
													<!-- 입고버튼을 누르면 상품번호를 인자로 넣어서 insertAmount함수 호출 -->
													<td>
														<button type="button" class="btn_basic5"
																	onclick="javascript: insertAmount(${prodVO.pNo})">입고</button>
													</td>
													<td>${prodVO.pRegdate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="clear"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</body>
	</html>