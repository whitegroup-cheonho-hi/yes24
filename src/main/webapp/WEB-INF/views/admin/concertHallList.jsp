<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.tableList { width: 100%; display: flex; justify-content: center; }
	.tableList table { margin: auto; width: 1000px;}
	.tableList a { width: 200px; height: 400px; margin: 0 15px; vertical-align: top; }
	.tableList button { margin: auto; width: 70px; height: 35px; font-size: 15px; font-weight: bold; 
		background-color: #196ab3; color: white; border: none; border-radius: 5px;}
	.tableList p { height: 40px; margin-bottom: 10px;}
	
	.admimTit{ color: #333; font-family: 'Noto Sans KR','맑은 고딕' !important; font-weight: 500; font-size: 25px;}
	.titletxt{ margin-bottom: 30px; margin-right: 850px;}

	.concertHallList{ line-height: 1; font-weight: 400; margin: 0; padding: 0; border: 0; font-size: inherit; font-style: normal; 
		vertical-align: baseline; border-top: solid 2px rgb(62, 62, 62); border-bottom: solid 2px rgb(62, 62, 62); border-collapse: collapse; border-spacing: 0; width: 100%; }
	.concertHallList tr{line-height: 45px; font-weight: 400; border-collapse: collapse; border-spacing: 0; margin: 0; border-bottom: solid 1px #ddd; }
	
	.search_cols{ margin-left: auto; border: 0; display: flex; width: 30%; align-items: center; }
	.search_wrap{ border: solid 1px #ebebeb; padding: 3px 10px 3px; display: block;}
	.search_cols input{ width: 192px; height: 25px; border: solid 1px lightgray; border-radius: 5px; padding-left: 8px; box-sizing: border-box;}
	.search_cols button{ height: 25px; border: solid 1px lightgray; border-radius: 5px; padding-left: 8px; box-sizing: border-box;}
    
    #search_btn{display: inline-block; margin: 0 10px; }
    
    .searchCell_input{ width: 230px; }
	
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
				<h3><em><strong class="admimTit">공연장 리스트</strong></em></h3>
			</div>
			
			<!-- ==================== 검색 영역 ==================== -->
			<div class="search_cols">
				<form onsubmit="return false;" autocomplete="off">
					<input id="keyword" name="keyword" value="${pageMake.cri.keyword }" size="5" type="text" placeholder="검색어 입력">
					<button type="submit" id="search_btn">검 색</button>
				</form>
			</div>
			
			<div class="tableList">
				<table class="concertHallList">
					<!-- ==================== 리스트 영역 ==================== -->
					<c:forEach var = "concertHallList" items="${concertHallList}">
					<tr>
						<td><a href="${pageContext.request.contextPath}/show/concertHallModifyForm/${concertHallList}" >${concertHallList.concertHallName}</a></td>
						<td>${concertHallList.concertHallRoadAddr}</td>
						<td><button type="button" class="modifyBtn" data-sq="${concertHallList.concertHallSq}" >수 정</button></td>
					</tr>
					</c:forEach>
				</table>
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
				<input type="hidden" name="keyword" value="${pageMake.cri.keyword }">
				
			</form>
			
		</div>
	</section>

</body>

<script type="text/javascript">

function searchParam() {
    let schAdd = "";
    if(trim($('#keyword').val()) !== "") schAdd += "&keyword=" + trim($('#keyword').val());
    if(trim(schAdd) !== "") schAdd = "?"+schAdd.substr(1, schAdd.length-1);
    return schAdd;
}


//페이징 버튼 클릭
$(document).ready(function() {
	  $("#paging .pageInfo a").on("click", function(e) {
	     e.preventDefault();
	     const pageNum = $(this).attr("href");
	     $("#moveForm input[name='pageNum']").val(pageNum);
	     $("#moveForm").submit();
	  });
  
  
	//검색버튼
	$('#search_btn').on('click', function(){
	    const newURL = window.location.protocol + "//" + window.location.host + window.location.pathname;
	    const schAdd = searchParam();
	    location.href = newURL + schAdd;
	});
	//수정버튼
	$('.modifyBtn').on('click', function() {
		//넘길 데이터 모으기
		const sq = $(this).data("sq");
		const url = "${pageContext.request.contextPath}/show1/showUpdateStat/" + sq;
		// 페이지 이동
		location.href = url;
		
	});
});

//모든공백제거
function trim(str) {
    return str.replace(/(^[\s　]+)|([\s　]+$)/g, "");
}

</script>

</html>