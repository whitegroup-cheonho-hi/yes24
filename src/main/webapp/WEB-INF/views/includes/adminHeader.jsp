<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<header class="pc">
	<!--웹에서의 헤더-->
	<div id="lnb">
		<ul id="lnba" class="lnb">
			<li><p>관리자 페이지</p></li>
			<li class="login"><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
		</ul>
	</div>
	<div id="header">
		<h2>
			<a href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/assets/images/로고4.png" style="width: 95px"></a>
		</h2>
		<!-- 메뉴 (nav) -->
		<div style="position: relative;">
			<ul class="navigation">
				<li><a href="#none">공연관리</a></li>
				<li><a href="#none">회원관리</a></li>
				<li><a href="#none">티켓관리</a></li>
				<li><a href="#none">게시판관리</a></li>
				<li><a href="#none">통계관리</a></li>
			</ul>
			<ul class="drop_menu">
				<li>
					<a href="${pageContext.request.contextPath}/admin/getConcertHallList">공연장관리</a>
					<a href="${pageContext.request.contextPath}/show/showInsertForm">공연등록</a>
					<a href="${pageContext.request.contextPath}/admin/adminShowList">예정공연</a>
					<a href="${pageContext.request.contextPath}/admin/ticketingShowList">진행공연</a>
					<a href="${pageContext.request.contextPath}/admin/showEndList">종료공연</a>
				</li>
				<li>
					<a href="">전체회원</a>
					<a href="">신고회원</a>
					<a href="">정지회원</a>
					<a href="">탈퇴회원</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/getUserTicketingList">예매리스트</a>
					<a href="${pageContext.request.contextPath}/admin/getTransferList/A">양도리스트</a>
					<a href="${pageContext.request.contextPath}/admin/getTicketingList">예매현황</a>
				</li>
				<li>
					<a href="">Q&A 게시판</a>
					<a href="">리뷰 게시판</a>
				</li>
				<li>
					<a href="">통계1</a>
					<a href="">통계2</a>
				</li>
			</ul>
		</div>

		<!-- /메뉴 (nav) -->
	</div>
</header>