<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title id="title">News HTML-5 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="../../assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../assets/css/ticker-style.css">
    <link rel="stylesheet" href="../../assets/css/flaticon.css">
    <link rel="stylesheet" href="../../assets/css/slicknav.css">
    <link rel="stylesheet" href="../../assets/css/animate.min.css">
    <link rel="stylesheet" href="../../assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../../assets/css/slick.css">
    <link rel="stylesheet" href="../../assets/css/nice-select.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="../../assets/css/responsive.css">
    <link rel="stylesheet" href="../../assets/css/contact.css">
</head>

<body>
<header>
    <!-- Header Content Start -->
    <div class="header-area">
        <div class="main-header">
            <div class="header-top black-bg d-none d-sm-block">
                <div class="container">
                    <div class="col-xl-12">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="header-info-left">
                                <ul>
                                    <li class="title"><span class="flaticon-energy"></span> <span data-i18n="trending.title">Trending Title</span></li>
                                    <li data-i18n="header.contact">+880166 253 232</li>
                                </ul>
                            </div>
                            <div class="header-info-right">
                                <ul class="header-date">
                                    <li><span class="flaticon-calendar"></span> <span data-i18n="header.contact">+880166 253 232</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-mid gray-bg">
                <div class="container">
                    <div class="row d-flex align-items-center">
                        <!-- Logo -->
                        <div class="col-xl-3 col-lg-3 col-md-3 d-none d-md-block">
                            <div class="logo">
                                <a href="<%= request.getContextPath() %>/index"><img
                                        src="<%= request.getContextPath() %>/../../assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9">
                            <div class="header-banner f-right">
                                <img src="<%= request.getContextPath() %>/../../assets/img/gallery/header_card.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-8 col-lg-8 col-md-12 header-flex">
                            <!-- sticky -->
                            <div class="sticky-logo">
                                <a href="<%= request.getContextPath() %>/index"><img
                                        src="<%= request.getContextPath() %>/../../assets/img/logo/logo.png" alt=""></a>
                            </div>
                            <!-- Main-menu -->
                            <div class="main-menu d-none d-md-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="<%= request.getContextPath() %>/index" data-i18n="header.home">Home</a></li>
                                        <li><a href="<%= request.getContextPath() %>/about" data-i18n="header.about">About</a></li>
                                        <li><a href="<%= request.getContextPath() %>/categori" data-i18n="header.category">Category</a></li>
                                        <li><a href="<%= request.getContextPath() %>/latest_news" data-i18n="header.latest_news">Latest News</a></li>
                                        <li><a href="#" data-i18n="header.pages">Trang</a>
                                            <ul class="submenu">
                                                <li><a href="<%= request.getContextPath() %>/blog" data-i18n="header.blog">Blog</a></li>
                                                <li><a href="<%= request.getContextPath() %>/blog_details" data-i18n="header.blog_details">Blog Details</a></li>
                                                <li><a href="<%= request.getContextPath() %>/elements" data-i18n="header.elements">Elements</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="<%= request.getContextPath() %>/contact" data-i18n="header.contact2">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4">
                            <div class="header-right f-right d-none d-lg-block" style="display: flex; align-items: center;">
                                <!-- Header Social -->
                                <div style="display: inline-block; margin-right: 10px;">
                                    <a href="https://www.fb.com/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                </div>
                                <div style="display: inline-block; margin-right: 10px;">
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                </div>
                                <div style="display: inline-block; margin-right: 10px;">
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                                <div style="display: inline-block; margin-right: 10px;">
                                    <a href="#"><i class="fab fa-youtube"></i></a>
                                </div>

                                <!-- Search Nav -->
                                <div style="display: inline-block;">
                                    <div class="nav-search search-switch">
                                        <i class="fa fa-search"></i>
                                    </div>
                                </div>

                                <!-- Login Icon -->
                                <div style="display: inline-block; margin-left: 10px;">
                                    <a href="<%= request.getContextPath() %>/login"><i class="fa fa-sign-in-alt"></i></a>
                                </div>
                                <div id="change-lang" style="margin-left: 20px;">
                                    <a href="#" data-lang="en">English</a> |
                                    <a href="#" data-lang="vi">Tiếng Việt</a>
                                </div>
                            </div>

                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-md-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
</header>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var currentLang = 'en';

    function loadMessages(lang) {
        $.getJSON('/lang/messages_' + lang + '.json', function(data) {
            $('[data-i18n]').each(function() {
                var key = $(this).data('i18n');
                $(this).text(data[key]);
            });
            $('#title').text(data['header.welcome']);
        });
    }

    $(document).ready(function() {
        loadMessages(currentLang);

        $('#change-lang a').click(function(e) {
            e.preventDefault();
            currentLang = $(this).data('lang');
            loadMessages(currentLang);
        });
    });
</script>
</body>
</html>
