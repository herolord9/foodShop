<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${basePath}">

<title>My JSP 'goodsInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${basePath}res/css/bootstrap.css" type="text/css"
	rel="stylesheet" media="all">
<link href="${basePath}res/css/style.css" type="text/css"
	rel="stylesheet" media="all">

<link rel="stylesheet" href="${basePath}res/css/flexslider.css"
	type="text/css" media="screen" />

<script src="${basePath}res/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath}res/js/bootstrap-3.1.1.min.js"></script>

<script src="${basePath}res/js/imagezoom.js"></script>

<script defer src="${basePath}res/js/jquery.flexslider.js"></script>
<script type="text/javascript">
	// Can also be used with $(document).ready()
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>
</head>

<body>

	<br>
	<div class="single">
		<div class="container">
			<div class="single-grids">
				<div class="col-md-4 single-grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${imgUrl}/goods/${goods.goodsImg}">
								<div class="thumb-image">
									<img src="${imgUrl}/goods/${goods.goodsImg}"
										data-imagezoom="true" class="img-responsive">
								</div>
							</li>

							<c:if
								test="${goodsImgList != null && fn:length(goodsImgList) > 0}">
								<c:forEach items="${goodsImgList}" var="item">
									<c:if test="${item.goodsImgType == 0}">
										<li data-thumb="${imgUrl}/goods/${item.goodsImgUrl}">
										<div class="thumb-image"><img
											src="${imgUrl}/goods/${item.goodsImgUrl}" data-imagezoom="true" class="img-responsive">
											</div></li>
									</c:if>
								</c:forEach>
							</c:if>

						</ul>
					</div>
				</div>
				<div class="col-md-4 single-grid simpleCart_shelfItem">
					<h2><a href="${basePath}home.jsp?page=goodsInfoPage&goodsId=${goods.goodsId}">
						${goods.goodsName}
						</a>
					</h2>
					<p>${goods.goodsExplain}</p>
					<ul class="size dl-horizontal">
						<li><h3>?????????</h3></li>
						<li><h4>${goods.goodsSize}</h4></li>
						
					</ul>
					<ul class="size dl-horizontal">
						<li><h3>?????????</h3></li>
						<li><h4>${goods.goodsFrom}</h4></li>
						<li><h3>????????????</h3></li>
						<li><h4>${goods.goodsTime}</h4></li>
					</ul>
					<ul class="size dl-horizontal">
						<li><h3>???????????????</h3></li>
						<li><h4>${goods.goodsSaveCondition}</h4></li>
					</ul>
					<ul class="size dl-horizontal">
						<li><h3>???<fmt:formatNumber type="number" maxFractionDigits="2"
										value="${goods.goodsPrice*(empty goods.goodsDiscount ? 1:goods.goodsDiscount)}" 
										pattern="0.00"/>
						</h3></li>
						<li><h4 class="pric1">
							<del>???${goods.goodsPrice}</del>
						</h4></li>
					</ul>
					<ul class="size dl-horizontal">
						<li><h3>?????????</h3></li>
						<li><h4>${goods.goodsClass}</h4></li>
						<li><h3 class="qty pric1">?????????</h3></li>
					<li><input min="1" type="number" id="quantity" name="quantity"
						value="1" class="form-control input-small"></li>
					</ul>
					<div class="btn_form">
						<button class="add-cart item_add" onclick="addGoodsToCart()">???????????????</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- end -->

	<!-- ??????  ???  ??????  start-->
	<div class="container">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#info" data-toggle="tab">????????????</a>
			</li>
			<li><a href="#comment" data-toggle="tab">????????????  ${fn:length(commentList)}</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="info">
				<c:if test="${goodsImgList != null && fn:length(goodsImgList) > 0}">
					<c:forEach items="${goodsImgList}" var="item">
						<c:if test="${item.goodsImgType == 1}">
							<div class="col-md-12 single-grid simpleCart_shelfItem">
							<img  class="img-responsive" src="${imgUrl}/goods/${item.goodsImgUrl}">
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
			<div class="tab-pane fade" id="comment">
				<ul class="list-unstyled" style="margin:30px; 20px;">
					<c:choose>
						<c:when
							test="${commentList != null && fn:length(commentList) > 0}">
							<c:forEach items="${commentList}" var="item">
								<li>
									<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;?????????${item.userId}</p>
									<blockquote>
										<p class="text-muted">
											?????????
											<c:forEach begin="1" end="${item.score}" varStatus="j"
												step="1">
												<img src="${basePath}res/images/5.png" />
											</c:forEach>
											<br>?????????${item.comment}
										</p>
										<small>${item.time}</small>
									</blockquote>
								</li>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<li><p>????????????</p></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	<!-- end -->
</body>
<script src="${basePath}res/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
function addGoodsToCart() {
	if ('${user}' != null && '${user}' != '') {
		//alert('ajax???????????????');
		$.ajax({
				type : "POST",
				dataType : "text",
				async : false,
				url : '${basePath}cart.jsp',
				data : {"goodsId":'${goods.goodsId}',"buyNum":$('#quantity').val(),"oper":1},
				//??????????????????????????????????????????????????????
				success : function(msg) {
						if (msg == 'success') {
							layer.msg('???????????????????????????', {icon:6});
						} else {
							layer.msg('???????????????????????????', {icon:5});
						}
				},
				error : function () {
					layer.msg('????????????????????????', {icon: 5});
				}
			});
	} else {
	//alert('??????????????????');
		layer.msg('?????????????????????',{icon: 5});
	}
}
</script>

</html>
