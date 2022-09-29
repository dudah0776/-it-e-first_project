<!-- 김가희 -->
<!-- 회원목록을 보여주는 페이지(관리자용) -->
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
						<h3 class="h3_type line">회원목록</h3>
						<div class="notice_list_wrap">

							<div class="tb_list">
							
								<form name="formm" method="post">
									<table id="memList" class="table table-sm">
										<colgroup>
											<col style="width: 90px">
											<col style="width: 120px">
											<col style="width: auto">
											<col style="width: 95px">
											<col style="width: 100px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">성별</th>
												<th scope="col">여권번호</th>
												<th scope="col">전화번호</th>
												<th scope="col">생일</th>
												<th scope="col">가입일</th>
											</tr>
										</thead>
										<tbody>
										<!--  전달받은 memList에서 memVO 하나씩 꺼내서 내용출력 -->
											<c:forEach items="${memList}" var="memVO">
												<tr>
													<td>${memVO.memId}</td>
													<td>${memVO.memName}</td>
													<td>${memVO.memGender}</td>
													<td>${memVO.memPassport}</td>
													<td>${memVO.memPhone}</td>
													<td><fmt:formatDate value="${memVO.memBirth}"
															type="date" /></td>
													<td><fmt:formatDate value="${memVO.memRegDate}"
															type="date" /></td>

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
	</html>