<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<header class="pc">
	<!--웹에서의 헤더-->
	<div id="lnb">
		<ul id="lnba" class="lnb">
			<c:if test="${!empty authUser && authUser.userRole != 1}">
				<a href="${pageContext.request.contextPath}/admin/getTicketingList">관리자페이지로 이동</a>
			</c:if>
			<c:choose>
				<c:when test="${empty authUser}">
					<li class="login"><a
						href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li class="logout">${authUser.userId}님&nbsp;환영합니다</li>
					<li class="logout"><a
						href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					<li class="myPage"><a
						href="${pageContext.request.contextPath}/myPage/myTicketingList">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			<li class="notice"><a href="#none">커뮤니티</a></li>
		</ul>
	</div>
	<div id="header">
		<h1>
			<a href="${pageContext.request.contextPath}/"><img id="rogo"
				src="${pageContext.request.contextPath}/assets/images/로고.png"></a>
		</h1>
		<!-- 메뉴 (nav) -->
		<ul id="nav">
			<li id="l1"><a
				href="${pageContext.request.contextPath}/category/1">뮤지컬</a></li>
			<li id="l2"><a
				href="${pageContext.request.contextPath}/category/2">콘서트</a></li>
			<li id="l3"><a
				href="${pageContext.request.contextPath}/category/3">연극</a></li>
			<li id="l4"><a
				href="${pageContext.request.contextPath}/category/4">클래식</a></li>
			<li id="l5"><a
				href="${pageContext.request.contextPath}/transferBoardForm">양도티켓</a></li>
			<li><input type="text" id="searchKeyword" autocomplete="off">
				<a href="#"><img id="searchButton"
					src="http://tkfile.yes24.com/imgNew/common/pf-srch-w.png" alt=""></a></li>
		</ul>

		<!-- /메뉴 (nav) -->
	</div>
</header>