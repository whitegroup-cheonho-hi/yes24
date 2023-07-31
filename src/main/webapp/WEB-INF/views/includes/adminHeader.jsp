<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<header class="pc">
	<!--웹에서의 헤더-->
	<div id="lnb">
		<ul id="lnba" class="lnb">
			<p>관리자 페이지</p>
			<!-- 관리자로그인시
				관리자 페이지 / 로그아웃->메인페이지 -->
			<li class="login"><a href="#none">로그아웃</a></li>
			<!-- <li class="search"><a href="#none">검색</a></li>
				<li class="notice"><a href="#none">커뮤니티</a></li> -->
		</ul>
	</div>
	<div id="header">
		<h1>
			<a href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/assets/images/로고.png" style="width: 95px"></a>
		</h1>
		<!-- 메뉴 (nav) -->
		<ul class="navigation">
	        <li>
	            <a href="#none">공연관리</a>
	            <ul class="drop_menu2">
	                <li><a href="${pageContext.request.contextPath}/show1/getConcertHallList">공연장관리</a></li>
					<li><a href="${pageContext.request.contextPath}/show/showInsertForm">공연등록</a></li>
					<li><a href="${pageContext.request.contextPath}/show1/adminShowList">예정공연</a></li>
					<li><a href="${pageContext.request.contextPath}/show1/ticketingShowList">진행공연</a></li>
					<li><a href="${pageContext.request.contextPath}/show1/showEndList">종료공연</a></li>
	            </ul>
	        </li>
	        <li>
	            <a href="#none">회원관리</a>
	            <ul class="drop_menu2">
	                <li><a href="">전체회원</a></li>
	                <li><a href="">신고회원</a></li>
	                <li><a href="">정지회원</a></li>
	                <li><a href="">탈퇴회원</a></li>
	            </ul>
	        </li>
	        <li>
	            <a href="#none">티켓관리</a>
	            <ul class="drop_menu2">
	                <li><a href="">예매리스트</a></li>
					<li><a href="${pageContext.request.contextPath}/show1/getTransferList/A">양도리스트</a></li>
					<li><a href="${pageContext.request.contextPath}/show1/getTicketingList">예매현황</a></li>
	            </ul>
	        </li>
	        <li>
	            <a href="#none">게시판관리</a>
	            <ul class="drop_menu2">
	                <li><a href="">Q&A 게시판</a></li>
					<li><a href="">리뷰 게시판</a></li>
	            </ul>
	        </li>
	        <li>
	            <a href="#none">통계관리</a>
	            <ul class="drop_menu2">
	                <li><a href="">통계1</a></li>
					<li><a href="">통계2</a></li>
	            </ul>
	        </li>
	    </ul>
		<!-- /메뉴 (nav) -->
	</div>
</header>