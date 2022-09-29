<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 박진수 -->
<!-- 비밀번호 찾는 페이지 -->
<!-- request 이름 pw가 0과 같으면 비밀번호가 없다는 알림창을 띄운다. -->
<c:if test="${pw eq '0'}">
	<script type="text/javascript">
		alert('해당하는 아이디에 대한 비밀번호가 없습니다');
	</script>
</c:if>
<!--  -->
<%@include file="../include/header.jsp"%>
<!-- // header -->
<!-- container -->
<main id="container" class="container">
	<script type="text/javascript">
		$(function() {
			//비밀번호 찾기 버튼을 클릭시 수행
			$('#btnConfirm').click(function() {
				//memId memPhone id를 갖는 입력칸 태그의 값에 공백를 제거한다.
				$('#memId').val($.trim($('#memId').val()));
				$('#memPhone').val($.trim($('#memPhone').val()));
				
				//memId id의 입력칸이 빈칸일 경우 수행한다.
				if ($('#memId').val() == '') {
					//다음과 같이 pError id 칸에 아이디를 입력해주세요 라는 텍스트를 보여준다
					$('#pError').show().text('아이디를 입력해주세요.');
					
					//memId id 입력칸에 입력이 가게 한다.
					$('#memId').focus();
					return;
				}
				
				//perror id의 칸을 숨긴다.
				$('#p_Error').hide();
				
				//memPhone id의 입력칸이 빈칸일 경우 수행한다.
				if ($('#memPhone').val() == '') {
					
					//다음과 같이 pError id 칸에 휴대폰 번호를 입력해주세요 라는 텍스트를 보여준다
					$('#pError').show().text('휴대폰번호를 입력해주세요.');
					//memPhone id 입력칸에 입력이 가게 한다.
					$('#memPhone').focus();
					return;
				}
				//perror id의 칸을 숨긴다.
				$('#pError').hide();
				//다 해당하지 않을 경우 FindPw라는 id 값을 가지는 form태그에 submit을 수행시킨다.
				$('#FindPw').submit();
			});

			 // FindPw 태그 안에 있는 memId 입력창에서 엔터키처리할 경우 실행된다.
			$('#memId', '#FindPw').keydown(function(e) {
				if (e.keyCode == 13) {
					//FindId 태그 안에 있는 btnConfirm id 값을 가지는 버튼을 클릭시킨다. 
					$('#btnConfirm', '#FindPw').click();
					e.preventDefault();
				}
			});
			
			// memPhone 입력창에서 엔터키처리할 경우 실행된다.
			$('#memPhone', '#FindPw').keydown(function(e) {
				if (e.keyCode == 13) {
					//FindPw 태그 안에 있는 btnConfirm id 값을 가지는 버튼을 클릭시킨다. 
					$('#btnConfirm', '#FindPw').click();
					e.preventDefault();
				}
			});
		});
	</script>
	<!-- 박진수 -->
	<!-- 비밀번호 입력칸 -->
	<div style="width: 100%; min-width: 1340px; padding-top: 400px;">
		<div class="container">
			<section>
				<div class="join_wrap" style="text-align: center;">
					<h2 class="h2_type">비밀번호 찾기</h2>
					<!-- submit을 하게 되면 비밀번호 찾는 동작을 수행하는 DutyfreeServlet?command=FindPw url로 이동 -->
					<form id="FindPw" name="FindPw" method="post" action="DutyfreeServlet?command=FindPw">
						<div class="join_form mgtm">
							<div class="join_row with_btn" id="divId" style="position: relative; min-height: 60px">
								<input type="text" id="memId" name="memId" placeholder="아이디" maxlength="20" style="width: 50%; height: 60px;">
							</div>
							<div class="join_row with_btn" id="divPhone">
								<input type="text" id="memPhone" name="memPhone" placeholder="휴대폰번호" maxlength="20" style="width: 50%; height: 60px;">
							</div>
						</div>
						<div class="dang_type">
							<p class="d_txt" id="pError" style="display: none;"></p>
						</div>
						<div class="basic_btn_box mgtml">
							<button type="button" class="btn_basic2" id="btnConfirm">확인</button>
						</div>
					</form>
				</div>
			</section>
		</div>
		<!--  -->
	</div>
</main>
<!-- // container -->
<%@ include file="../include/footer.jsp"%>
