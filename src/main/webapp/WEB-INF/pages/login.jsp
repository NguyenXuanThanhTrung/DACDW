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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
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
            <input type="text" id="username" placeholder="Username"/>
            <input type="password" id="password" placeholder="Password"/>
            <div id="passwordError" class="error-message"></div>
            <style>
                .error-message {
                    color: red;
                    background-color: rgba(255, 0, 0, 0.1);
                    padding: 5px;
                    margin-top: 5px;
                    border-radius: 3px;
                    display: none;
                }
            </style>
            <a href="#">Forgot your password?</a>
            <button type="button" id="loginButton">Sign In</button>
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
        const usernameInput = document.getElementById('username');
        const passwordInput = document.getElementById('password');
        const username = usernameInput.value;
        const password = passwordInput.value;
        const passwordError = document.getElementById('passwordError');

        if (!username || !password) {
            passwordError.innerText = 'Please complete all information.';
            return;
        }

        if (password.length < 8) {
            passwordError.innerText = 'Password must have at least 8 characters.';
            return;
        }

        passwordError.innerText = '';

        $.ajax({
            url: '/checklogin',
            method: 'POST',
            data: { username: username, password: password },
            success: function(response) {
                if (response.success) {
                    Swal.fire({
                        title: 'Login Success!',
                        text: 'You have successfully logged in.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            if (response.role === 'ADMIN') {
                                window.location.href = '/admin';
                            } else {
                                window.location.href = '/user';
                            }
                        }
                    });
                } else {
                    passwordError.innerText = response.message;
                }
            },
            error: function(xhr, status, error) {
                console.error('Login failed:', error);
                passwordError.innerText = 'Login failed. Please try again.';
            }
        });
    });
</script>

<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
