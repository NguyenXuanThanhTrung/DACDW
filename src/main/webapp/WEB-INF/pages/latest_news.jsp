<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>News HTML-5 Template </title>
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
    <link rel="stylesheet" href="../../assets/css/contact.css">
</head>
<body>
<!-- Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="<%= request.getContextPath() %>/../../assets/img/logo/logo.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Preloader Start -->
<jsp:include page="header.jsp"/>
<main>
    <!-- About US Start -->
    <div class="about-area2 gray-bg pt-60 pb-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Trending Tittle -->
                    <div class="about-right mb-90">
                        <div class="about-img">
                            <img src="<%= request.getContextPath() %>/../../assets/img/trending/trending_top.jpg"
                                 alt="">
                        </div>
                        <div class="heading-news mb-30 pt-30">
                            <h3>Here come the moms in space</h3>
                        </div>
                        <div class="about-prea">
                            <p class="about-pera1 mb-25">Moms are like…buttons? Moms are like glue. Moms are like pizza
                                crusts. Moms are the ones who make sure things happen—from birth to school lunch.</p>
                            <p class="about-pera1 mb-25">Moms are like…buttons? Moms are like glue. Moms are like pizza
                                crusts. Moms are the ones who make sure things happen—from birth to school lunch.</p>
                            <p class="about-pera1 mb-25">
                                My hero when I was a kid was my mom. Same for everyone I knew. Moms are untouchable.
                                They’re elegant, smart, beautiful, kind…everything we want to be. At 29 years old, my
                                favorite compliment is being told that I look like my mom. Seeing myself in her image,
                                like this daughter up top, makes me so proud of how far I’ve come, and so thankful for
                                where I come from.
                                the refractor telescope uses a convex lens to focus the light on the eyepiece.
                                The reflector telescope has a concave lens which means it telescope sits on. The mount
                                is the actual tripod and the wedge is the device that lets you attach the telescope to
                                the mount.
                                Moms are like…buttons? Moms are like glue. Moms are like pizza crusts. Moms are the ones
                                who make sure things happen—from birth to school lunch.</p>
                        </div>
                        <div class="section-tittle mb-30 pt-30">
                            <h3>Unordered list style?</h3>
                        </div>
                        <div class="about-prea">
                            <p class="about-pera1 mb-25">Moms are like…buttons? Moms are like glue. Moms are like pizza
                                crusts. Moms are the ones who make sure things happen—from birth to school lunch.</p>
                            <p class="about-pera1 mb-25">Moms are like…buttons? Moms are like glue. Moms are like pizza
                                crusts. Moms are the ones who make sure things happen—from birth to school lunch.</p>
                            <p class="about-pera1 mb-25">
                                My hero when I was a kid was my mom. Same for everyone I knew. Moms are untouchable.
                                They’re elegant, smart, beautiful, kind…everything we want to be. At 29 years old, my
                                favorite compliment is being told that I look like my mom. Seeing myself in her image,
                                like this daughter up top, makes me so proud of how far I’ve come, and so thankful for
                                where I come from.
                                the refractor telescope uses a convex lens to focus the light on the eyepiece.
                                The reflector telescope has a concave lens which means it telescope sits on. The mount
                                is the actual tripod and the wedge is the device that lets you attach the telescope to
                                the mount.
                                Moms are like…buttons? Moms are like glue. Moms are like pizza crusts. Moms are the ones
                                who make sure things happen—from birth to school lunch.</p>
                        </div>
                        <div class="social-share pt-30">
                            <div class="section-tittle">
                                <h3 class="mr-20">Share:</h3>
                                <ul>
                                    <li><a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-ins.png"
                                            alt=""></a></li>
                                    <li><a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-fb.png"
                                            alt=""></a></li>
                                    <li><a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-tw.png"
                                            alt=""></a></li>
                                    <li><a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-yo.png"
                                            alt=""></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- From -->
                    <div class="row">
                        <div class="col-lg-8" id="latest-news-container">
                            <form class="form-contact contact_form mb-80" action="contact_process.php" method="post"
                                  id="contactForm" novalidate="novalidate">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <textarea class="form-control w-100 error" name="message" id="message"
                                                      cols="30" rows="9" onfocus="this.placeholder = ''"
                                                      onblur="this.placeholder = 'Enter Message'"
                                                      placeholder="Enter Message"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control error" name="name" id="name" type="text"
                                                   onfocus="this.placeholder = ''"
                                                   onblur="this.placeholder = 'Enter your name'"
                                                   placeholder="Enter your name">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control error" name="email" id="email" type="email"
                                                   onfocus="this.placeholder = ''"
                                                   onblur="this.placeholder = 'Enter email address'"
                                                   placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input class="form-control error" name="subject" id="subject" type="text"
                                                   onfocus="this.placeholder = ''"
                                                   onblur="this.placeholder = 'Enter Subject'"
                                                   placeholder="Enter Subject">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <button type="submit" class="button button-contactForm boxed-btn boxed-btn2">Send
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- Flow Socail -->
                    <div class="single-follow mb-45">
                        <div class="single-box">
                            <div class="follow-us d-flex align-items-center">
                                <div class="follow-social">
                                    <a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-fb.png"
                                            alt=""></a>
                                </div>
                                <div class="follow-count">
                                    <span>8,045</span>
                                    <p>Fans</p>
                                </div>
                            </div>
                            <div class="follow-us d-flex align-items-center">
                                <div class="follow-social">
                                    <a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-tw.png"
                                            alt=""></a>
                                </div>
                                <div class="follow-count">
                                    <span>8,045</span>
                                    <p>Fans</p>
                                </div>
                            </div>
                            <div class="follow-us d-flex align-items-center">
                                <div class="follow-social">
                                    <a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-ins.png"
                                            alt=""></a>
                                </div>
                                <div class="follow-count">
                                    <span>8,045</span>
                                    <p>Fans</p>
                                </div>
                            </div>
                            <div class="follow-us d-flex align-items-center">
                                <div class="follow-social">
                                    <a href="#"><img
                                            src="<%= request.getContextPath() %>/../../assets/img/news/icon-yo.png"
                                            alt=""></a>
                                </div>
                                <div class="follow-count">
                                    <span>8,045</span>
                                    <p>Fans</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- New Poster -->
                    <div class="news-poster d-none d-lg-block">
                        <img src="<%= request.getContextPath() %>/../../assets/img/news/news_card.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About US End -->
