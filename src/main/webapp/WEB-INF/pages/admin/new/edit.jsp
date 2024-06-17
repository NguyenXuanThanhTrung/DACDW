<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/pages/admin/taglib.jsp" %>
<c:url var="newURL" value="/admin/news/list"/>
<c:url var="editNewURL" value="/admin/news/edit"/>
<c:url var="newAPI" value="/api/new"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa bài viết</title>
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
    <script src="<c:url value='/template/admin/sweetalert/sweetalert2.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/template/admin/sweetalert/sweetalert2.min.css' />"/>
    <script src="<c:url value='/template/ckeditor/ckeditor.js' />"></script>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/admin"/>">Trang quản trị</a>
                </li>
                <li><a href="<c:url value="/admin/news/list?page=1&limit=5"/>">Danh sách</a></li>
                <li class="active"><b>Chỉnh sửa bài viết</b></li>
            </ul>
        </div>
        <div class="page-content">
            <div class="row">
                <c:if test="${not empty message}">
                    <div class="alert alert-${alert}">${message}</div>
                </c:if>
                <div class="col-xs-12">
                    <form:form class="form-horizontal" role="form" id="formSubmit" enctype="multipart/form-data" modelAttribute="news">
                        <div class="form-group">
                            <label for="category" class="col-sm-3 control-label no-padding-right">Thể loại:</label>
                            <div class="col-sm-9">
                                <form:select path="category.idCategory" id="category">
                                    <form:option value="" label="-- Chọn thể loại --"/>
                                    <form:options items="${categories}" itemValue="idCategory" itemLabel="categoryName"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên bài viết</label>
                            <div class="col-sm-9">
                                <form:input path="title" id="title" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="imageDirectory">
                                    <option value="gallery">Gallery</option>
                                    <option value="blog">Blog</option>
                                    <option value="post">Post</option>
                                </select>
                                <input type="file" class="form-control" id="imageFile" name="imageFile"/>
                                <input type="hidden" id="thumbnail" name="thumbnail"/>
                                <img id="previewImage" src="" style="max-width: 100%; max-height: 200px; margin-top: 10px; display: none;"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="newsquote" class="col-sm-3 control-label no-padding-right">Mô tả ngắn:</label>
                            <div class="col-sm-9">
                                <form:textarea path="newsquote" rows="5" cols="10" cssClass="form-control" id="newsquote"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-3 control-label no-padding-right">Nội dung:</label>
                            <div class="col-sm-9">
                                <form:textarea path="content" rows="5" cols="10" cssClass="form-control" id="content"/>
                            </div>
                        </div>
                        <input type="hidden" id="idNewsgroup" name="idNewsgroup" value="1"> <!-- Giá trị mẫu -->
                        <input type="hidden" id="idUser" name="idUser" value="1"> <!-- Giá trị mẫu -->
                        <input type="hidden" id="numberOfReads" name="numberOfReads" value="500">
                        <form:hidden path="idNews" id="newId"/>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty news.idNews}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật bài viết
                                    </button>
                                </c:if>
                                <c:if test="${empty news.idNews}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm bài viết
                                    </button>
                                </c:if>
                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset" id="btnReset" onClick="window.location.reload()">
                                    <i class="ace-icon fa fa-undo bigger-110"></i>
                                    Hủy
                                </button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var editor = '';
    $(document).ready(function () {
        editor = CKEDITOR.replace('content');
    });

    $('#imageFile').change(function () {
        var file = $(this)[0].files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#previewImage').attr('src', e.target.result);
            $('#previewImage').show();
        };

        reader.readAsDataURL(file);

        // Lưu tên tệp vào input hidden #thumbnail
        var fileName = file.name;
        var directory = $('#imageDirectory').val();
        var fullPath = '/assets/img/' + directory + '/' + fileName;
        $('#thumbnail').val(fullPath);
    });

    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = new FormData($('#formSubmit')[0]);
        data.append("content", editor.getData());
        data.append("imageDirectory", $('#imageDirectory').val());
        var idNewsgroup = $('#idNewsgroup').val(); // Lấy từ một input hoặc source khác
        var idUser = $('#idUser').val(); // Lấy từ một input hoặc source khác
        var numberOfReads = $('#numberOfReads').val();

        // Thêm vào FormData
        data.append("idNewsgroup", idNewsgroup);
        data.append("idUser", idUser);
        data.append("numberOfReads", numberOfReads);
        var id = $('#newId').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data, id);
        }
    });

    function addNew(data) {
        $.ajax({
            url: '${newAPI}',
            type: 'POST',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
            success: function (response) {
                console.log(response);
                if (response && response.idNews && response.category && response.category.idCategory) {
                    swal({
                        title: 'Thành công!',
                        text: 'Bài viết đã được thêm thành công.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "${newURL}?page=1&limit=5";
                        }
                    });
                }
            },
            error: function (error) {
                console.error(error);
                window.location.href = "${newURL}?page=1&limit=5&message=error_system";
            }
        });
    }

    function updateNew(data, id) {
        $.ajax({
            url: '${newAPI}/' + id,
            type: 'PUT',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
            success: function (response) {
                console.log(response);
                if (response && response.idNews && response.category && response.category.idCategory) {
                    swal({
                        title: 'Thành công!',
                        text: 'Bài viết đã được cập nhật thành công.',
                        icon: 'success',
                        confirmButtonClass: "btn-success",
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "${newURL}?page=1&limit=5";
                        }
                    });
                } else {
                    swal({
                        title: 'Lỗi!',
                        text: 'Không thể cập nhật bài viết.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            },
            error: function (error) {
                console.error(error);
                var idNews = $('#newId').val();
                window.location.href = "${editNewURL}?id=" + idNews + "&message=error_system";
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
<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js' />"></script>
</body>
</html>

