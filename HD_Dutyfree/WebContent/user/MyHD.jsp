<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 기본정보 관리(마이 페이지) 페이지  -->
<!-- session의 memId가 null이면 로그인한 사용자가 아니기 때문에 
'/DutyfreeServlet?command=Error'를 실행 	
-->
<%
	if (memId == null) {
%>
<script language='javascript'>
	location.href = '/DutyfreeServlet?command=Error';
</script>
<!-- 수정이 완료된 세션을 나타내는 update_success가 null이 아니면 수정이 완료된다는
알림창을 띄운다
 -->
<%
	}if((String)session.getAttribute("update_success")!=null){
%>
		<script type="text/javascript">
		alert('수정이 완료되었습니다');
		</script>
<!-- update_success 세션을 지운다. -->		
<%
	session.removeAttribute("update_success");
	}
%>

<!-- 비밀번호 변경을 완료했다는 request 속성인 changePassword_success가
null이 아니면 비밀변경이 완료되었다는 알림창을 띄운다 -->
<!--  비밀번호 변경을 실패했다는 request 속성인 changePassword_fail가
null이 아니면 기존 비밀번호가 다르다는 알림창을 띄운다 -->
<c:choose>
<c:when test="${not empty changePassword_success }">
	<script type="text/javascript">
		alert('비밀번호 변경이 완료되었습니다');
	</script>
</c:when>
<c:when test="${not empty changePassword_fail }">
	<script type="text/javascript">
		alert('기존 비밀번호가 다릅니다');
	</script>
</c:when>
</c:choose>

<!--  -->

<!-- container -->
<script type="text/javascript">

//회원 탈퇴 버튼을 클릭하게 되면 회원탈퇴 알림창을 띄우고 확인을 클릭하면 DutyfreeServlet?command=Delete&memId=회원id로 url을 보낸다
function deleteMember(){
	 if(confirm("정말 회원탈퇴하시겠습니까?")){
		 location.href="DutyfreeServlet?command=Delete&memId=${member.memId}";
	 }else{
		 return;
	 }
}
		$(function() {

			//UpdateMember form 태그에 UpdateConfirm라는 id로 된 태그로 클릭시 실행
			$('#UpdateConfirm','#UpdateMember').click(function() {
				//memPhone id에 입력된 값의 공백을 제거
				$('#memPhone').val($.trim($('#memPhone').val()));
				//memPassport에 입력된 값의 공백을 제거
				$('#memPassport').val($.trim($('#memPassport').val()));
				//memPhone의 값이 없으면 실행
				if ($('#memPhone').val() == '') {
					//휴대폰번호를 입력해주세요 라는 알림창을 띄우고 memPhone id 값을 입력창에 간다.
					alert('휴대폰번호를 입력해주세요');
					$('#memPhone').focus();
					return;
				}
				//memPassport의 값이 없으면 실행
				if ($('#memPassport').val() == '') {
					//여권번호를 입력해주세요 라는 알림창을 띄우고 memPassport id인 태그에 입력창으로 간다.
					alert('여권번호를 입력해주세요');
					$('#memPassport').focus();
					return;
				}
				//정보를 수정하시겠습니까라는 팝업창을 띄운다.
				if(confirm('정보를 수정하시겠습니까?')){
				//확인이면 form 태그 id인 UpdateMember를 submit을 수행시킨다. 
				$('#UpdateMember').submit();
				}else{
					return;
				}
				

			});
			//ChangePw form 태그에 ChangeConfirm라는 id로 된 태그로 클릭시 실행
			 $('#ChangeConfirm','#ChangePw').click(function(){
				 
				 //oldPw의 값이 없으면 실행
				 if($('#oldPw').val()==''){
				 		//기존 비밀번호를 입력하세요라는 알림창을 띄운다.
				 		alert('기존비밀번호를 입력하세요.');
				 		//id가 oldPw인 입력창 태그에 입력창을 집중시킨다.
				 		$('#oldPw').focus();
				 		return;
				 }
				 
				//newPw의 값이 없으면 실행
			 	if($('#newPw').val()==''){
			 		//새 비밀번호를 입력하세요라는 알림창을 띄운다.
			 		alert('새비밀번호를 입력하세요.');
			 		//id가 newPw인 입력창 태그에 입력창을 집중시킨다.
			 		$('#newPw').focus();
			 		return;
			 	}
				
				//기존 비밀번호를 나타내는 oldPw 값이 회원의 비밀번호랑 같으면 실행
			 	if($('#oldPw').val()=='${member.memPw}'){
				 	
			 		//비밀번호를 변경하시겠어요라는 팝업창을 띄운다.
					if(confirm('비밀번호를 변경하시겠습니까?')){
						//inform 태그 id가 ChangePw인 태그에 submit을 실행시킨다.
					 	$('#ChangePw').submit();
					 	}
			 		return;
			 	}else{
			 		//입력한 기존 비밀번호 입력창과 기존 회원 비밀번호가 다르다면 
			 		//기존비밀번호와 다릅니다라는 알림창을 띄운다.
			 		alert('기존비밀번호와 다릅니다.');
			 		//oldPw id 태그에 집중시킨다.
					$('#oldPw').focus();
			 	}
			 	
			 });
			 
			
				// 엔터키처리
				//ChangePw ID값 안에 있는 oldPw id로 된 입력창을 키를 누르게 되면 실행된다.
			    $('#oldPw', '#ChangePw').keydown(function(e) {
			    	//키가 엔터키면 실행된다.
			        if(e.keyCode == 13) {
			        	//ChangePw 태그 안에 있는 ChangeConfirm id를 가진 버튼을 클릭하는 함수를 호출한다.
			        	$('#ChangeConfirm', '#ChangePw').click();
			        	e.preventDefault();
			        }
			    });
				
			  //ChangePw ID값 안에 있는 newPw id로 된 입력창을 키를 누르게 되면 실행된다.
			    $('#newPw', '#ChangePw').keydown(function(e) {
			    	//키가 엔터키면 실행된다.
			        if(e.keyCode == 13) {
			        	//ChangePw 태그 안에 있는 ChangeConfirm id를 가진 버튼을 클릭하는 함수를 호출한다.
			        	$('#ChangeConfirm', '#ChangePw').click();
			        	e.preventDefault();
			        }
			    }); 
		});