</main>
<jsp:include page="footer.jsp"/>
<!-- Search model Begin -->
<div class="search-model-box">
    <div class="d-flex align-items-center h-100 justify-content-center">
        <div class="search-close-btn">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Searching key.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- JS here -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#contactForm').on('submit', function (event) {
            event.preventDefault(); // Ngăn form gửi theo cách thông thường

            var name = $('#name').val().trim();
            var email = $('#email').val().trim();
            var subject = $('#subject').val().trim();
            var message = $('#message').val().trim();

            // Kiểm tra các trường dữ liệu
            if (name === "" || email === "" || subject === "" || message === "") {
                alert('Please fill out all fields');
                return;
            }

            // Kiểm tra định dạng email
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address');
                return;
            }

            var formData = {
                name: name,
                email: email,
                subject: subject,
                message: message
            };

            $.ajax({
                type: 'POST',
                url: '<%= request.getContextPath() %>/api/contact',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (response) {
                    alert('Form submitted successfully');
                    $('#contactForm')[0].reset(); // Reset form
                },
                error: function (error) {
                    alert('An error occurred while submitting the form');
                    console.log(error);
                }
            });
        });
    });

</script>
<script>
    $(document).ready(function () {
        function loadLatestNews() {
            $.ajax({
                url: '<%= request.getContextPath() %>/api/latest-news',
                method: 'GET',
                success: function (data) {
                    var newsContainer = $('#latest-news-container');
                    newsContainer.empty();
                    data.forEach(function (news) {
                        var newsItem = '<div class="about-right mb-90">' +
                            '<div class="about-img">' +
                            '<img src="<%= request.getContextPath() %>/../../assets/img/trending/trending_top.jpg" alt="">' +
                            '</div>' +
                            '<div class="heading-news mb-30 pt-30">' +
                            '<h3>' + news.title + '</h3>' +
                            '</div>' +
                            '<div class="about-prea">' +
                            '<p class="about-pera1 mb-25">' + news.description + '</p>' +
                            '</div>' +
                            '</div>';
                        newsContainer.append(newsItem);
                    });
                },
                error: function (error) {
                    console.error('Error loading latest news:', error);
                }
            });
        }

        // Load latest news on page load
        loadLatestNews();
    });
</script>
<script src="../../assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="../../assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="../../assets/js/popper.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="../../assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="../../assets/js/owl.carousel.min.js"></script>
<script src="../../assets/js/slick.min.js"></script>
<!-- Date Picker -->
<script src="../../assets/js/gijgo.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="../../assets/js/wow.min.js"></script>
<script src="../../assets/js/animated.headline.js"></script>
<script src="../../assets/js/jquery.magnific-popup.js"></script>

<!-- Scrollup, nice-select, sticky -->
<script src="../../assets/js/jquery.scrollUp.min.js"></script>
<script src="../../assets/js/jquery.nice-select.min.js"></script>
<script src="../../assets/js/jquery.sticky.js"></script>

<!-- contact js -->
<script src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script>
<script>
    $(document).ready(function () {
        (function ($) {
            "use strict";
            jQuery.validator.addMethod('answercheck', function (value, element) {
                return this.optional(element) || /^\bcat\b$/.test(value);
            }, "Please type the correct answer.");

            $('#contactForm').validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2
                    },
                    subject: {
                        required: true,
                        minlength: 4
                    },
                    number: {
                        required: true,
                        minlength: 5
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    message: {
                        required: true,
                        minlength: 20
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name.",
                        minlength: "Your name must be at least 2 characters long."
                    },
                    subject: {
                        required: "Please enter a subject.",
                        minlength: "The subject must be at least 4 characters long."
                    },
                    number: {
                        required: "Please enter your number.",
                        minlength: "Your number must be at least 5 characters long."
                    },
                    email: {
                        required: "Please enter your email address.",
                        email: "Please enter a valid email address."
                    },
                    message: {
                        required: "Please write your message.",
                        minlength: "Your message must be at least 20 characters long."
                    }
                },
                errorClass: "error",
                errorPlacement: function (error, element) {
                    if (element.attr("name") === "name" || element.attr("name") === "subject" || element.attr("name") === "number" || element.attr("name") === "email") {
                        error.addClass("required");
                    } else if (element.attr("name") === "message") {
                        error.addClass("minlength");
                    }
                    error.insertAfter(element);
                }
            });
        })(jQuery);
    });
</script>
<script src="../../assets/js/jquery.form.js"></script>
<script src="../../assets/js/jquery.validate.min.js"></script>
<script src="../../assets/js/mail-script.js"></script>
<script src="../../assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->
<script src="../../assets/js/plugins.js"></script>
<script src="../../assets/js/main.js"></script>

</body>
</html>