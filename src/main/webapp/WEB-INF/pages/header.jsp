<%@ page import="fit.hcmuaf.news.entity.Users" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <!-- Header Start -->
    <div class="header-area">
        <div class="main-header ">
            <div class="header-top black-bg d-none d-sm-block">
                <div class="container">
                    <div class="col-xl-12">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="header-info-left">
                                <ul>
                                    <li class="title"><span class="flaticon-energy"></span> trending-title</li>
                                    <li>Class property employ ancho red multi level mansion</li>
                                </ul>
                            </div>
                            <div class="header-info-right">
                                <ul class="header-date">
                                    <li><span class="flaticon-calendar"></span> +880166 253 232</li>
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
                            <div class="header-banner f-right ">
                                <img src="<%= request.getContextPath() %>/../../assets/img/gallery/header_card.png"
                                     alt="">
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
                                        <li><a href="<%= request.getContextPath() %>/index">Home</a></li>
                                        <li><a href="<%= request.getContextPath() %>/about">About</a></li>
                                        <li><a href="<%= request.getContextPath() %>/categori">Category</a></li>
                                        <li><a href="<%= request.getContextPath() %>/latest_news">Latest News</a></li>
                                        <li><a href="#">Pages</a>
                                            <ul class="submenu">
                                                <li><a href="<%= request.getContextPath() %>/blog">Blog</a></li>
                                                <li><a href="<%= request.getContextPath() %>/blog_details">Blog
                                                    Details</a></li>
                                                <li><a href="<%= request.getContextPath() %>/elements">Element</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="<%= request.getContextPath() %>/contact">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4">
                            <!-- Header Right -->
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

                                <!-- User Icon -->
                                <% Users user = (Users) session.getAttribute("user");
                                    if (user != null) { %>
                                <!-- Hiển thị icon user và username -->
                                <div style="display: inline-block; margin-left: 10px;">
                                    <a href="<%= request.getContextPath() %>/user">
                                        <i class="fas fa-user"></i>
                                    </a>
                                </div>
                                <div style="display: inline-block; margin-left: 10px;">
                                    <!-- Dropdown menu cho user đã đăng nhập -->
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" id="userDropdownMenuLink" data-toggle="dropdown"
                                           aria-haspopup="true" aria-expanded="false">
                                            <%= user.getUsername() %>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="userDropdownMenuLink">
                                            <a class="dropdown-item" href="#" onclick="redirectToProfile()">View Profile</a>
                                            <a class="dropdown-item" href="<%= request.getContextPath() %>/logout">Logout</a>
                                        </div>
                                    </div>
                                </div>
                                <% } else { %>
                                <!-- Icon đăng nhập -->
                                <div style="display: inline-block; margin-left: 10px;">
                                    <a href="<%= request.getContextPath() %>/login">
                                        <i class="fa fa-sign-in-alt"></i>
                                    </a>
                                </div>
                                <% } %>
                                <!-- Mobile Menu -->
                                <div class="col-12">
                                    <div class="mobile_menu d-block d-md-none"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
    <script>
        function redirectToProfile() {
            window.location.href = '<%= request.getContextPath() %>/user/profile';
        }
    </script>
</header>
