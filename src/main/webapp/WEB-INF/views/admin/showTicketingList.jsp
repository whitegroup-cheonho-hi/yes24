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
	
	#paging{ text-align: center; padding: 0; margin: 0px auto; width: 310px; }
	.pageInfo{font: 14px "맑은 고딕", 돋움, 굴림; text-align: center; padding: 0; list-style-type: none; margin: 10px 5px 10px 5px; display: inline;}
	#paging ul { display: inline-block; }
	#paging ul>li { display: inline-block; margin: 0px 8px 0px 8px; }
	#paging ul>li.active { font-size: 16px; font-weight: bold; }
	
	.admimTit{ color: #333; font-family: 'Noto Sans KR','맑은 고딕' !important; font-weight: 500; font-size: 25px;}
	.titletxt{ margin-bottom: 30px }
	
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
			<div class="titletxt">
				<h3><em><strong class="admimTit">진행공연</strong></em></h3>
			</div>
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
			<!-- ==================== 리스트 영역 ==================== -->
			<div class="">
				<div class="listItem">
					<c:forEach var = "showList" items="${showList}">
					
						<div class="listItemdiv">
							<a href="${pageContext.request.contextPath}/show/showModifyForm/${showList}">
									<img class="listItemImg" src="${pageContext.request.contextPath}/upload/${showList.subImage}">
							</a>
							<div class="listItemTxt">
								<p class="listItemTit">&lt;${showList.showName}&gt;</p>
								<button type="button" class="btnstat" data-sq="${showList.showSq}" style="background-color: #196ab3">예매대기</button>
								<button type="button" class="btndelete" data-sq="${showList.showSq}" style="background-color: #f20055">삭 제</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- ==================== 페이징 영역  ==================== -->
			<div id="paging">
				
				<ul id="pageInfo" class="pageInfo">
					<!-- 이전페이지 버튼 -->
			        <c:if test="${pageMake.prev}">
			    	    <li class="pageInfo_btn previous"><a href="${pageMake.startPage-1}">◀</a></li>
			        </c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMake.startPage }" end="${pageMake.endPage }">
						<li class="pageInfo_btn ${pageMake.cri.pageNum == num ? "active":"" }">
							<a href="${num }">${num }</a>
						</li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
			        <c:if test="${pageMake.next}">
			        	<li class="pageInfo_btn next">
			        		<a href="${(pageMake.endPage + 1)}">▶</a>
			        	</li>
			        </c:if>
				</ul>

				<div class="clear"></div>
			</div>
			<form action="adminShowList" id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMake.cri.amount }">
				
			</form>
			
		</div>
	</section>
	
</body>

<script>

	//페이징 버튼 클릭
	$(document).ready(function() {
	  $("#paging .pageInfo a").on("click", function(e) {
	     e.preventDefault();
	     var pageNum = $(this).attr("href");
	     $("#moveForm input[name='pageNum']").val(pageNum);
	     $("#moveForm").submit();
	  });
	});
	
	
	//공연상태변경
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
                window.location.href = "${pageContext.request.contextPath}/show1/showTicketingList/";
	        },
	        error: function(XHR, status, error) {
	        	console.error(status + " : " + error);
	        }
	    });
	}
	
	//상태변경버튼1
	$('.btnstat').on('click', function() {
		//넘길 데이터 모으기
		var showSq = $(this).data("sq");
		var showVO = {showSq : showSq, showStat : 1};
		/* var url = "${pageContext.request.contextPath}/show1/showUpdateStat/" + showSq; */
		showUpdateStat(showVO)
		
	});
	
	//상태변경버튼1
	$('.btndelete').on('click', function() {
		var showSq = $(this).data("sq");
		var showVO = {showSq : showSq, showStat : 3};
		showUpdateStat(showVO)
	});
	
	
</script>
</html>