<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/user.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/myPage.css"
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
section {
	width: 1000px;
	margin: 0 auto;
	padding-top: 70px;
	height: 1000px;
}

#showHref {
	text-decoration: none;
}

#mypage_contain2 {
	height: 200px;
}
.yesIpt { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:left;vertical-align:middle;box-shadow:inset 0 1px 2px 0 #fafafa; }
.yesIpt { box-sizing:border-box;position:relative;padding:3px 8px 5px;width:auto;height:30px;line-height:20px;border:solid 1px #ebebeb;border-top-color:#d8d8d8;border-left-color:#d8d8d8;border-radius:3px;background-color:#fff; }
.yesIpt.yesIptCal { padding-left:0 !important;padding-right:25px !important; }
.yesIpt.yesIptCal input { text-align:center; }
.yesIpt label { position:absolute;left:8px;top:4px;height:20px;line-height:20px;color:#999;font-size:12px; }
.yesIpt .ipt_msg { position:absolute;right:8px;top:4px;height:20px;line-height:20px;color:#999;font-size:12px; } 
.yesIpt .ipt_cVal { position:absolute;right:5px;top:50%;margin-top:-16px; } 
.yesIpt.ipt_disabled { opacity:0.4;background:#f8f8f8; } /* 주석 */
.yesIpt.ipt_disabled label { color:#000; }
.yesIpt.ipt_readonly { background:rgba(248,248,248,0.4); }
.yesIpt.ipt_readonly label { color:#333; }
.yesIpt input { width:100%;height:20px;line-height:20px;overflow:hidden;border:none;border-color:transparent;font-size:12px;color:#333;-webkit-appearance:none;border-radius:0;outline-style:none;background-color:transparent;vertical-align:top; }
.yesIpt.s_size { padding:0 5px;width:auto;height:20px;line-height:18px; }
.yesIpt.s_size input { padding:0;height:17px;line-height:17px;font-size:12px; }
.yesIpt.s_size label { position:absolute;left:5px;top:1px;height:17px;line-height:17px;font-size:12px; }
.yesIpt.s_size .ipt_msg { right:5px;top:1px;height:17px;line-height:17px;font-size:12px; } 
.yesIpt.m_size { padding:4px 11px 6px;width:auto;height:40px;line-height:28px; }
.yesIpt.m_size input { padding:0;height:28px;line-height:27px;font-size:13px;font-weight:bold; }
.yesIpt.m_size label { position:absolute;left:11px;top:1px;height:35px;line-height:35px;font-size:13px; }
.yesIpt.m_size .ipt_msg { right:11px;top:1px;height:35px;line-height:35px;font-size:13px; }
.yesIpt.b_size { padding:9px 14px 11px;width:auto;height:50px;line-height:28px; }
.yesIpt.b_size.chkVal { padding-right:80px; }
.yesIpt.b_size input { padding:0;height:28px;line-height:27px;font-size:16px;font-weight:bold; }
.yesIpt.b_size label { position:absolute;left:14px;top:1px;height:45px;line-height:45px;font-size:16px; }
.yesIpt.b_size .ipt_msg { right:19px;top:1px;height:45px;line-height:45px;font-size:13px; }
.yesIpt.error { border:solid 1px #ff6666; }
.yesIpt.focusOn.focus_blue { border:solid 1px #6699cc; }
.yesIpt.w_40 { width:40px; }
.yesIpt.w_45 { width:45px; }
.yesIpt.w_50 { width:50px; }
.yesIpt.w_60 { width:60px; }
.yesIpt.w_70 { width:70px; }
.yesIpt.w_77 { width:77px; }
.yesIpt.w_80 { width:80px; }
.yesIpt.w_87 { width:87px; }
.yesIpt.w_90 { width:90px; }
.yesIpt.w_100 { width:100px; }
.yesIpt.w_110 { width:110px; }
.yesIpt.w_120 { width:120px; }
.yesIpt.w_130 { width:130px; }
.yesIpt.w_140 { width:140px; }
.yesIpt.w_150 { width:150px; }
.yesIpt.w_160 { width:160px; }
.yesIpt.w_170 { width:170px; }
.yesIpt.w_180 { width:170px; }
.yesIpt.w_190 { width:190px; }
.yesIpt.w_200 { width:200px; }
.yesIpt.w_210 { width:210px; }
.yesIpt.w_220 { width:220px; }
.yesIpt.ipt_wSizeF { display:block; }
.yesIptTxt { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:left;vertical-align:middle; }
.yesIptTxt { vertical-align:-2px; }
#top{margin-top: 45px;}
.yesFormDl dt,dd{ margin-bottom: 6px;}


/* btn */
.btnC { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:left;vertical-align:top; }
.btnC {/* margin:0 2px; */text-align:left;/* white-space:nowrap; *//* text-indent:0; */}
.btnC .bWrap { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:center;vertical-align:top; }
.btnC .bWrap { position:relative;padding:0 7px;height:28px;text-align:center;text-indent:0;border:solid 1px #ebebeb;border-bottom-color:#d8d8d8;border-right-color:#d8d8d8;border-radius:3px;background-color:#fff; }
.btnC .bWrap em.txt { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:center;vertical-align:top; }
.btnC .bWrap em.txt { position:relative;padding:0;overflow:hidden;line-height:27px;font-size:12px;color:#333 !important;font-weight:bold;text-indent:0;cursor:pointer; }
a.btnC:hover { text-decoration:none; }
button.btnC {margin:0;padding:0;border:0;-webkit-appearance:none;-webkit-text-size-adjust:none;border-radius:0;background-color:transparent;}
button.btnC:disabled { opacity:0.4; }
.btnC.btn_disabled { opacity:0.4; }
.btnC.btn_blue { }
.btnC.btn_blue .bWrap {height: 40px; border-color:#196ab3;border-bottom-color:#165fa1;border-right-color:#165fa1;background-color:#196ab3;     width: 130px;}
.btnC.btn_blue .bWrap em.txt {margin-top: 6px; font-size: 19px; color:#fff !important;     width: 130px;}
.btnC.b_size .bWrap { padding:0 19px;height:48px;text-align:center;     width: 340px; }
.btnC.b_size .bWrap em.txt {width: 226px; height:47px;line-height:47px;font-size:16px;font-weight:bold;letter-spacing:0; }
.btnC.b_size.btn_2ln .bWrap { padding:14px 19px;height:40px;text-align:center; }
.btnC.b_size.btn_2ln .bWrap em.txt { height:20px;line-height:20px;font-size:16px;font-weight:bold;letter-spacing:0; }
.btnC.b_size.btn_2ln .bWrap em.des { height:20px;line-height:20px;color:#999;font-size:12px;font-weight:normal;letter-spacing:0; }
button.btnC.b_size .bWrap { height:48px; }
.yesFormBtn .formBtn_btn { text-align: center;margin-top: 20px;}


/* radioBtn - 사각탭모양 라디오기능 */
/* 모바일웹의 common.css btnRadio_wrap 동일 */
.yesRadioTab { height: 27px; border:solid 1px #d8d8d8;border-radius:3px;background-color:#f8f8f8;   display: inline-block;   width: 124px; }
.yesRadioTab ul { display:table;width:100%;table-layout:fixed; }
.yesRadioTab li { display:table-cell;position:relative;z-index:1;height:28px;text-align:center; }
.yesRadioTab li a { display:block;position:relative;z-index:2;height:28px; }
.yesRadioTab li a em.txt { line-height:28px;color:#666;font-size:12px; }
.yesRadioTab li .yesRadio { position:absolute;opacity:0; }
.yesRadioTab li label { display:block;position:relative;z-index:2;height:28px; }
.yesRadioTab li label .yBlind { left:-999em;top:0; } /* 체크시 맨위로 올라가는 버그로 재정의 */
.yesRadioTab li label em.txt { line-height:28px;color:#666;font-size:12px; }
.yesRadioTab li .yesRadio:checked+label { background-color:#fff; }
.yesRadioTab li .yesRadio:checked+label:before { content:'';position:absolute;left:-1px;top:-1px;right:-1px;bottom:-1px;border:solid 1px #333; }
.yesRadioTab li .yesRadio:checked+label em.txt { color:#333; }
.yesRadioTab li:first-child .yesRadio:checked+label:before { border-top-left-radius:3px;border-bottom-left-radius:3px;   }
.yesRadioTab li:last-child .yesRadio:checked+label:before  { border-top-right-radius:3px;border-bottom-right-radius:3px; }
.yesRadioTab li a:hover { text-decoration:none; }
.yesRadioTab li a:hover em.txt { color:#333; }
.yesRadioTab li:after { content:'';position:absolute;right:0;top:0;bottom:0;z-index:1;border-right:solid 1px #d8d8d8; }
.yesRadioTab li:last-child:after { display:none; }
.yesRadioTab li.selected { z-index:2; }
.yesRadioTab li.selected:before { content:'';position:absolute;left:-1px;top:-1px;right:-1px;bottom:-1px;z-index:5;border:solid 1px #333; }
.yesRadioTab li:first-child.selected:before { border-top-left-radius:3px;border-bottom-left-radius:3px;   }
.yesRadioTab li:last-child.selected:before  { border-top-right-radius:3px;border-bottom-right-radius:3px; }
.yesRadioTab li.selected a { background-color:#fff; }
.yesRadioTab li.selected a em.txt { color:#333; }
.yesRadioTab li.selected a:hover em.txt { color:#333; }
.yesRadioTab li.selected label { background-color:#fff; }
.yesRadioTab li.selected label em.txt { color:#333; }
.yesRadioTab.col_2 li { width:62px; }
.yesRadioTab.col_3 li { width:33.3%; }
.yesRadioTab.col_3 li:liast-child { width:auto; }
.yesRadioTab.col_4 li { width:25%; }
.yesRadioTab.col_5 li { width:20%; }
.yesRadioTab.s_size li { height:18px; }
.yesRadioTab.s_size li a { height:18px; }
.yesRadioTab.s_size li a em.txt { line-height:18px;font-size:11px; }
.yesRadioTab.s_size li label { height:18px; }
.yesRadioTab.s_size li label em.txt { line-height:17px;font-size:11px; }
.yesRadioTab.m_size li { height:38px; }
.yesRadioTab.m_size li a { height:38px; }
.yesRadioTab.m_size li a em.txt { line-height:38px;font-size:13px;font-weight:bold; }
.yesRadioTab.m_size li label { height:38px; }
.yesRadioTab.m_size li label em.txt { line-height:37px;font-size:13px;font-weight:bold; }
.yesRadioTab.b_size li { height:48px; }
.yesRadioTab.b_size li a { height:48px; }
.yesRadioTab.b_size li a em.txt { line-height:48px;font-size:16px;font-weight:bold; }
.yesRadioTab.b_size li label { height:48px; background-color: #fcfcfc; border-left: solid 1px;  border-right: solid 1px #d8d8d8;}
.yesRadioTab.b_size li label em.txt { line-height:47px;font-size:16px;font-weight:bold; }
.yesRadioTab.tabInline { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:left;vertical-align:top; }

.colCell{display: inline-block;}
.colCell.pal10{text-align: right;}
.colCell w_130{}
#spanCertifyIpt_AddrNo{width: 347px; display: inline-block;}
#spanCertifyIpt_txtBirthDay{width: 600px; display: inline-block;}
#warp .date_list ul {    margin-left: 0px;};

</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
	<section>
		<div id="warp">
			<!-- container -->
			<div id="container">
				<!-- 본문 -->
				<div class="cont_section">
					<!-- aside -->
					<c:import url="/WEB-INF/views/includes/userNav.jsp"></c:import>
					<!-- //aside -->

					<div class="date_list bg">
						<br> <b class="subtitle">회원 정보 수정</b>
						<div id="top">
							<dl class="yesFormDl">
								<dt>
									<strong class="item_tit">아이디</strong>
								</dt>
								<dd>
									<div class="inpRow">
										<span id="spanCertifyIpt_txtMemId"
											class="yesIpt b_size ipt_wSizeF chkVal"> <input
											name="userSq" type="hidden" value="${user.userSq}"> <input
											name="userId" type="text" readonly value="${user.userId}">
										</span>
									</div>

								</dd>
								<dt>
									<strong class="item_tit">새비밀번호</strong>
								</dt>
								<dd>
									<div class="inpRow">
										<span id="spanCertifyIpt_txtMemPw"
											class="yesIpt b_size ipt_wSizeF chkVal"><input
											id="userPassword" name="userPassword" type="password"
											maxlength="20" required="required"
											value="${user.userPassword}"> </span>
									</div>

								</dd>
								<dt>
									<strong class="item_tit">새비밀번호 재입력</strong>
								</dt>
								<dd>
									<div class="inpRow">
										<span id="spanCertifyIpt_txtMemRePw"
											class="yesIpt b_size ipt_wSizeF chkVal"> <input
											id="userRePassword" name="userRePassword" type="password"
											required="required" maxlength="20"
											placeholder="확인을 위한 비밀번호 재입력">
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
											name="userName" type="text" required="required"
											value="${user.userName}">
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
													placeholder="ex)20230101" required="required"
													value="${user.userBirthday}" maxlength="8">
												</span>
											</div>											
											<div class="yesRadioTab col_2 b_size mgl10">
												<input id="gender" type="hidden" value="${user.gender}">
												<ul>
													<li><input value="M" name="gender" type="radio" id="M"
														class="yesRadio"><label for="rdoMemSexM"
														class="lnk_lab"><em class="txt">남</em></label></li>
	
													<li id="li2"><input value="F" name="gender" type="radio" id="F"
														class="yesRadio"><label for="rdoMemSexF"
														class="lnk_lab"><em class="txt">여</em></label></li>
												</ul>
											</div>											
										</div>
									</div>
								</dd>
								<dt>
									<strong class="item_tit">전화 번호</strong>
								</dt>
								<dd>
									<div class="inpRow">
										<span id="spanCertifyIpt_txtTelNo"
											class="yesIpt b_size ipt_wSizeF labelHide ipt_readonly">
											<input name="userPhone" type="text" required="required"
											value="${user.userPhone}" maxlength="11">
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
											required="required" value="${user.userEmail}">
										</span>
									</div>
								</dd>
							</dl>
							<br>
							<dl class="yesFormDl">
								<dt>
									<strong class="item_tit">주소(선택)</strong>
								</dt>
								<dd>
									<div class="inpRow cols">
										<div class="colGrp">
											<div class="colCell w_280">
												<span id="spanCertifyIpt_AddrNo"
													class="yesIpt b_size ipt_wSizeF"> <input id="addr1"
													name="userPost" size="5" type="text" autocomplete="off"
													readonly="readonly" value="${user.userPost}">
												</span>									
												<a id="aSelectPostalCode" href="javascript:void(0);"
													class="btnC b_size w_90"><span class="bWrap"><em
														class="txt">주소찾기</em></span></a>
											</div>
										</div>
									</div>
									<br>
									<div class="inpRow">
										<span id="spanCertifyIpt_Addr1"
											class="yesIpt b_size ipt_wSizeF"> <input id="addr2"
											name="userBasicAddr" type="text"
											value="${user.userBasicAddr}" readonly="readonly">
										</span>
									</div>
									<br>	
									<div class="inpRow">
										<span id="spanCertifyIpt_Addr2"
											class="yesIpt b_size ipt_wSizeF"> <input id="addr3"
											name="userDetailAddr" type="text"
											value="${user.userDetailAddr}">
										</span>
									</div>
								</dd>
							</dl>


							<div class="yesFormBtn">
								<div class="formBtn_btn">
									<button type="submit" class="btnC xb_size btn_blue">
										<span class="bWrap"><em class="txt">회원정보 수정</em></span>
									</button>
									<a href="#none" id="deleteUser" class="btnC xb_size btn_blue">
										<span class="bWrap"><em class="txt">탈퇴</em></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //본문 -->
			</div>
			<!--//container -->
		</div>
	</section>
	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->

</body>

<script>
	$(document).ready(function() {
		
		//성별 체크
		let gender = $("#gender").val();
		let M = $("#M");
		let F = $("#F");
		
		if (gender === "M") {
			M.attr("checked", true);
		} else if (gender === "F") {
			F.attr("checked", true);
		}
		
		//회원탈퇴
		$("#deleteUser").on("click",function(e){
		
			var result = confirm('정말 탈퇴 하시겠습니까?');

	        if(result) {
	           //yes
	            location.replace("${pageContext.request.contextPath }/user/delete/${user.userSq}");
	        } else {
	            //no
	        }
		});
		
		//비밀번호 재확인
		$("#userRePassword").on("change",function(){
			
			let pwd =$("#userPassword").val();
			let repwd=$("#userRePassword").val();
			
			if(pwd!=repwd){
				alert("처음 입력하신 비밀번호와 다릅니다. 다시입력해주세요");
			}
			
		});
		
		//우편번호
		$("#aSelectPostalCode").on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {
				console.log(data);
		 		$("#addr1").val(data.zonecode);
		 		$("#addr2").val(data.address);				
				}
			}).open();
		});

	});
</script>
</html>