<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/joinForm.css" type="text/css">    
	<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">
	<!-- 구글폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
	<!-- 제이쿼리 최신버전 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="slick.js" type="text/javascript" charset="utf-8"></script>


<style>
	/* 공통 */
		*{font-family: 'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;}
		.en{font-family: 'Comfortaa', cursive;}
		.clear::after{content: ''; clear: both; display: block;}
		section{width: 1000px; margin: 0 auto; padding-top: 70px;}
		section > h2{text-transform: uppercase; text-align: center; font-weight: 700; font-size: 35px; margin-bottom: 30px;}
		
		/* header */
		header.pc{width: 100%; height: 110px; border-bottom: 1px solid #858585; position: fixed; top: 0; left: 0; background: #fff; z-index: 99;}
		header.pc #lnb{width: 100%; height: 35px; border-bottom: 1px solid #e5e7eb; box-sizing: border-box;  background-color: #000;}
		header.pc #lnb #lnba a{color: #999;}
		header.pc #lnb .lnb{width: 90%; height: 100%; margin: 0 auto; display: flex; justify-content:flex-end; align-items: center;}
		header.pc #lnb .lnb li{margin-left: 29px; position: relative;}
		header.pc #lnb .lnb li a{font-size: 12px;}
		
		header.pc #header{height: 75px; width: 90%; margin: 0 auto; display: flex; align-items: center; justify-content:space-between;}
		header.pc #header h1{width: 145px; height: 54px; background: url('../images/logo.png') 0 0/contain no-repeat;}
		header.pc #header h1 a{font-size: 0; display: block; height: 100%;}
		header.pc #header #nav{display: flex; align-items: center;}
		header.pc #header #nav li{margin-left: 80px;}
		header.pc #header #nav li:first-of-type{margin-left: 0px;}
		header.pc #header #nav li a{font-weight: 600; font-size: 18px;}
		
		/* nav */
		
		nav #nav{width: 1250px; height: 100%; margin: 0 auto; display: flex; justify-content:flex-start; align-items: center; flex-wrap: nowrap;}
		nav #nav nl{magin-left : 200px}
		nav #nav li {margin-right: 25px;}
		nav #nav li a{font-size: 16px; font-weight: 500;}
		.trans{margin-left: -15px;}
		
		#header input{width: 250px; border:none; border-bottom: 2px solid #000; color: #333; margin-left: 250px;}
		
		.on a{color: #4982cf;}
		
		/* footer */
		footer{margin-top: 100px; background: #fff; border-top: 1px solid #e5e7eb;}
		footer #footer{width: 1200px; margin: 0 auto; padding: 50px 0;}
		footer #footer > div{float: left; }
		footer #footer .logo img{width: 200px; margin-right: -30px;}
		footer #footer .customer{margin-left: 100px;}
		footer #footer .address{float: right;}
		footer #footer h4{font-size: 16px; font-weight: 600; margin-bottom: 10px;}
		footer #footer p{font-size: 13px; line-height: 1.3;}
		footer #footer .tel{font-size: 16px; font-weight: 600;}
		
		
		/* footer */
		footer{margin-top: 100px; background: #fff; border-top: 1px solid #e5e7eb;}
		footer #footer{width: 1000px; margin: 0 auto; padding: 50px 0;}
		footer #footer > div{float: left; }
		footer #footer .customer{margin-left: 100px;}
		footer #footer .address{float: right;}
		footer #footer h4{font-size: 16px; font-weight: 600; margin-bottom: 10px;}
		footer #footer p{font-size: 13px; line-height: 1.3;}
		footer #footer .tel{font-size: 16px; font-weight: 600;}
		footer #footer span{margin-left: 100px;}
					
		.yesIpt.ipt_readonly{background-color: #fff;}
		
</style>
</head>
<body>
	<!-- 헤더 -->
	<header class="pc">
		<!--웹에서의 헤더-->
		<div id="lnb">
			<ul id="lnba" class="lnb">
				<li class="login"><a href="#none">로그인</a></li>
				<li class="search"><a href="#none">검색</a></li>
				<li class="notice"><a href="#none">커뮤니티</a></li>
			</ul>
		</div>
		<div id="header">
			<h1>
				<a href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath }/assets/images/로고.png"></a>
			</h1>
			<!-- 메뉴 (nav) -->
	
			<ul id="nav">
				<li class="on"><a href="">뮤지컬</a></li>
				<li><a href="">콘서트</a></li>
				<li><a href="">연극</a></li>
				<li><a href="">클래식</a></li>
				<li><a href="">양도티켓</a></li>
				<li><a href="">리뷰</a></li>				
				<input type="text" id="searchWord" autocomplete="off">
				<a href="#" onclick="jsf_mm_Search();"><img src="http://tkfile.yes24.com/imgNew/common/pf-srch.png"
						alt="" class="trans"><img src="http://tkfile.yes24.com/imgNew/common/pf-srch-w.png" alt=""
						class="fixed"></a>
			</ul>
						
			<!-- /메뉴 (nav) -->
		</div>
	</header>

	<section>
		<div id="ySContent">
			<form name="MemberRegister" method="post" action="?ActionType=INS"
				id="MemberRegister">
				<div class="ySContRow w_600">
					<!-- ==================== 정보 입력 영역 시작 ==================== -->
					<div class="tm_grp">
						<h3 class="tmM_txt">
							<em class="tit_txt"><strong>정보를 입력해 주세요.</strong></em>
						</h3>
					</div>
					<!-- (((((((((((((((((((( 기본정보 영역 시작 )))))))))))))))))))) -->

					<dl class="yesFormDl">
						<dt>
							<strong class="item_tit">아이디</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemId"
									class="yesIpt b_size ipt_wSizeF chkVal"> <label
									for="txtMemId">4~15자리 영소문자, 숫자 </label> <input id="txtMemId"
									name="txtMemId" type="text"> <span
									id="spanMemberIdCheck" class="ipt_cVal chk bgMem">아이디
										유효성 체크</span>
								</span>
							</div>

						</dd>
						<dt>
							<strong class="item_tit">비밀번호</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemPw"
									class="yesIpt b_size ipt_wSizeF chkVal"> <label
									for="txtMemPw">8~20자리 영문 대/소문자, 숫자, 특수문자 조합</label> <input
									id="txtMemPw" name="txtMemPw" type="password" maxlength="20">
									<span id="spanPasswordSafety" class="ipt_cVal chkPw bgMem">비밀번호
										안전도 체크</span>
								</span>
							</div>

						</dd>
						<dt>
							<strong class="item_tit">비밀번호 재입력</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemRePw"
									class="yesIpt b_size ipt_wSizeF chkVal"> <label
									for="txtMemRePw">확인을 위한 비밀번호 재입력 </label> <input
									id="txtMemRePw" name="txtMemRePw" type="password"
									maxlength="20"> <span id="spanPasswordConfirm"
									class="ipt_cVal chkPwRe bgMem">비밀번호 재입력 체크</span>
								</span>
							</div>

						</dd>
					</dl>
					<!-- (((((((((((((((((((( 기본정보 영역 끝 )))))))))))))))))))) -->

					<!-- (((((((((((((((((((( 추가정보 영역 시작 )))))))))))))))))))) -->
					<dl class="yesFormDl">
						<dt>
							<strong class="item_tit">이름</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemNm"
									class="yesIpt b_size ipt_wSizeF ipt_readonly"> <input
									name="txtMemNm" type="text" id="txtMemNm" autocomplete="off"
									onkeydown="removeErrorText(this.id);" value="">
								</span>
							</div>
							<p id="pYesFormErrTxt_txtMemNm" class="yesFormTxt error"
								style="display: none;"></p>
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
											<label for="txtBirthDay"></label> <input name="txtBirthDay"
											type="text" id="txtBirthDay" autocomplete="off"
											onkeydown="removeErrorText(this.id);" value="">
										</span>
									</div>
									<div class="colCell w_130">
										<div class="yesRadioTab col_2 b_size mgl10">
											<ul>
												<li><input value="M" name="rdoMemSex" type="radio"
													id="rdoMemSexM" class="yesRadio" checked="checked"><label
													for="rdoMemSexM" class="lnk_lab"><em class="txt">남</em></label></li>
												<li><input value="Y" name="rdoMemSex" type="radio"
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
									<label for="txtTelNo">'-' 없이 숫자만 입력</label> <input
									name="txtTelNo" type="text" id="txtTelNo" autocomplete="off"
									onkeydown="removeErrorText(this.id);" value="">
								</span>
							</div>
							<p id="pYesFormErrTxt_txtTelNo" class="yesFormTxt error"
								style="display: none;"></p>
						</dd>
						<dt>
							<strong class="item_tit">이메일</strong>
						</dt>
						<dd>
							<div class="inpRow">
								<span id="spanCertifyIpt_txtMemMail"
									class="yesIpt b_size ipt_wSizeF "> <label
									for="txtMemMail">이메일 주소 입력</label> <input name="txtMemMail"
									type="text" id="txtMemMail" autocomplete="off" maxlength="50"
									onkeydown="removeErrorText(this.id);">
								</span>
							</div>
							<p id="pYesFormErrTxt_txtMemMail" class="yesFormTxt error"
								style="display: none;"></p>
						</dd>
					</dl>
					<!-- (((((((((((((((((((( 추가정보 영역 끝 )))))))))))))))))))) -->
					<!-- (((((((((((((((((((( 주소정보 영역 시작 )))))))))))))))))))) -->
					<dl class="yesFormDl">
						<dt>
							<strong class="item_tit">주소(선택)</strong> <span class="item_des">주소입력
								시, 정확한 배송예정일을 안내받을 수 있습니다. </span>
						</dt>
						<dd>
							<div class="inpRow cols">
								<div class="colGrp">
									<div class="colCell w_280">
										<span id="spanCertifyIpt_AddrNo"
											class="yesIpt b_size ipt_wSizeF"> <label for="Zip5">우편번호</label>
											<input id="Zip5" name="Zip5" size="5" type="text"
											autocomplete="off" readonly="readonly"
											onkeydown="removeErrorText('AddrNo');">
										</span>
									</div>
									<div class="colCell pal10">
										<a id="aSelectPostalCode" href="javascript:void(0);"
											class="btnC b_size w_90"><span class="bWrap"><em
												class="txt">주소찾기</em></span></a>
									</div>
								</div>
							</div>
							<p id="pYesFormErrTxt_AddrNo" class="yesFormTxt error"
								style="display: none;"></p>
							<div class="inpRow">
								<span id="spanCertifyIpt_Addr1" class="yesIpt b_size ipt_wSizeF">
									<label for="ST_ADDR_TEXT">도로명 주소</label> <input
									id="ST_ADDR_TEXT" name="ST_ADDR_TEXT" type="text"
									autocomplete="off" onkeydown="removeErrorText('Addr1');"
									readonly="readonly">
								</span>
							</div>
							<p id="pYesFormErrTxt_Addr1" class="yesFormTxt error"
								style="display: none;"></p>
							<div class="inpRow">
								<span id="spanCertifyIpt_Addr2" class="yesIpt b_size ipt_wSizeF">
									<label for="OLD_ADDR_TEXT">지번 주소</label> <input
									id="OLD_ADDR_TEXT" name="OLD_ADDR_TEXT" type="text"
									autocomplete="off" onkeydown="removeErrorText('Addr2');"
									readonly="readonly">
								</span>
							</div>
							<p id="pYesFormErrTxt_Addr2" class="yesFormTxt error"
								style="display: none;"></p>
						</dd>
					</dl>
					<!-- (((((((((((((((((((( 주소정보 영역 끝 )))))))))))))))))))) -->

					<div class="yesFormBtn">
						<div class="formBtn_btn">
							<a id="aBtnRegMember" href="javascript:void(0);"
								onclick="validRegMember();"
								class="btnC xb_size btn_blue btn_wSizeF"><span class="bWrap"><em
									class="txt">회원 가입</em></span></a>
						</div>
					</div>
					<!-- ==================== 정보 입력 영역 끝 ==================== -->
				</div>
			</form>

			<div id="wrapperContent"></div>
		</div>
	</section>

	<!-- 푸터 -->
	<footer>
		<div id="footer" class="clear">
			<div class="logo">
				<img src="${pageContext.request.contextPath }/assets/images/풋터2.png">
			</div>
			<div class="customer">
				<h4>예스이십사㈜</h4>
				<p class="time">
					서울시 영등포구 은행로 11, 5층~6층(여의도동,일신빌딩)<br> 대표 김석환, 최세라 | 개인정보보호책임자
					: 권민석 yes24help@yes24.com<br> 사업자등록번호 229-81-37000 | 통신판매업신고 제
					2005-02682호 사업자 정보확인<br> 호스팅 서비스사업자 : 예스이십사㈜
				</p>
				<p></p>
			</div>
			<div class="address">
				<p>
					서비스가입사실확인<br> 고객님은 안전거래를 위한 현금 등으로 결제 시<br> 저희 쇼핑몰에서 가입한
					구매안전서비스를<br> 이용하실 수 있습니다.
				</p>
			</div>
			<div>
				<span> Copyright © YES24 Corp. All Rights Reserved. </span>
			</div>
		</div>
	</footer>
	<!-- /푸터 -->

</body>
</html>