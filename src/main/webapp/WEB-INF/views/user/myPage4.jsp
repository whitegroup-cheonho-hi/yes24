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
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap"
	rel="stylesheet">
<!-- 제이쿼리 최신버전 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 우편번호 라이브러리 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
section {
	width: 1000px;
	margin: 0 auto;
	padding-top: 70px;
}

#showHref {
	text-decoration: none;
}

#mypage_contain2 {
	height: 200px;
}
/* input */
.mypage_contain .yesIpt { display:-moz-inline-stack;display:inline-block;zoom:1;*display:inline;text-align:left;vertical-align:middle;box-shadow:inset 0 1px 2px 0 #fafafa; }
.mypage_contain .yesIpt { box-sizing:border-box;position:relative;padding:3px 8px 5px;width:auto;height:30px;line-height:20px;border:solid 1px #ebebeb;border-top-color:#d8d8d8;border-left-color:#d8d8d8;border-radius:3px;background-color:#fff; }
.mypage_contain .yesIpt.yesIptCal { padding-left:0 !important;padding-right:25px !important; }
.mypage_contain .yesIpt.yesIptCal input { text-align:center; }
.mypage_contain .yesIpt label { position:absolute;left:8px;top:4px;height:20px;line-height:20px;color:#999;font-size:12px; }
.mypage_contain .yesIpt .lnk_del .bgYUI { width:9px;height:9px;background-position:-260px -240px; } 
.mypage_contain .yesIpt .ipt_msg { position:absolute;right:8px;top:4px;height:20px;line-height:20px;color:#999;font-size:12px; } 
.mypage_contain .yesIpt .ipt_cVal { position:absolute;right:5px;top:50%;margin-top:-16px; } 
.mypage_contain .yesIpt.ipt_disabled { opacity:0.4;background:#f8f8f8; } /* 주석 */
.mypage_contain .yesIpt input { width:100%;height:20px;line-height:20px;overflow:hidden;border:none;border-color:transparent;font-size:12px;color:#333;-webkit-appearance:none;border-radius:0;outline-style:none;background-color:transparent;vertical-align:top; }
.mypage_contain .yesIpt.s_size { padding:0 5px;width:auto;height:20px;line-height:18px; }
.mypage_contain .yesIpt.s_size input { padding:0;height:17px;line-height:17px;font-size:12px; }
.mypage_contain .yesIpt.s_size label { position:absolute;left:5px;top:1px;height:17px;line-height:17px;font-size:12px; }
.mypage_contain .yesIpt.s_size .ipt_msg { right:5px;top:1px;height:17px;line-height:17px;font-size:12px; } 
.mypage_contain .yesIpt.m_size { padding:4px 11px 6px;width:auto;height:40px;line-height:28px; }
.mypage_contain .yesIpt.m_size input { padding:0;height:28px;line-height:27px;font-size:13px;font-weight:bold; }
.mypage_contain .yesIpt.m_size label { position:absolute;left:11px;top:1px;height:35px;line-height:35px;font-size:13px; }
.mypage_contain .yesIpt.m_size .ipt_msg { right:11px;top:1px;height:35px;line-height:35px;font-size:13px; }
.mypage_contain .yesIpt.b_size { padding:9px 14px 11px;width:320px;height:50px;line-height:28px; }
.mypage_contain .yesIpt.b_size.chkVal { padding-right:80px; }
.mypage_contain .yesIpt.b_size input { padding:0;height:28px;line-height:27px;font-size:16px;font-weight:bold; }
.mypage_contain .yesIpt.b_size label { position:absolute;left:14px;top:1px;height:45px;line-height:45px;font-size:16px; }
.mypage_contain .yesIpt.b_size .ipt_msg { right:19px;top:1px;height:45px;line-height:45px;font-size:13px; }

.mypage_contain .yesIpt.w_40 { width:40px; }
.mypage_contain .yesIpt.w_45 { width:45px; }
.mypage_contain .yesIpt.w_50 { width:50px; }
.mypage_contain .yesIpt.w_60 { width:60px; }
.mypage_contain .yesIpt.w_70 { width:70px; }
.mypage_contain .yesIpt.w_77 { width:77px; }
.mypage_contain .yesIpt.w_80 { width:80px; }
.mypage_contain .yesIpt.w_87 { width:87px; }
.mypage_contain .yesIpt.w_90 { width:90px; }
.mypage_contain .yesIpt.w_100 { width:100px; }
.mypage_contain .yesIpt.w_110 { width:110px; }
.mypage_contain .yesIpt.w_120 { width:120px; }
.mypage_contain .yesIpt.w_130 { width:130px; }
.mypage_contain .yesIpt.w_140 { width:140px; }
.mypage_contain .yesIpt.w_150 { width:150px; }
.mypage_contain .yesIpt.w_160 { width:160px; }
.mypage_contain .yesIpt.w_170 { width:170px; }
.mypage_contain .yesIpt.w_180 { width:170px; }
.mypage_contain .yesIpt.w_190 { width:190px; }
.mypage_contain .yesIpt.w_200 { width:200px; }
.mypage_contain .yesIpt.w_210 { width:210px; }
.mypage_contain .yesIpt.w_220 { width:220px; }



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
						<br> <b class="subtitle">회원정보 수정</b>
					</div>

					<div class="mypage_contain">
					
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
										<div class="colCell w_130">
											<div class="yesRadioTab col_2 b_size mgl10">
												<input id="gender" type="hidden" value="${user.gender}">
												<ul>
													<li><input value="M" name="gender" type="radio" id="M"
														class="yesRadio"><label for="rdoMemSexM"
														class="lnk_lab"><em class="txt">남</em></label></li>

													<li><input value="F" name="gender" type="radio" id="F"
														class="yesRadio"><label for="rdoMemSexF"
														class="lnk_lab"><em class="txt">여</em></label></li>
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
										</div>
										<div class="colCell pal10">
											<a id="aSelectPostalCode" href="javascript:void(0);"
												class="btnC b_size w_90"><span class="bWrap"><em
													class="txt">주소찾기</em></span></a>
										</div>
									</div>
								</div>
								<div class="inpRow">
									<span id="spanCertifyIpt_Addr1"
										class="yesIpt b_size ipt_wSizeF"> <input id="addr2"
										name="userBasicAddr" type="text" value="${user.userBasicAddr}"
										readonly="readonly">
									</span>
								</div>
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