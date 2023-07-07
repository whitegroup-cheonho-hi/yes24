<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/joinForm.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403"
	media="all">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#joinForm {
	margin-top: 60px;
}

.inpRow .yesIpt input {
	font-weight: initial;
}

.yesIpt.ipt_readonly {
	background-color: #fff;
}

</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section id="joinForm">
		<div id="ySContent">
			<form  name="MemberRegister" method="post" action="${pageContext.request.contextPath }/user/join"
				id="MemberRegister">
				<div class="ySContRow w_600">				
					<div class="tm_grp">
						<h2 class="tmM_txt">
							<em class="tit_txt"><strong>회원가입</strong></em>
						</h2>
					</div>
					<!-- (((((((((((((((((((( 기본정보 영역 시작 )))))))))))))))))))) -->

					<dl class="yesFormDl">
						<dt>
							<strong class="item_tit">아이디</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemId"
									class="yesIpt b_size ipt_wSizeF chkVal"> <input
									id="txtMemId" name="userId" type="text" required="required"
									placeholder="4~15자리 영소문자, 숫자">
								</span>
							</div>

						</dd>
						<dt>
							<strong class="item_tit">비밀번호</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemPw"
									class="yesIpt b_size ipt_wSizeF chkVal"><input
									id="txtMemPw" name="userPassword" type="password" maxlength="20" required="required"
									placeholder="8~20자리 영문 대/소문자, 숫자, 특수문자 조합"> </span>
							</div>

						</dd>
						<dt>
							<strong class="item_tit">비밀번호 재입력</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemRePw"
									class="yesIpt b_size ipt_wSizeF chkVal"> <input
									id="txtMemRePw" name="txtMemRePw" type="password" required="required"
									maxlength="20" placeholder="확인을 위한 비밀번호 재입력">
								</span>
							</div>

						</dd>
					</dl>
					<dl class="yesFormDl">
						<dt>
							<strong class="item_tit">이름</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemNm"
									class="yesIpt b_size ipt_wSizeF ipt_readonly"> <input
									name="userName" type="text" required="required">
								</span>
							</div>
						</dd>
						<dt>
							<strong class="item_tit">생년월일</strong>
						</dt>
						<dd>
							<div class="inpRow cols">
								<div class="colGrp">
									<div class="colCell">
										<span id="spanCertifyIpt_txtBirthDay"
											class="yesIpt b_size ipt_wSizeF labelHide ipt_readonly">
											<input name="userBirthday" type="text"
											placeholder="ex)20230101" required="required" maxlength="8">
										</span>
									</div>
									<div class="colCell w_130">
										<div class="yesRadioTab col_2 b_size mgl10">
											<ul>
												<li><input value="M" name="gender" type="radio"
													id="rdoMemSexM" class="yesRadio" checked="checked"><label
													for="rdoMemSexM" class="lnk_lab"><em class="txt">남</em></label></li>
												<li><input value="F" name="gender" type="radio"
													id="rdoMemSexF" class="yesRadio"><label
													for="rdoMemSexF" class="lnk_lab"><em class="txt">여</em></label></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</dd>
						<dt>
							<strong class="item_tit">필수 전화번호</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtTelNo"
									class="yesIpt b_size ipt_wSizeF labelHide ipt_readonly">
									<input name="userPhone" type="text" placeholder="'-' 없이 숫자만 입력" required="required" maxlength="11">
								</span>
							</div>
						</dd>
						<dt>
							<strong class="item_tit">이메일</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemMail"
									class="yesIpt b_size ipt_wSizeF "> <input
									name="userEmail" type="text" maxlength="50"
									placeholder="이메일 주소 입력" required="required">
								</span>
							</div>
						</dd>
					</dl>
					<dl class="yesFormDl">
						<dt>
							<strong class="item_tit">주소(선택)</strong>
						</dt>
						<dd>
							<div class="inpRow cols">
								<div class="colGrp">
									<div class="colCell w_280">
										<span id="spanCertifyIpt_AddrNo"
											class="yesIpt b_size ipt_wSizeF"> <input id="Zip5"
											name="Zip5" size="5" type="text" autocomplete="off"
											readonly="readonly" placeholder="우편번호" >
										</span>
									</div>
									<div class="colCell pal10">
										<a id="aSelectPostalCode" href="javascript:void(0);"
											class="btnC b_size w_90"><span class="bWrap"><em
												class="txt">주소찾기</em></span></a>
									</div>
								</div>
							</div>
							<div class="inpRow">
								<span id="spanCertifyIpt_Addr1" class="yesIpt b_size ipt_wSizeF">
									<input name="ST_ADDR_TEXT" type="text" placeholder="도로명 주소"
									readonly="readonly">
								</span>
							</div>
							<div class="inpRow">
								<span id="spanCertifyIpt_Addr2" class="yesIpt b_size ipt_wSizeF">
									 <input
									name="OLD_ADDR_TEXT" type="text" placeholder="지번 주소"
									readonly="readonly">
								</span>
							</div>
						</dd>
					</dl>


					<div class="yesFormBtn">
						<div class="formBtn_btn">
							<button type="submit" id="aBtnRegMember" href="javascript:void(0);"
								class="btnC xb_size btn_blue btn_wSizeF"><span class="bWrap"><em
									class="txt">회원 가입</em></span></button>
						</div>
					</div>
				</div>
			</form>
			<div id="wrapperContent"></div>
		</div>
	</section>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>

<script>

</script>
</html>