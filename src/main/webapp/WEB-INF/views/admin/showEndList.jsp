<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/adminForm.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin2.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://image.yes24.com/sysimage/yesUI/yesUI.css?v=20230403" media="all">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
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
	
	/* 상품페이지 카테고리 */
	#show .category{width: 1200px; display: flex; justify-content: center; margin-bottom: 20px;}
	#show .category li{ margin: 0 5px;}
	#show .category li a{font-weight: 900; font-size: 18px; padding: 7px 15px; display: block;}
	#show .category li.on{border-bottom: 2px solid #4982cf;}
	#show .category li.on a{color: #4982cf;}
	#show .category li a:hover{color: #4982cf;}
</style>
</head>
<body>
	<section>
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/includes/adminHeader.jsp"></c:import>
		<!-- //헤더 -->
	</section>
	

	<section>
		<div id="ySContent">
			<div id="show">
		         <c:if test="${empty Search}">
		            <ul class="category">
		               <li><a href="">전체</a></li>
		               <li><a href="">뮤지컬</a></li>
		               <li><a href="">콘서트</a></li>
		               <li><a href="">연  극</a></li>
		               <li><a href="">전  시</a></li>
		               <li><a href="">클래식</a></li>
		               <li><a href="">아  동</a></li>
		            </ul>
		         </c:if>
			</div>
			<!-- ==================== 정보 입력 영역 시작 ==================== -->
			<div class="">
				<div class="listItem">
					<c:forEach var = "showList" items="${showList}">
					
						<div class="listItemdiv">
							<a href="${pageContext.request.contextPath}/show/showModifyForm/${showList}">
									<img class="listItemImg" src="${pageContext.request.contextPath}/upload/${showList.subImage}">
							</a>
							<div class="listItemTxt">
								<p class="listItemTit">&lt;${showList.showName}&gt;</p>
								<button type="button" class="btnstat" data-sq="${showList.showSq}">예매대기</button>
								<button type="button" class="btndelete" data-sq="${showList.showSq}">삭 제</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- ==================== 정보 입력 영역 끝 ==================== -->
			
		</div>
	</section>
	
</body>

<script>
	$(document).ready(function() {
			
	});
	
	function showUpdateStat(showVO) {
		console.log(showVO);
        
        /* console.log(ShowingVO); */
        $.ajax({
	        url: "${pageContext.request.contextPath}/show1/showUpdateStat",
	        type: "post",
	        //contentType: "application/json",
	        data: showVO,
	        dataType: "json",
	        success: function(result) {
	        	// 성공적으로 처리된 경우 리다이렉트
                window.location.href = "${pageContext.request.contextPath}/show1/adminShowList/" + showVO.showStat;
	        },
	        error: function(XHR, status, error) {
	        	console.error(status + " : " + error);
	        }
	    });
	}
	
	$('.btnstat').on('click', function() {
		//넘길 데이터 모으기
		var showSq = $(this).data("sq");
		var showVO = {showSq : showSq, showStat : 1};
		/* var url = "${pageContext.request.contextPath}/show1/showUpdateStat/" + showSq; */
		showUpdateStat(showVO)
		
	});
	
	$('.btndelete').on('click', function() {
		var showSq = $(this).data("sq");
		var showVO = {showSq : showSq, showStat : 3};
		showUpdateStat(showVO)
	});
</script>
</html>