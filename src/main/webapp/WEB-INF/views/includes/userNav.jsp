<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="lnb">
	<div class="mypage">
		<h2>
			<a href="/Pages/MyPage/MyPageMain.aspx" title="MY공연"> <img
				src="http://tkfile.yes24.com/img/mypage/lnb_mypage.gif" alt="MY공연"></a>
		</h2>
		<div class="infor">
			<span class="grade"><em>${user.userName}</em>님은 <em>일반회원</em>입니다.
			</span>
			<br>
			<div class="btn">
				<div class="tc">
					<a href="${pageContext.request.contextPath}/user/modifyForm"
						title="회원정보수정"> <img
						src="http://tkfile.yes24.com/img/mypage/btn_mcorrent.gif"
						alt="회원정보수정">
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="my_lmenu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/myPage/1"> <img
					src="http://tkfile.yes24.com/img/mypage/lmenu_01.gif" alt="예매확인/취소">
			</a></li>
			<li><a href="${pageContext.request.contextPath}/user/myPage/2"> <img
					src="http://tkfile.yes24.com/img/mypage/lmenu_04.gif" alt="나의관람공연"></a></li>
			<li><a href="${pageContext.request.contextPath}/user/myPage/3"> <img
					src="http://tkfile.yes24.com/img/mypage/lmenu_05.gif" alt="나의맞춤설정"></a></li>
		</ul>
	</div>
	<div>
		<div class="customerCenter">
			<p class="title">
				<strong>고객센터 전화상담</strong>
			</p>
			<div class="telNum">
				<span> <img
					src="http://tkfile.yes24.com/img/guide/txt_telnum.gif" alt=""></span>
				<ul>
					<li>평일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;09:00 ~ 18:00</li>
					<li>토요일&nbsp;&nbsp;&nbsp;09:00 ~ 17:00</li>
					<li>일요일 공휴일 휴무</li>
				</ul>
			</div>
		</div>

	</div>
</div>
<!-- //LeftMenu -->