</script>
<!-- 기본정보 관리 입력창 -->
<main id="container">
	<article class="location">
		<section class="box">
			<a nohref onclick="goUrl('/dm/main.do');" class="home">홈</a>
			<div>
				<span>마이페이지</span>
			</div>
			<div>
				<span>기본정보관리</span>
			</div>
		</section>
	</article>
	<article class="top_fullbg">
		<h2 class="page_tit">기본정보관리</h2>
		<div class="myhd_firinfo">
			<div class="myinfo">
				<p class="name">
					<strong> ${member.memName}</strong> <em>님</em>
				</p>
				<div class="mylv">
					<span class="lv_on_up001"></span> <span class="lv_off_up002"></span>
				</div>
			</div>
			<div class="mypresent">
				<dl style="height: 200px; padding-top: 80px; width: 250px;">
					<a href="DutyfreeServlet?command=order_detail">
						<dt style="font-size: 20px;">주문내역</dt>
					</a>
				</dl>
				<dl style="height: 200px; padding-top: 80px; width: 250px;">
					<a href="DutyfreeServlet?command=cs_Mylist">
						<dt style="font-size: 20px;">문의내역</dt>
					</a>
				</dl>
				<dl style="height: 200px; padding-top: 80px; width: 250px;">
					<a href="DutyfreeServlet?command=Update_page">
						<dt style="font-size: 20px;">기본정보관리</dt>
					</a>
				</dl>


			</div>
		</div>
	</article>
	<article id="content">
		<section class="myhd_asis">
			<div class="content_wrap">
				<h3 class="h3_type line">기본정보관리</h3>
				<form id="UpdateMember" name="UpdateMember" method="post" action="/DutyfreeServlet?command=Update">
					<table class="tb_write01 vm">
						<caption>기본정보관리</caption>
						<colgroup>
							<col style="width: 160px">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="bt_no">아이디</th>
								<td class="bt_no">${member.memId}<input type="hidden" name="memId" value="${member.memId }">
								</td>
							</tr>
							<tr>
								<th scope="row" class="bt_no">성명</th>
								<td class="td_data">${member.memName}
									<p class="t_info">한글 성명은 고객센터(1811-6688)통해서 수정이 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<th scope="row" class="bt_no">성별</th>
								<td class="td_data">${member.memGender }
									<p class="t_info">성별은 고객센터(1811-6688)통해서 수정이 가능합니다.</p>
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td class="td_data">${member.memBirth }
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td class="td_data"><input type="text" id="memPhone" name="memPhone" value="${member.memPhone }"></td>
							</tr>
							<tr>
								<th scope="row">여권번호</th>
								<td class="td_data"><input type="text" id="memPassport" name="memPassport" value="${member.memPassport }"></td>
							</tr>
							<tr>
								<!-- 회원탈퇴를 클릭하게 되면 deleteMember()메서드를 실행시키게 된다. -->
								<th scope="row">회원탈퇴</th>
								<td>
								<span class="rgap02">회원탈퇴를 하시면 그동안 구매 실적은 사라집니다.</span> 
								<button type="button" class="btn_basic4 small" onclick="deleteMember()" > 회원탈퇴 </button>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area mt40">
						<a href="DutyfreeServlet?command=index" class="btnxl_type2 type2" id=UpdateCancel">취소</a>
						<button type="button" class="btnxl_type2 type2 bg_black" id="UpdateConfirm">수정</button>
					</div>
				</form>
				<!-- 비밀번호를 변경하는 창 -->
				<h3 class="h3_type line">비밀번호 변경</h3>
				<!-- ChangePw 태그를 submit하게 되면 /DutyfreeServlet?command=ChangePw url을 전송  -->
				<form id="ChangePw" name="ChangePw" method="post" action="/DutyfreeServlet?command=ChangePw">
					<table class="tb_write01 vm">
						<colgroup>
							<col style="width: 160px">
							<col style="width: auto">
						</colgroup>
						<tbody>
						<caption></caption>
						<tr>
							<th scope="row">기존비밀번호</th>
							<td><input type="password" id="oldPw" name="oldPw">
						</tr>
						<tr>
							<th scope="row"> 새 비밀번호</th>
							<td><input type="password" id="newPw" name="newPw">
							<input type="hidden" id="checkId" name="checkId" value="${member.memId }">
						</tr>
							
						</tbody>
					</table>
					<button type="button" class="btnxl_type2 type2 bg_black" id="ChangeConfirm">변경</button>
				</form>

			</div>
		</section>
	</article>
	<%@include file="../include/footer.jsp"%>