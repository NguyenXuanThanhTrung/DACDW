<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <!-- Footer Start-->
    <div class="footer-main footer-bg">
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-8">
                        <div class="single-footer-caption mb-50">
                            <div class="single-footer-caption mb-30">
                                <!-- logo -->
                                <div class="footer-logo">
                                    <a href="index"><img src="<%= request.getContextPath() %>/../../assets/img/logo/logo2_footer.png" alt=""></a>
                                </div>
                                <div class="footer-tittle">
                                    <div class="footer-pera">
                                        <p class="info1" data-i18n="info1" >Lorem ipsum dolor sit amet, nsectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                        <p class="info2_address" data-i18n="info2_address">198 West 21th Street, Suite 721 New York, NY 10010</p>
                                        <p class="info2_phone" data-i18n="info2_phone">Phone: +95 (0) 123 456 789 Cell: +95 (0) 123 456 789</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-5 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4 data-i18n="popular_post">Popular post</h4>
                            </div>
                            <!-- Popular post -->
                            <div class="whats-right-single mb-20">
                                <div class="whats-right-img">
                                    <img src="<%= request.getContextPath() %>/../../assets/img/gallery/footer_post1.png" alt="">
                                </div>
                                <div class="whats-right-cap">
                                    <h4><a href="<%= request.getContextPath() %>/latest_news" data-i18n="latest_news">Scarlett’s disappointment at latest accolade</a></h4>
                                    <p data-i18n="latest_news_time">Jhon | 2 hours ago</p>
                                </div>
                            </div>
                            <div class="whats-right-single mb-20">
                                <div class="whats-right-img">
                                    <img src="<%= request.getContextPath() %>/../../assets/img/gallery/footer_post2.png" alt="">
                                </div>
                                <div class="whats-right-cap">
                                    <h4><a href="<%= request.getContextPath() %>/latest_news" data-i18n="latest_news">Scarlett’s disappointment at latest accolade</a></h4>
                                    <p data-i18n="latest_news_time">Jhon | 2 hours ago</p>
                                </div>
                            </div>
                            <div class="whats-right-single mb-20">
                                <div class="whats-right-img">
                                    <img src="<%= request.getContextPath() %>/../../assets/img/gallery/footer_post3.png" alt="">
                                </div>
                                <div class="whats-right-cap">
                                    <h4><a href="<%= request.getContextPath() %>/latest_news" data-i18n="latest_news">Scarlett’s disappointment at latest accolade</a></h4>
                                    <p data-i18n="latest_news_time">Jhon | 2 hours ago</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="banner">
                                <img src="<%= request.getContextPath() %>/../../assets/img/gallery/body_card4.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer-bottom aera -->
        <div class="footer-bottom-area footer-bg">
            <div class="container">
                <div class="footer-border">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-12 ">
                            <div class="footer-copy-right text-center">
                                <p>
                                    <span data-i18n="footer_copyright">All rights reserved | This template is made with</span> <i class="fa fa-heart"
                                                                                                                                  aria-hidden="true"></i> by <a
                                        href="https://colorlib.com" target="_blank">Colorlib</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End-->
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var currentLang = 'en';

    function loadMessages(lang) {
        $.getJSON('/lang/messages_' + lang + '.json', function(data) {
            $('[data-i18n]').each(function() {
                var key = $(this).data('i18n');
                $(this).text(data[key]);
            });
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
