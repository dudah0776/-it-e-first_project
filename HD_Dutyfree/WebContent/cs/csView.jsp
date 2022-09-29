<!-- 김가희 -->
<!-- 고객센터 글상세내용을 보여주는 페이지(고객용) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 개행문자 적용을 위한코드 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<!-- 박진수 추가 -->
<!-- 로그인하지 않은 사용자의 접근 막기 -->
<%
	if (memId == null) {
%>
	<script language='javascript'>
		location.href = '/DutyfreeServlet?command=Error';
	</script>

<%
	}
%>


<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<head>
<meta charset="UTF-8">
<title>현대백화점인터넷면세점</title>
	</head>
	
	<!-- 게시글 삭제버튼 눌렀을때 실행되는 함수 -->
	<script type="text/javascript">
		function deleteCs() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href='DutyfreeServlet?command=cs_delete&csNo='+${csVO.csNo};
			} else {
				return;
			}

		}
	</script>
	<body>
		<main id="container" class="container">
			<section>
					<div class="breadcrumb"></div>
					
					<!-- 좌측메뉴 include -->
					<%@ include file="/cs/menu.jsp"%>

					<div class="content_wrap">
						<h3 class="h3_type">1:1 고객 게시판</h3>
						<form name="formm" method="post">
							<div class="div_view mgtsl">
								<div class="view_header">
									<p class="title">${csVO.csTitle}</p>
									<p class="day_count">
										<span class="day"> 
										<fmt:formatDate value="${csVO.csDate}" type="date" /></span>
									</p>
								</div>
								<!-- 질문내용(csContent)에 개행문자적용 -->
								<div class="view_contents">${fn:replace(csVO.csContent, replaceChar, "<br/>")}</div>
								<br> <br> <br>
								
								<!-- csCheck가 1이면(답변완료라면) 답변을 보여준다.-->
								<c:choose>
									<c:when test='${csVO.csCheck=="1"}'>
										 <!-- 답변내용(replyContent)에 개행문자적용 -->
										<div class="view_contents" style="border-top: 1px solid black; padding: 37px 50px">
											${fn:replace(csVO.csReply, replaceChar, "<br/>")}
										</div>
									</c:when>
								</c:choose>
							</div>
							<div class="basic_btn_box">
								
								<!-- 작성자와 로그인한 유저가 같으면 삭제버튼이 나타나도록 함 -->
								<c:choose>
									<c:when test='${csVO.memId == loginId}'>
										<button type="button" class="btn_basic4"
											onclick="javascript:deleteCs()">삭제하기</button>
									</c:when>
								</c:choose>
								
								<button type="button" class="btn_basic4"
									onclick="location.href='DutyfreeServlet?command=cs_list'">목록보기</button>
								<button type="button" class="btn_basic4"
									onclick="location.href='DutyfreeServlet?command=index'">쇼핑
									계속하기</button>
							</div>
						</form>
					</div>
				</div>
			</section>
		</main>
	</body>