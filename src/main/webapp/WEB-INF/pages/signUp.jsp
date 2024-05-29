<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="../../assets/css/style2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="container right-panel-active" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>Create Account</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="text" placeholder="Name" />
            <input type="email" placeholder="Email" />
            <input type="password" placeholder="Password" />
            <input type="password" placeholder="Confirm Password" id="confirmPassword" />
            <div id="passwordError" class="error-message"></div>
            <br>
            <style>
                .error-message {
                    color: red; /* Đặt màu chữ cho thông báo lỗi */
                    background-color: rgba(255, 0, 0, 0.1); /* Đặt màu nền cho thông báo lỗi */
                    padding: 5px; /* Tăng độ rộng và độ cao của phần tử chứa thông báo lỗi */
                    margin-top: 5px; /* Tăng khoảng cách giữa ô nhập liệu và thông báo lỗi */
                    border-radius: 3px; /* Làm tròn các góc của phần tử chứa thông báo lỗi */
                }
            </style>
            <button id="signUpButton">Sign Up</button>
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
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        window.location.href = 'login';
    });
</script>

<script>
    const signUpForm = document.querySelector('.sign-up-container form');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordError = document.getElementById('passwordError');

    signUpForm.addEventListener('submit', (event) => {
        event.preventDefault();

        const name = signUpForm.querySelector('input[type="text"]').value;
        const email = signUpForm.querySelector('input[type="email"]').value;
        const password = signUpForm.querySelector('input[type="password"]').value;
        const confirmPassword = confirmPasswordInput.value;

        // Biểu thức chính quy để kiểm tra định dạng email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Kiểm tra xem email và password có được nhập vào không
        if (!name || !email || !password || !confirmPassword) {
            passwordError.innerText = 'Vui lòng điền đầy đủ thông tin.';
            return;
        }

        // Kiểm tra định dạng email
        if (!emailRegex.test(email)) {
            passwordError.innerText = 'Địa chỉ email không hợp lệ.';
            return;
        }

        // Kiểm tra xem password có ít nhất 8 kí tự không
        if (password.length < 8) {
            passwordError.innerText = 'Mật khẩu phải có ít nhất 8 kí tự.';
            return;
        }

        // Kiểm tra xem password và confirm password có khớp nhau không
        if (password !== confirmPassword) {
            passwordError.innerText = 'Mật khẩu và xác nhận mật khẩu không khớp nhau.';
            return;
        }
        passwordError.innerText = '';

        $.ajax({
            url: '/signUp', // Địa chỉ của endpoint xử lý đăng ký
            method: 'POST', // Hoặc 'GET' tùy thuộc vào cách bạn đã thiết lập máy chủ
            data: {name:name, email: email, password: password, confirmPassword: confirmPassword }, // Dữ liệu gửi đi
            success: function(response) {
                // Xử lý kết quả thành công
                console.log('Sign up successful');
                // Redirect hoặc thực hiện các hành động khác tại đây
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi
                console.error('Sign up failed:', error);
            }
        });
    });
</script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
