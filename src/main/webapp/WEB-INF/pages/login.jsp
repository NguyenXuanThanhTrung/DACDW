<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link rel="stylesheet" href="../../assets/css/style2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-in-container">
        <form action="#">
            <h1>Sign in</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your account</span>
            <input type="email" placeholder="Email"/>
            <input type="password" placeholder="Password"/>
            <div id="passwordError" class="error-message"></div>
            <style>
                .error-message {
                    color: red; /* Đặt màu chữ cho thông báo lỗi */
                    background-color: rgba(255, 0, 0, 0.1); /* Đặt màu nền cho thông báo lỗi */
                    padding: 5px; /* Tăng độ rộng và độ cao của phần tử chứa thông báo lỗi */
                    margin-top: 5px; /* Tăng khoảng cách giữa ô nhập liệu và thông báo lỗi */
                    border-radius: 3px; /* Làm tròn các góc của phần tử chứa thông báo lỗi */
                }
            </style>
            <a href="#">Forgot your password?</a>
            <button id="loginButton">Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        window.location.href = 'signUp';
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>
<script>
    const loginButton = document.getElementById('loginButton');

    loginButton.addEventListener('click', () => {
        // Lấy giá trị email và password từ các input
        const emailInput = document.querySelector('input[type="email"]');
        const passwordInput = document.querySelector('input[type="password"]');
        const email = emailInput.value;
        const password = passwordInput.value;
        const passwordError = document.getElementById('passwordError'); // Lấy phần tử chứa thông báo lỗi

        // Biểu thức chính quy để kiểm tra định dạng email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Kiểm tra xem email và password có được nhập vào không
        if (!email || !password) {
            passwordError.innerText = 'Vui lòng điền đầy đủ thông tin.'; // Hiển thị thông báo lỗi
            return;
        }

        // Kiểm tra định dạng email
        if (!emailRegex.test(email)) {
            passwordError.innerText = 'Địa chỉ email không hợp lệ.'; // Hiển thị thông báo lỗi
            return;
        }

        // Kiểm tra xem password có ít nhất 8 kí tự không
        if (password.length < 8) {
            passwordError.innerText = 'Mật khẩu phải có ít nhất 8 kí tự.'; // Hiển thị thông báo lỗi
            return;
        }

        // Xóa thông báo lỗi nếu không có lỗi
        passwordError.innerText = '';

        // Thực hiện AJAX request
        $.ajax({
            url: '/login', // Địa chỉ của endpoint xử lý đăng nhập
            method: 'POST', // Hoặc 'GET' tùy thuộc vào cách bạn đã thiết lập máy chủ
            data: { email: email, password: password }, // Dữ liệu gửi đi
            success: function(response) {
                // Xử lý kết quả thành công
                console.log('Login successful');
                // Redirect hoặc thực hiện các hành động khác tại đây
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi
                console.error('Login failed:', error);
            }
        });
    });

</script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
