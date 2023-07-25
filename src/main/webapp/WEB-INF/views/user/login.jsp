<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/login.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#memLoginForm input {
	color: black;
}

#memLoginForm .blind {
	margin-bottom: 10px;
}

.section {
	width: 450px;
	height: 300px;
	margin: 200px auto;
}

#memLoginForm input input {
	font-weight: initial;
}

#fail {
	color: red;
	font-size: 12px;
}

#join a span{background-color: #f8f8f8;;}
.section2 {	padding-top: 0px;}
#header #nav {margin-right: 16px;}
</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section class="section section2">
		<div class="sectiondiv">
			<div class="loginCont">
				<!-- ############### 탭 영역 시작 ############### -->
				<div id="divTabMemberArea" class="yesTab_nor yesTab_blue tab_2col">
					<ul id="ulTabMember">
						<li id="liTabMember" class="on firstCol"><a
							href="#none"
							><span class="txt">회원</span></a></li>
					</ul>
				</div>
				<!-- ############### 탭 영역 끝 ############### -->
				<!-- ############### 로그인 폼 : 회원 영역 시작 ############### -->
				<div id="memLoginForm" class="loginFormGrp">
					<form action="${pageContext.request.contextPath }/user/login"
						method="post" name="LoginSub" autocomplete="off">
						<fieldset class="loginForm">
							<legend class="blind">회원 로그인</legend>
							<c:if test="${!empty message}">
								<span id="fail">${message}</span>
							</c:if>
							<span id="spanMemID" class="yesIpt b_size ipt_wSizeF focus_blue">
								<input name="userId" type="text" required="required"
								placeholder="아이디" />
							</span> <span id="spanMemPW"
								class="yesIpt b_size ipt_wSizeF focus_blue mgt10"> <input
								name="userPassword" type="password" required="required"
								placeholder="비밀번호" />
							</span>
							<button type="submit" id="btnLogin" title="로그인"
								class="btn_login btnC xb_size btn_blue">
								<span class="bWrap"><em class="txt">로그인</em></span>
							</button>
							<div id="join">
								<a href="${pageContext.request.contextPath }/user/joinForm"
									class="btn_login btnC xb_size"> <span class="bWrap"><em
										class="txt">회원가입</em></span>
								</a>
							</div>
						</fieldset>
					</form>

					<!-- ##### 로그아웃 관련 안내 끝 ##### -->
				</div>
			</div>
			<!-- ############################## 로그인 관련 영역 끝 ############################## -->
		</div>
	</section>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>
<script>
	$("#userId").on("click", function() {
		$(".userId").text("");
	});

	$("#userPassword").on("keyup", function() {
		$(".userPassword").text("");
	});
</script>
</html>