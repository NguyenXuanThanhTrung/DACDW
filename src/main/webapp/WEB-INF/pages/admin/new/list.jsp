	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@include file="/WEB-INF/pages/admin/taglib.jsp"%>
	<c:url var="newsListURL" value="/admin/news/list"/>
	<c:url var="newAPI" value="/api/new"/>
	<!DOCTYPE html>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách bài viết</title>
		<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />"/>
		<link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />"/>
		<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet"
			  id="main-ace-style"/>
		<script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type='text/javascript' src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
		<script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<!-- sweetalert -->
		<script src="<c:url value='/template/admin/sweetalert/sweetalert2.min.js' />"></script>
		<link rel="stylesheet" href="<c:url value='/template/admin/sweetalert/sweetalert2.min.css' />"/>

		<script src="<c:url value='/template/ckeditor/ckeditor.js' />"></script>
	</head>

	<body>
	<!-- header -->
	<%@ include file="/WEB-INF/pages/admin/header.jsp" %>
	<!-- header -->
	<div class="main-content">
		<form action="<c:url value='/admin/news/list'/>" id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">

					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="<c:url value="/admin"/>">Trang quản trị</a>
						</li>

						<li class="active"><a href="#">Danh sách</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
							<div class="row">
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createNewsURL" value="/admin/news/edit"/>
												<a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												   data-toggle="tooltip" title='Thêm bài viết'
												   href='${createNewsURL}'> <span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
														</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
														data-toggle="tooltip" title='Xóa bài viết' disabled>
															<span> <i class="fa fa-trash-o bigger-110 pink"></i>
															</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-12">

									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
											<tr>
												<th><input title="Chọn tất cả" type="checkbox" id="checkAll" onclick='checkUncheckAll(this)'></th>
												<th>Tên bài viết</th>
												<th>Mô tả ngắn</th>
												<th>Thao tác</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="news" items="${newsList}">
												<tr>
													<td><input name="check" type="checkbox" id="checkbox_${news.idNews}" value="${news.idNews}" onclick="checkbtnDelete(this)"></td>
													<td>${news.title}</td>
													<td>${news.newsquote}</td>
													<td>
														<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Cập nhật bài viết"
														   href='<c:url value="/admin/news/edit?id=${news.idNews}"/>'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
														</a>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" />
										<input type="hidden" value="" id="limit" name="limit"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- /.main-content -->
	<script>
		var totalPages = ${totalPages};
		var currentPage = ${currentPage};
		var totalItem = ${totalItems};
		$(function () {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: totalPages,
				visiblePages: 10,
				startPage: currentPage,
				onPageClick: function (event, page) {
					if (currentPage != page) {
						$('#limit').val(5);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});

		var x = 0;

		function checkbtnDelete(check) {
			if (check.checked == true) {
				x++;
			} else {
				x--;
			}
			if (x > 0) {
				document.getElementById("btnDelete").disabled = false;
			} else {
				document.getElementById("btnDelete").disabled = true;
			}
		}

		function checkUncheckAll(checkBox) {
			get = document.getElementsByName('check');
			for(var i = 0; i < get.length; i++) {
				get[i].checked = checkBox.checked;
				x++;
			}
			if (checkBox.checked == true) {
				if (x > 0) {
					document.getElementById("btnDelete").disabled = false;
				}
			} else {
				document.getElementById("btnDelete").disabled = true;
				x = 0;
			}
		}

		function warningBeforeDelete() {
			swal({
				title: "Xác nhận xóa",
				text: "Bạn có chắc chắn muốn xóa hay không?",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-success",
				cancelButtonClass: "btn-danger",
				confirmButtonText: "Xác nhận",
				cancelButtonText: "Hủy bỏ",
			}).then(function(isConfirm) {
				if (isConfirm.value === true) {
					var ids = $('tbody input[type=checkbox]:checked').map(function () {
						return $(this).val();
					}).get();
					deleteNews(ids);
				}
			});
		}
		function updateTableData(data) {
			const tbody = $('tbody');
			tbody.empty(); // Xóa tất cả các hàng hiện có

			// Duyệt qua danh sách dữ liệu mới và thêm vào bảng
			data.forEach(news => {
				const row = `
            <tr>
                <td><input name="check" type="checkbox" id="checkbox_${news.idNews}" value="${news.idNews}" onclick="checkbtnDelete(this)"></td>
                <td>${news.title}</td>
                <td>${news.newsquote}</td>
                <td>
                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Cập nhật bài viết"
                       href='<c:url value="/admin/news/edit?id=${news.idNews}"/>'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    </a>
                </td>
            </tr>
        `;
				tbody.append(row);
			});
		}

		var newAPI = '${newAPI}';

		function deleteNews(id) {
			$.ajax({
				url: newAPI + '/' + id,
				type: 'DELETE',
				success: function(response) {
					swal({
						title: 'Thành công!',
						text: 'Bài viết đã được xóa thành công.',
						icon: 'success',
						confirmButtonText: 'OK'
					}).then((result) => {
						if (result.isConfirmed) {
							// Gọi lại AJAX để lấy dữ liệu mới từ API và cập nhật giao diện
							$.ajax({
								url: "${newURL}?page=1&limit=5",
								type: 'GET',
								success: function(data) {
									// Cập nhật giao diện với dữ liệu mới lấy được từ API
									updateTableData(data); // Gọi hàm cập nhật giao diện
								},
								error: function(error) {
									console.error(error);
									window.location.href = "${newURL}?page=1&limit=5&message=error_system";
								}
							});
						}
					});
				},
				error: function(error) {
					console.error(error);
					window.location.href = "${newURL}?page=1&limit=5&message=error_system";
				}
			});
		}

	</script>
	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/>"></script>

	<!-- page specific plugin scripts -->
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js'/>"></script>
	<!-- footer -->
	<%@ include file="/WEB-INF/pages/admin/footer.jsp" %>
	<!-- footer -->
	</body>

	</html>
