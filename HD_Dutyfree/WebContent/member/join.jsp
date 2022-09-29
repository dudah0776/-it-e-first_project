<!-- 김나형 생성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 100%; min-width: 1340px; padding-top: 121px;">
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>현대백화점인터넷면서점</title>
<script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
<link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/n_hgk.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/member.css?ver=18">
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
</head>
<body>
<script>
$(function() {
	  // 생년월일에 숫자만 입력되도록
	  $("#mbshBymdDt1").keypress(function(event) {
	    if (event.which < 48 || event.which > 57) {
	      event.preventDefault();
	    }
	  })

	  var RegNotNum = /[^0-9]/g;

	  $("#mbshBymdDt1").attr("maxlength", 10); // 생년월일 최대길이 설정

	  var prev = ""; // 이전 값 백업용
	  
	  $("#mbshBymdDt1").keyup(function() {

	    var date = this.value;

	    date = date.replace(RegNotNum, ''); // 숫자만 남기기

	    if (date == "" || date == null || date.length < 5) {
	      this.value = date;
	      return;
	    }

	    var DataFormat;
	    var RegDateFmt;

	    // 생년월일 포맷(yyyy-mm-dd) 만들기 
	    if (date.length <= 6) {
	      DataFormat = "$1-$2";
	      RegDateFmt = /([0-9]{4})([0-9]+)/;
	    } else if (date.length <= 8) {
	      DataFormat = "$1-$2-$3";
	      RegDateFmt = /([0-9]{4})([0-9]{2})([0-9]+)/;
	    }

	    date = date.replace(RegDateFmt, DataFormat);

	    this.value = date;

	    // 모두 입력됐을 경우 날짜 유효성 확인
	    if (date.length == 10) {

	      var isVaild = true;

	      if (isNaN(Date.parse(date))) {
	        // 유효 날짜 확인 여부
	        isVaild = false;
	      } else {

	        // 년, 월, 일 0 이상 여부 확인
	        var date_sp = date.split("-");
	        date_sp.forEach(function(sp) {
	          if (parseInt(sp) == 0) {
	            isVaild = false;
	          }
	        });

	        // 마지막 일 확인
	        var last = new Date(new Date(date).getFullYear(), new Date(date).getMonth() + 1, 0);
	        // 일이 달의 마지막날을 초과했을 경우 다음달로 자동 전환되는 현상이 있음 (예-2월 30일 -> 3월 1일)
	        if (parseInt(date_sp[1]) != last.getMonth() + 1) {
	          var date_sp2 = date_sp.slice(0);
	          date_sp2[2] = '01';
	          var date2 = date_sp2.join("-");
	          last = new Date(new Date(date2).getFullYear(), new Date(date2).getMonth() + 1, 0);
	        }
	        if (last.getDate() < parseInt(date_sp[2])) {
	          isVaild = false;
	        }
	      }

	      if (!isVaild) {
	        alert("잘못된 날짜입니다. \n다시 입력하세요.");
	        this.value = "";
	        this.focus();
	        return;
	      }
	    }
	  }).focusin(function() {
	    prev = this.value;
	  }).focusout(function() {
	    // 정상 포맷이 아닌 채 입력 도중 나왔을 경우 값 복구
	    var RegDateFmt = /([0-9]{4})-([0-9]{2})-([0-9]+)/;
	    if (!RegDateFmt.test(this.value)) {
	      this.value = prev;
	    }
	  });

	});
	
	$(function(){
		//휴대폰 양식 (010-0000-0000)
		$('#mophNo').keydown(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $text = $(this);
		    if (key !== 8 && key !== 9) {
		        if ($text.val().length === 3) {
		            $text.val($text.val() + '-');
		        }
		        if ($text.val().length === 8) {
		            $text.val($text.val() + '-');
		        }
		    }
	    	return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
		});

	});
	
	// 아이디 중복체크 & 이메일 형식 체크
	function idcheck() {			
		if (document.formm.mbshId.value == "") {
			alert('아이디를 입력하여 주십시오.');
			document.formm.mbshId.focus();
			return;
		}
		var email = document.formm.mbshId.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		// 이메일 형식에 맞을 경우, id 중복 체크 페이지로 이동
		if(exptext.test(email)){
			var url = "DutyfreeServlet?command=id_check_form&id="
				+ document.formm.mbshId.value;
			window.open(url, "_blank_1",
				"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=200");
		} else{
			alert("이메일형식이 올바르지 않습니다.");
			document.formm.mbsId.focus();
			return;
		}
	}
	
	//회원가입 진행 전 입력값 체크 & 회원정보 넘기기
	function go_save(){
		let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		 if (document.formm.id.value == "") {
			 alert("아이디를 입력하여 주세요.");
			 document.formm.id.focus();
		} else if (document.formm.id.value != document.formm.reid.value) {
			 alert("중복확인을 클릭하여 주세요.");
			 document.formm.id.focus();
		} else if (document.formm.pwd.value == "") {
			 alert("비밀번호를 입력해 주세요.");
			 document.formm.pwd.focus();
		} else if(!check.test(document.formm.pwd.value)){
			 alert("8~20자 이내 영문자, 숫자, 특수문자 3가지 조합으로 입력해 주세요.");
			 document.formm.pwd.focus();
		}else if ((document.formm.pwd.value != document.formm.pwdCheck.value)) {
			 alert("비밀번호가 일치하지 않습니다.");
			 document.formm.pwd.focus();
		} else if (document.formm.name.value == "") {
			 alert("이름을 입력해 주세요.");
			 document.formm.name.focus();
		} else if (document.formm.sex.value == "") {
			 alert("성별을 입력해 주세요.");
			 document.formm.sex.focus();
		}  else if (document.formm.birth.value == "") {
			 alert("생일을 입력해 주세요.");
			 document.formm.birth.focus();
		}  else if (document.formm.phone.value == "") {
			 alert("번호를 입력해 주세요.");
			 document.formm.phone.focus();
		}   else if (document.formm.passport.value == "") {
			 alert("여권번호를 입력해 주세요.");
			 document.formm.passport.focus();
		} else {
			 document.formm.action = "DutyfreeServlet?command=join";
			 document.formm.submit();
		}
	}
