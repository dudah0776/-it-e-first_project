<%@ page import="java.util.*" %>
<%@page import="com.dutyfree.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 박진수 -->
<!-- 로그인 페이지 -->
<% 
	//만약 회원가입을 하게 되면 join_success에 request 이름중 join_success 값을 가져온다
	String join_success="";
	join_success=(String)request.getAttribute("join_success");
	
	//join_success가 null 아니면 회원가입을 성공했다는 알림창을 띄운다.
	if(join_success!=null){
	
%>
<script type='text/javascript'>
alert("회원가입을 성공했습니다.");
</script>
<%} %>

<%
//session중에 saveId라는 이름을 가지는 세션 값을 가져온다.
String saveId = "";
saveId = (String) session.getAttribute("saveId");
%>

<% 
//fail이라는 이름을 가지는 request 값을 fail이라는 string 변수에 저장한다.
String fail=(String)request.getAttribute("fail");

//fail이라는 이름으로 가져온 값이 null이 아니라면 아이디나 비밀번호가 틀렸다는 알림창을 띄운다
if(request.getAttribute("fail")!=null){
%>
<script type='text/javascript'>
alert("아이디나 비밀번호가 틀렸습니다.");
</script>
<%} %>

<!-- pw가 값이 있으면 pw값을 알림창으로 띄운다. -->
<c:if test="${not empty pw }">
<c:out value="
		<script type='text/javascript'>
		alert('비밀번호는 ${pw} 입니다');
		</script>" escapeXml="false" />
</c:if>

<!-- id가 값이 있으면 id값을 알림창으로 띄운다. -->
<c:if test="${not empty id }">
<c:out value="
		<script type='text/javascript'>
		alert('아이디는 ${id} 입니다');
		</script>" escapeXml="false" />
</c:if>
<%
//가져온 pw나 id는 다시 제거한다.
if(request.getAttribute("pw")!=null){
	request.removeAttribute("pw");
}else if(request.getAttribute("id")!=null){
	request.removeAttribute("id");
} %>

<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="utf-8">
<title>현대백화점인터넷면세점</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/swiper.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper.min.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/member.css?ver=18">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/popup.css?ver=18">
<link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
</head>
<body>

