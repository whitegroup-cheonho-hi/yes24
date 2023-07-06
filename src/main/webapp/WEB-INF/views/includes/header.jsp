<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			</ul>
			<input type="text" id="searchWord" autocomplete="off"> <a
				href="#"><img
				src="http://tkfile.yes24.com/imgNew/common/pf-srch-w.png" alt=""></a>
			<!-- /메뉴 (nav) -->
		</div>
	</header>