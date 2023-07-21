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
	.listItem a { display: inline-block; width: 200px; height: 400px; margin: 0 15px; vertical-align: top; }
	.listItem img {width: 100%;}
	.listItemTxt { display: flex; align-items: center; flex-wrap: wrap; justify-content: center;}
	.listItemTxt button { margin: auto; width: 70px; height: 35px; font-size: 14px; font-weight: bold; 
		background-color: #196ab3; color: white; border: none; border-radius: 5px;}
	.listItemTxt p { height: 40px; margin-bottom: 10px; }
	
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
					<a href="${pageContext.request.contextPath}/show/showModifyForm/1" target="_self" title="<쿠로이 저택엔 누가 살고 있을까?>">
						<div class="">
							<img class="listItemImg" src="http://tkfile.yes24.com/upload2/perfblog/202305/20230530/20230530-45433.jpg/dims/quality/70/">
							<div class="listItemTxt">
								<p class="listItemTit">&lt;쿠로이 저택엔 누가 살고 있을까?&gt;</p>
								<button type="button" class="btnstat">상태변경</button><button type="button" class="btndelete">삭 제</button>
							</div>
						</div>
					</a>
					<a href="" target="_self" title="<알로하, 나의 엄마들>">
						<div class=""><img class="listItemImg" alt="<알로하, 나의 엄마들>"
							src="http://tkfile.yes24.com/upload2/perfblog/202307/20230707/20230707-46037.jpg/dims/quality/70/">
							<div class="listItemTxt">
								<p class="listItemTit">&lt;알로하, 나의 엄마들&gt;</p>
								<button type="button">상태변경</button><button type="button">삭 제</button>
							</div>
						</div>
					</a>
					<a href="" target="_self" title="뮤지컬 <신의 손가락>">
						<div class=""><img class="listItemImg" alt="<신의 손가락>"
								src="http://tkfile.yes24.com/upload2/perfblog/202307/20230717/20230717-45830.jpg/dims/quality/70/">
							<div class="listItemTxt">
								<p class="listItemTit">&lt;신의 손가락&gt;</p>
							</div>
						</div>
					</a>
					<a href="" target="_self" title="<투모로우 모닝>">
						<div class=""><img class="listItemImg" alt="<투모로우 모닝>"
								src="http://tkfile.yes24.com/upload2/perfblog/202307/20230711/20230711-46513.jpg/dims/quality/70/">
							<div class="listItemTxt">
								<p class="listItemTit">&lt;투모로우 모닝&gt;</p>
							</div>
						</div>
					</a>
					<a href="" target="_self" title="<보이A>">
						<div class=""><img class="listItemImg" alt="<보이A>"
								src="http://tkfile.yes24.com/upload2/perfblog/202306/20230626/20230626-45677.jpg/dims/quality/70/">
							<div class="listItemTxt">
								<p class="listItemTit">&lt;보이A&gt;</p>
							</div>
						</div>
					</a>
				</div>
			</div>
			
			<!-- ==================== 정보 입력 영역 끝 ==================== -->
			
		</div>
	</section>
	
</body>

<script>

</script>
</html>