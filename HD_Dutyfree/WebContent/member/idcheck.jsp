<!-- 김나형 생성 -->
<!-- 아이디 중복 여부 확인 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<style type="text/css">
body {
	background-color: white;
	font-family: Noto Sans CJK KR;
}

#wrap {
	top: 20px;
	margin: 0 20px;
}

h1 {
	font-family: "Noto Sans CJK KR", Times, serif;
	font-size: 28px;
	color: black;
	font-weight: normal;
	margin-top : 10px;
	margin-bottom : 30px;
}
input[type=text]{
	margin-left: 30px;
}
input[type=button], input[type=submit] {
	float: right;
}
form{
	font-size : 17px;
	color : grey;
}
#btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 5px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    background-color: aliceblue;
    color: #1e6b7b;
}
#btn:hover {
    letter-spacing: 1px;
    transform: scale(1.1);
    cursor: pointer;
}
</style>
<script type="text/javascript">
	// id값이 중복되었는지 확인하는 function
	function idok() {
		opener.formm.id.value = "${id}";
		opener.formm.reid.value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap">
		<h1>ID 중복확인</h1>
		<form method=post name=formm style="margin-right: 0" action="DutyfreeServlet?command=id_check_form">
			User ID <input type=text name="id" value="">
			<input type=submit value="검색" class="submit">
			<br>
			<div style="margin-top: 20px">
				<%-- 이미 사용중인 아이디일 경우 --%>
				<c:if test="${message == 1}">
					<script type="text/javascript">
						opener.document.formm.id.value = "";
					</script>
 					${id}는 이미 사용중인 아이디입니다.
				</c:if>
				<%-- 사용가능한 아이디일 경우 --%>
				<c:if test="${message==-1}">
 					${id}는 사용 가능한 ID입니다.
 					<input type="button" value="사용" class="cancel" onclick="idok()">
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>