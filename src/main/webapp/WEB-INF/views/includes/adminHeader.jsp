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
			<a href="${pageContext.request.contextPath}/"><img
				src="${pageContext.request.contextPath}/assets/images/로고.png"></a>
		</h1>
		<!-- 메뉴 (nav) -->
		<ul id="navigation">
			<li class="submenu"><a>공연관리</a>
				<ul class="menus">
					<li><a href="">공연장등록</a></li>
					<li><a href="">공연등록</a></li>
					<li><a href="">예정공연</a></li>
					<li><a href="">진행공연</a></li>
					<li><a href="">종료공연</a></li>
				</ul></li>
			<li class="submenu"><a href="">회원관리</a>
				<ul class="menus">
					<li><a href="">전체회원</a></li>
					<li><a href="">신고회원</a></li>
					<li><a href="">정지회원</a></li>
					<li><a href="">탈퇴회원</a></li>
				</ul></li>
			<li class="submenu"><a href="">티켓관리</a>
				<ul class="menus">
					<li><a href="">예매리스트</a></li>
					<li><a href="">양도리스트</a></li>
					<li><a href="">예매현황</a></li>
				</ul></li>
			<li class="submenu"><a href="">게시판관리</a>
				<ul class="menus2">
					<li><a href="">Q&A 게시판</a></li>
					<li><a href="">리뷰 게시판</a></li>
				</ul></li>
			<li class="submenu"><a href="">통계관리</a>
				<ul class="menus2">
					<li><a href="">통계1</a></li>
					<li><a href="">통계2</a></li>
				</ul></li>
		</ul>
		<!-- /메뉴 (nav) -->
	</div>
</header>