<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 박진수 -->
<!-- request로 받은 id가 0과 같으면 다음과 같이 동일한 회원이 없다는 알림창을 띄운다 -->
<c:if test="${id eq '0'}">
	<script type="text/javascript">
		alert('동일한 이름이나 전화번호가 같은 회원이 없습니다');
	</script>
</c:if>
<!--  -->
<%@include file="../include/header.jsp" %>
		<!-- // header -->
		<!-- container -->
		
<script type="text/javascript">
$(function(){
	
   $(function() {
	   		//아이디 찾기 버튼을 클릭시 수행
			$('#btnConfirm').click(function() {
						//memName memPhone id를 갖는 입력칸 태그의 값에 공백를 제거한다.
						$('#memName').val($.trim($('#memName').val()));
						$('#memPhone').val($.trim($('#memPhone').val()));
						
						//memName id의 입력칸이 빈칸일 경우 수행한다.
						if($('#memName').val() == '') {
							//다음과 같이 pError id 칸에 이름을 입력해주세요 라는 텍스트를 보여준다
							$('#pError').show().text('이름을 입력해주세요.');
							
							//memName id 입력칸에 입력이 가게 한다.
				            $('#memName').focus();
				            return ;
						}
						//perror id의 칸을 숨긴다.
						$('#pError').hide();
						
						//memPhone id의 입력칸이 빈칸일 경우 수행한다.
				    	if($('#memPhone').val() == '') {
				    		//다음과 같이 pError id 칸에 휴대폰 번호를 입력해주세요 라는 텍스트를 보여준다
				            $('#pError').show().text('휴대폰번호를 입력해주세요.');
				          	//memPhone id 입력칸에 입력이 가게 한다.
				            $('#memPhone').focus();
				            return ;
				        }
				    	//perror id의 칸을 숨긴다.
				    	$('#pError').hide();
				    	//다 해당하지 않을 경우 FindId라는 id 값을 가지는 form태그에 submit을 수행시킨다.
				    	$('#FindId').submit();
			 });
			});



    // FindId 태그 안에 있는 memName 입력창에서 엔터키처리할 경우 실행된다.
    $('#memName', '#FindId').keydown(function(e) {
        if(e.keyCode == 13) {
        	//FindId 태그 안에 있는 btnConfirm id 값을 가지는 버튼을 클릭시킨다. 
        	$('#btnConfirm', '#FindId').click();
        	e.preventDefault();
        }
    }); 
    
    // memPhone 입력창에서 엔터키처리할 경우 실행된다.
    $('#memPhone', '#FindId').keydown(function(e) {
        if(e.keyCode == 13) {
        	//FindId 태그 안에 있는 btnConfirm id 값을 가지는 버튼을 클릭시킨다. 
        	$('#btnConfirm', '#FindId').click();
        	e.preventDefault();
        }
    }); 
});
</script>
<!-- 박진수 -->
<!-- 아이디 찾기 입력 칸 -->
		<main id="container" class="container">
			<div style="width: 100%; min-width: 1340px; padding-top: 400px;">
				<div class="container">
					<section>
						<div class="join_wrap" style="text-align: center;">
							<h2 class="h2_type">아이디 찾기</h2>
							<!-- submit하게 되면 id 찾는 동작을 하는 DutyfreeServlet?command=FindId url로 이동 -->
							<form id="FindId" name="FindId" method="post" action="DutyfreeServlet?command=FindId">
								<div class="join_form mgtm">
									<div class="join_row with_btn" id="divId" style="position:relative; min-height:60px">
										<input type="text" id="memName" name="memName" placeholder="이름" maxlength="20" style="width:50%; height:60px;">
									</div>
									<div class="join_row with_btn" id="divPhone">
										<input type="text" id="memPhone" name="memPhone" placeholder="휴대폰번호" maxlength="20" style="width:50%; height:60px;">
									</div>
								</div>
								<div class="dang_type">
									<p class="d_txt" id="pError" style="display: none; color: red;"></p>
								</div>
								<div class="basic_btn_box mgtml">
									<button type="button" class="btn_basic2" id="btnConfirm">확인</button>
								</div>
							</form>
						</div>
					</section>
				</div>
				<!-- // container -->
			</div>
		</main>
	<!--  -->

</body>
<%@ include file="../include/footer.jsp"%>


