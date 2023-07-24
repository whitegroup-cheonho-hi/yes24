<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>.
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transferBoard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
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
#ySContent{ margin: 120px auto; }
.listItem { width: 1200px; display: grid; grid-template-columns: repeat(5, 200px); justify-content: space-around; justify-items: center; }
.listItem .listItemdiv { display: inline-block; width: 200px; height: 300px; margin: 0 15px; vertical-align: top; }
.listItem img {width: 100%;}
.listItemTxt { display: flex; align-items: center; flex-wrap: wrap; justify-content: center;}
.listItemTxt button { margin: auto; width: 70px; height: 35px; font-size: 14px; font-weight: bold; 
	background-color: #196ab3; color: white; border: none; border-radius: 5px;}
.listItemTxt p { width: 200px; height: 40px; margin-bottom: 10px; }
section{width: 1200px; margin: 0 auto; padding-top: 120px;}
section ul {  display: flex;  justify-content: flex-start; flex-direction: row; flex-wrap: wrap; margin: 0 -15px; }
section ul li{ width: calc(25% - 92px); margin: 0 15px; margin-bottom: 70px;}
section ul li a img{width: 100%;}
section ul li a span{display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
section ul li a span.tit{font-size: 14px; margin-top:15px;}
section ul li a span.price{font-weight: 600; font-size: 17px; margin-top: 2px;}
</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<div class="wrapper"></div>

	<section>
		<div id="ySContent">
			<div id="show"></div>
			<!-- ==================== 정보 입력 영역 시작 ==================== -->
			<div class="">
				<div class="listItem">
					<section>
						<ul>
							<c:forEach items="${transferBoardList}" var="transferBoard">
								<li><span>${transferBoard.transferBoardSq}</span> <a
									href="${pageContext.request.contextPath}/transferTicket/transferTicketDetail/${transferBoard.transferBoardSq}"> <img
										src="${pageContext.request.contextPath}/upload/${transferBoard.subImage}">
										<span>${transferBoard.showName}&nbsp;&nbsp;${transferBoard.ticketSeat}석</span>
										<span class="price jb"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${transferBoard.hopePrice}" />원
									</span>
								</a></li>
							</c:forEach>
						</ul>
					</section>
				</div>
			</div>

			<!-- ==================== 정보 입력 영역 끝 ==================== -->

		</div>
	</section>


	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->

</body>

<script>
	$(document).on('ready', function() {

	});
</script>

</html>