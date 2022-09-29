<!--김가희-->
<!-- 고객센터 글목록을 보여주는 페이지(관리자용) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>

<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<head>
<meta charset="UTF-8">
<title>현대백화점인터넷면세점</title>
	</head>
	<body>
		<main id="container" class="container">
			<section>
				<div class="breadcrumb"></div>
				<div class="lnb_content">
				<!-- 좌측관리자메뉴 include -->
					<%@ include file="/admin/menu.jsp"%>

					<div class="content_wrap">
						<h3 class="h3_type line">고객 게시판</h3>
						<div class="notice_list_wrap">

							<div class="tb_list">
								<form name="formm" method="post">
									<table id="csList" class="table table-sm">
										<caption>포토상품평</caption>
										<colgroup>
											<col style="width: 90px">
											<col style="width: 120px">
											<col style="width: auto">
											<col style="width: 95px">
											<col style="width: 100px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">등록일</th>
												<th scope="col">답변 여부</th>
											</tr>
										</thead>
										<tbody>
											<!-- 전달받은 csList에서 csVO 하나씩 꺼내서 내용출력 -->
											<c:forEach items="${csList}" var="csVO">
												<tr>
													<td>${csVO.csNo}</td>
													<!-- 게시글번호를 누르면 상세나용보기로 이동하도록함 -->
													<td><a href="DutyfreeServlet?command=admin_cs_view&csNo=${csVO.csNo}">${csVO.csTitle}</a></td>
													<td><fmt:formatDate value="${csVO.csDate}" type="date" />
													</td>
													<!--  csCheck값이 0이면 답변대기중, 1이면 답변완료(파란색)으로 표기 -->
													<td><c:choose>
															<c:when test="${csVO.csCheck==0}"><span style="color:red"> 답변대기중 </span> </c:when>
															<c:when test="${csVO.csCheck==1}"> 답변완료 </c:when>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</body>