</script>
	<main id="container" class="container">
		<div class="container">
			<section>
				<div class="join_wrap ">
					<form id="join" name="formm" method="post" action="DutyfreeServlet?command=join">

						<h2 class="h2_type">회원가입(내국인)</h2>

						<div class="join_step">
							<ol>
							    <li class="ico_memb step01 pass">STEP 01<em>약관동의</em></li>
                            	<li class="ico_memb step03 active">STEP 02<em>정보입력</em></li>
                            	<li class="ico_memb step04">STEP 03<em>가입완료</em></li>
							</ol>
						</div>

						<h3 class="h4_type mgtl">
							회원정보 입력<span class="small_txt">(필수)</span>
						</h3>
						<p class="f_size01">회원가입을 위한 필수입력 정보입니다.</p>
						<form id="join" action="DutyfreeServlet?command=join" method="post" name="formm" tabindex="-1">
							<div class="join_form">
								<!--아이디-->
								<div class="join_row with_btn placeholder_wrap" id="divId">
									<input type="text" id="id" name="mbshId" value="" maxlength="20">
									<label for="mbshId">아이디<span>(ex>email@naver.com)</span></label>
									<p class="t_error" style="display: none;"></p>
									<!-- <input type="button" value="중복체크" class="btn_basic4 small" > -->
									<input type="hidden" name="reid">
								</div>
								
								<!--비밀번호-->
								<div class="join_row placeholder_wrap" id="divPwd">
									<input type="password" id="mbshPwd" name="pwd" maxlength="20" onclick="idcheck()" tabindex="-1">
									<label for="mbshPwd">비밀번호<span>(8~20자 이내 영문자, 숫자, 특수문자 3가지 조합)</span></label>
									<p class="t_error" style="display: none;"></p>
								</div>
								
								<!--비밀번호 확인-->
								<div class="join_row placeholder_wrap" id="divRePwd">
									<input type="password" id="reMbshPwd" name="pwdCheck" maxlength="20">
									<label for="reMbshPwd"> 비밀번호 확인<span>(비밀번호와 동일하게 입력)</span></label>
									<p class="t_error" style="display: none;"></p>
								</div>

								<!--이름-->
								<div class="join_row" id="divMbshHnglNm">
									<input type="text" id="mbshHnglNm" name="name" placeholder="이름" value="" maxlength="50" style="text-transform: uppercase;">
									<input type="hidden" name="name2" value="">
									<p class="t_error" style="display: none;"></p>
								</div>

								<!--성별-->
								<div class="join_row blocks_tb select">
									<div class="join_row" id="divSexCd">
										<select name="sex" class="sel_type" id="sexCd" style="display: none;">
											<option value="">성별</option>
											<option value="남성">남</option>
											<option value="여성">여</option>
										</select>
										<p class="t_error" style="display: none;"></p>
									</div>
								</div>

								<!--생일-->
								<input type="hidden" name="mbshBase[natiCd]" value="KOR">
								<div class="join_row">
									<input type="text" id="mbshBymdDt1" class="noHasDatepicker" name="birth" value="" placeholder="생년월일(YYYY-MM-DD)">
									<input type="hidden" id="mbshBymdDt" name="birth2" value="">
									<p class="t_error" style="display: none;"></p>
								</div>

								<!-- 핸드폰번호 -->
								<div class="join_row blocks2 type2 dis" id="divMophNo">
									<div class="join_col w08 select">
										<select name="phone2" class="sel_type" id="telNatiCd1" style="display: none;">
											<option value="82" selected="selected">한국 (+82)</option>
										</select>
										 <input type="hidden" name="phone2" value="82">
									</div>
									<div class="join_col w09">
										<input type="text" id="mophNo" name="phone" value="" maxlength="13">
										<input type="hidden" name="phone2" value="">
										<p class="t_error" style="display: none;"></p>
									</div>
								</div>
							</div>

							<div class="tit_with_bth">
								<h3 class="h4_type mgtm">
									여권정보 입력<span class="small_txt">(필수)</span>
								</h3>
								<p class="f_size05">여권정보를 미리 입력하시면 주문 시 별도 입력 없이 바로 주문 가능합니다.</p>
							</div>

							<div class="join_form input_passport">
								<div class="join_row" id="divPsptNo">
									<input type="text" id="psptNo" name="passport" value="" class="engNumber" placeholder="여권번호" maxlength="12" style="text-transform: uppercase;">
									<p class="t_error" style="display: none;"></p>
								</div>
							</div>
						</form>


						<h3 class="h4_type mgtm">
							부가정보 입력<span class="small_txt">(선택)</span>
						</h3>
						<p class="f_size01">선택입력 사항입니다.</p>

						<div class="join_form type2">
							<div class="join_row blocks ">
								<div class="join_marketing">
									<span class="checkbox round"> 
									<input type="hidden" id="mrktCd" name="mbshJoinTcndCds[]" value="004">
									<input type="hidden" id="mrktNo" name="mbshJoinTcndVerNos[]" value="1.5">
									<input type="hidden" id="mrktNtnlCd" name="joinNtnlCds[]" value="KR">
									<input type="hidden" id="mrktYn" name="agrYns[]" value="">
									<input type="checkbox" id="agrYn" name="agrYn" value="Y">
									<label for="agrYn">마케팅 정보 수신 동의</label>
									</span>
									<p class="consign">
										(주) 현대백화점면세점은 마케팅 활동을<a href="javascript:showPrivacyTermsLayerPop('open');">수탁업체</a> 를 통해 진행할 수 있습니다.마케팅 정보를 받는데 동의하면, 회사가 수탁업체를 통해 마케팅 정보를 전송하는 것에 동의하는 것으로 간주합니다.
									</p>
									<div class="of_hidden">
										<button type="button" class="btn_basic4 small " onclick="showMktLayerPop('open');">
											<span id="termsText">내용보기</span>
										</button>
										<span class="checkbox round fr"> <input type="checkbox" id="smsRcvYn" name="mbshBase[smsRcvYn]" value="Y" disabled=""> 
										<label for="smsRcvYn">SMS</label>
										</span>
										<span class="checkbox round fr"> 
										<input type="checkbox" id="mailRcvYn" name="mbshBase[mailRcvYn]" value="Y" disabled=""> 
										<label for="mailRcvYn">이메일</label>
										</span>
									</div>
								</div>
							</div>

							<div class="join_row expiration_day">
								<span class="label_type">개인정보 유효기간</span> 
								<span class="radio"> <input type="radio" id="expiration_day02" name="mbshMst[mbshSleepPridNofd]" value="3"> 
								<label for="expiration_day02">3년</label>
								</span> 
								<span class="radio level_up"> 
								<input type="radio" id="expiration_day04" name="mbshMst[mbshSleepPridNofd]" value="0"> 
								<label for="expiration_day04">탈퇴 시 파기</label>
									<button type="button" class="btn_basic2 small" id="layerLevelupBtn">등급UP</button>
									<div class="layer_levelup" id="layerLevelup">
										<p>평생회원 특별혜택!</p>
										<p>
											'탈퇴 시 파기' 선택하고 가입 완료하면, 온라인 <strong>H.VVIP 등급+오프라인 BLACK 멤버십</strong> 바로 지급!
										</p>

										<a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002682" class="btn_basic1 small" target="_blank">이벤트 상세보기</a> 
										<span class="layer_close"><span>닫기</span></span>
									</div>
								</span>
								<p class="expiration_info">※ 별도 선택이 없을 경우 개인정보 보관기간은 1년으로 합니다.</p>
							</div>
						</div>

						<input type="hidden" id="psptRcvCd" name="mbshJoinTcndCds[]" value="003">
						<input type="hidden" id="psptRcvNo" name="mbshJoinTcndVerNos[]" value="1.7">
						<input type="hidden" id="psptRcvNtnlCd" name="joinNtnlCds[]" value="KR">
						<input type="hidden" id="psptRcvYn" name="agrYns[]" value="N">

						<div class="basic_btn_box mgtml">
							<!-- 확인 버튼 클릭시 입력한 정보에 null값이 있는지, 제대로 입력이 되었는지 확인 -->
							<button type="button" class="btn_basic2" id="btnNext" onclick="go_save()">확인</button>
						</div>
					</form>
				</div>
			</section>
		</div>
	</main>
</body>
	</html>