<script type="text/javascript">

 $(function(){
    // 비밀번호나 아이디 입력에 대한 스타일 텍스트를 적용
    $("#pw_error").dialog({
        autoOpen: false,
        resizable: false,
        width:400,
        maxHeight: 720,
        modal: true
    });

    // 일반 아이디, 비밀번호 caps lock 체크
    $('#memId, #memPwd', '#memLgin').keypress(function(e) {
        var s = String.fromCharCode( e.which );
        if ( s.toUpperCase() === s && s.toLowerCase() !== s && !e.shiftKey ) {
        	$('#pError', '#memLgin').show().text("<Caps Lock>이 켜져 있습니다.");
        } else {
        	$('#pError', '#memLgin').hide();
        }
    });

    
    
   //memLgin form 태그 안에 btnLgin  버튼을 클릭시 수행
    $('#btnLgin', '#memLgin').click(function() {
    	 //memLgin form 태그 안에 memId 입력창의 값의 공백을 제거
    	$('#memId', '#memLgin').val($.trim($('#memId', '#memLgin').val()));
    	//memLgin form 태그 안에 memPw 입력창의 값의 공백을 제거
    	$('#memPw', '#memLgin').val($.trim($('#memPw', '#memLgin').val()));

    	 //memLgin form 태그 안에 memId 입력창의 값의 공백일 경우
    	if($('#memId', '#memLgin').val() == '') {
    		//memLgin id 태그에 아이디를 입력해주세요 라는 텍스트를 보여준다
    		$('#pError', '#memLgin').show().text('아이디를 입력해주세요.');
    		//memId id 입력칸에 입력이 가게 한다.
    		$('#memId', '#memLgin').focus();
            return ;
        }
    	 
    	//memLgin form 태그 안에 memPw 입력창의 값의 공백일 경우
    	if($('#memPw', '#memLgin').val() == '') {
    		
    		//다음과 같이 pError id 칸에 비밀번호를 입력해주세요 라는 텍스트를 보여준다
            $('#pError', '#memLgin').show().text('비밀번호를 입력해주세요.');
            
            //memLgin memPw 입력칸에 입력이 가게 한다.
    		$('#memPw', '#memLgin').focus();
            return ;
        }
    	//perror id의 칸을 숨긴다.
    	$('#pError', '#memLgin').hide();
    	//다 해당하지 않을 경우 memLgin라는 id 값을 가지는 form태그에 submit을 수행시킨다.
		$('#memLgin').submit();
    });


    // memId 라는 id를 가진 태그에 엔터키처리할 경우 실행된다.
     $('#memId').keydown(function(e) {
        if(e.keyCode == 13) {
        		//memLgin 태그 안에 있는 btnLgin id 값을 가지는 버튼을 클릭시킨다. 
        		$('#btnLgin', '#memLgin').click(); 
        	e.preventDefault();
        }
    });
    
    
  // memPw 라는 id를 가진 태그에 엔터키처리할 경우 실행된다.
    $('#memPw').keydown(function(e) {
        if(e.keyCode == 13) {
        		//memLgin 태그 안에 있는 btnLgin id 값을 가지는 버튼을 클릭시킨다. 
        		$('#btnLgin', '#memLgin').click(); 
        	e.preventDefault();
        }
    });
});
</script>
<!-- 로그인 창 -->
   <div class="pop_wrap"  > <h1 class="h1_type">로그인</h1>
        <div class="pop_content">
            <div class="tab_type01 two">
                    <h1 id="GENE" style="text-align: center;">현대백화점면세점 회원로그인</h1>
            </div>
            <!-- submit을 하게 되면 비밀번호 찾는 동작을 수행하는 DutyfreeServlet?command=login url로 이동 -->
                <form id="memLgin" name="memLgin" method="post" action="./DutyfreeServlet?command=login"  autocomplete="off">
                    <input type="hidden" name="aucaType" value="GENE" />
                    <input type="hidden" name="authType" value="GENE" /> <!-- 탭구분용 -->
                    <div class="join_form">
                        <div class="join_row">
                            <input type="text" id="memId" name="memId" <% if(saveId!=null){  %> value= "<%= saveId %>" <% } %> placeholder="아이디" onkeypress="javascript:noSpaceEvnt(event);" maxlength="20" autocomplete="off">
                        </div>
                        <div class="join_row placeholder_wrap">
                            <input type="password" id="memPw" name="memPw" placeholder="비밀번호" onkeypress="javascript:noSpaceEvnt(event);" maxlength="100" autocomplete="off">
                        </div>
                    </div>
                    <div class="dang_type">
                        <p class="d_txt" id="pError" style="display:none;"></p>
                    </div>
                    <div class="id_save">
                        <span class="checkbox small">
                            <input type="checkbox" name="saveId" id="saveId" value="Y">
                            <label for="saveId">아이디 저장</label>
                        </span>
                        <span class="find_idpw">
                        <!-- 아이디 찾기 페이지로 이동하는 DutyfreeServlet?command=FindId_Page url로 이동-->
                            <a href="/DutyfreeServlet?command=FindId_Page">아이디찾기</a>
                         <!-- 비밀번호 찾기 페이지로 이동하는 DutyfreeServlet?command=FindPw_Page url로 이동-->
                            <a href="/DutyfreeServlet?command=FindPw_Page">비밀번호찾기</a>
                        <!-- -->
                        </span>
                    </div>
                    <div class="btn_login"><button type="button" class="btn_basic2 big" id="btnLgin">로그인</button></div>
                </form>         
            </div>
            <div class="txt_btn tl">
            	<!--  회원가입 페이지로 이동하는 DutyfreeServlet?command=contract url로 이동--> 
                <p><a href="/DutyfreeServlet?command=contract" class="btn_basic1">회원가입</a>
                </p>
                <!-- 메인 페이지로 이동하는 DutyfreeServlet?command=index url로 이동--> 
                <div style="right: 20px;" >
                <p><a href="DutyfreeServlet?command=index" class="btn_basic1" style="right:130px;" >현대백화점 면세점 메인</a>
                </p> 
            </div>
            <!--  -->
            </div>
        </div>

</body>
</html>