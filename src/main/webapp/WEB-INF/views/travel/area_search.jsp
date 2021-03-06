<%@page import="com.dto.AreaPageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.AreaDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>물과 여행 정보</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">
 
<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet"> 
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet"> 
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet"> 
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#AInit").on("change",function(){
		var AInit = $("#AInit option:selected").val();
		location.href="AreaSearch?AInit="+AInit;
	}); 
	console.log($("#AInit").val()); 
});
</script>  
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="css/subscribe_css.css" rel="stylesheet" >
<link href="css/area.css" rel="stylesheet"> 
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="ture"></jsp:include>

	<main class="main">
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center" style="padding-bottom:20px;">
					<h2></h2>
					<ol>
						<li><a href="<c:url value='/' />">Home</a></li>
						<li>물과 여행 정보</li>
						<li>명소 따라</li>
					</ol>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->
		
		<!-- inner-page -->
	<section class="inner_page">  
	<div class=sub_top> 
		<h1>지역 명소</h1>
	</div>
	<p class=sub_top2>하천 주변의 주요 관광지에 대한 정보를 제공합니다.</p> 
	<form action="AreaSearch" class="board_sch"> 강 선택&nbsp;&nbsp;
	<select name="AInit" id="AInit" class="AInit" title="전체">   
		<option value="All">전체</option> 
		<option value="HA">한&nbsp;&nbsp;강</option> 
		<option value="GU">금&nbsp;&nbsp;강</option>
		<option value="ND">낙동강</option>  
		<option value="YS">영산강</option>  
		<option value="SJ">섬진강</option>   
	</select>&nbsp;
		<input type="text" name="searchValue" id="searchValue" class="searchValue"> 
		<input type="submit" value="검색" class="submit">
	</form>   
		<div class="content">    
			<div id="div_con">
				<c:forEach var="xx" items="${list }" varStatus="status">
					<c:if test="${xx.RIMAGE != null}">
					<ul>
						<li class=title>
							<img src="images/area/${xx.RIMAGE }.jpg" align="left" width="180"> 
						 	<h5>${xx.TITLE}</h5>  
							<p>${xx.INTRO}</p>
						</li>  
					</ul>
					</c:if> 
				</c:forEach>
			</div> 	 
		</div> 
	</section>
	<!-- paging -->
		<ul>
			<li class="page" style="text-align: center;  list-style:none; margin-left: 50px;">
				<c:set var="curPage" value="${curPage }" /> 
				<c:set var="perPage" value="${perPage }" /> 
				<c:set var="totalCount" value="${totalCount }" />
				<c:if test="totalCount % perPage != 0">
					<c:set var="totalCount" value="${totalCount+1 }"/>
				</c:if>
				<c:set var="TotalPage" value="${totalCount/perPage }" />
				<c:set var="totalPage" value="${TotalPage+(1-(TotalPage%1))%1}" />
				<fmt:parseNumber var="totalPage" type="number" value="${totalPage}" />
				<c:set var="PageBlock" value="10" /> 
				<c:set var="PrevBlock" value="${ ((curPage - 1) / PageBlock) * PageBlock}" />
				<c:set var="nextBlock" value="${PrevBlock+PageBlock+1 }" />
				<fmt:parseNumber var="NextBlock" type="number" value="${nextBlock}" />
									
				<!--########## 이전 페이지 링크 출력 ############ -->
				<c:if test="${ curPage > 2 }">
					<a href="AreaSearch?curPage=${ 1 }">[1 페이지로 ]</a> &nbsp;
				 </c:if> 
				<c:if test="${ curPage > 10 }">
					<a href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${ curPage - 10 }">[이전 10 페이지 ]</a>&nbsp;
				 </c:if> 
				<c:if test="${ curPage > 1 }">
					<a href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${ curPage - 1 }">[이전 페이지 ]</a>&nbsp;
				 </c:if> 
				<!--########## 페이지 출력 ############ --> 
				<c:forEach var="counter" begin="${curPage}" end="${nextBlock-1}">
					<c:set var="counter" value="${counter-4 }"/>
					<c:if test="${5-curPage>0 }">
						<c:set var="counter" value="${5-curPage+counter }"/>
					</c:if>
					<c:if test="${totalPage - curPage < 5}">
						<c:set var="counter" value="${counter - 5 + totalPage - curPage }" />
					</c:if>																
					<c:if test="${ counter <= totalPage }">
						<c:choose>
							<c:when test="${ counter == curPage }">
								<a class="curPage" href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${ curPage }">[${counter}]</a>&nbsp;
							</c:when>
							<c:when test="${ counter != curPage }">
								<a href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${counter}">[${counter}]</a>&nbsp;
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach> 
									
				<!--########## 다음 10 페이지 링크 출력 ############ -->
					<c:if test="${ curPage < totalPage  }">
						<a href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${ curPage+1  }">[다음 페이지]</a>&nbsp;
					<c:if test="${ totalPage > 10  }">
						<a href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${ curPage+10 }">[다음 10페이지]</a>&nbsp;
					</c:if>
						<a href="AreaSearch?searchValue=${TITLE}&AInit=${REGIONCD}&curPage=${ totalPage  }">[마지막 페이지]</a>
					</c:if>
				</li>
			</ul> <!-- end paging -->
		</main>
		<jsp:include page="../common/footer.jsp" flush="true"></jsp:include>

		<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
	
		<!-- Vendor JS Files -->
		<script src="assets/vendor/jquery/jquery.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
		<script src="assets/vendor/counterup/counterup.min.js"></script>
		<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="assets/vendor/venobox/venobox.min.js"></script>
		<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="assets/vendor/aos/aos.js"></script>

		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>
	</body>
</html> 