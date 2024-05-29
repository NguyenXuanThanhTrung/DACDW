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
    $(document).ready(function () {
    $('#username').on('blur', function () {
        var username = $(this).val();
        $.ajax({
            url: '/checkUsername',
            type: 'GET',
            data: {username: username},
            success: function (response) {
                var result = JSON.parse(response);
                if (result.exists) {
                    // Tên người dùng đã tồn tại
                    alert('Tên người dùng đã tồn tại!');
                }
            }
        });
    });
});
</script>
<script>
    $(document).ready(function() {
        $('#loginButton').click(function(event) {
            event.preventDefault();
            var email = $('input[placeholder="Email"]').val();
            var password = $('input[placeholder="Password"]').val();

            if (email === "" || password === "") {
                alert("Both fields are required.");
                return;
            }

            $.ajax({
                url: '/login',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ email: email, password: password }),
                success: function(response) {
                    if (response.success) {
                        window.location.href = '/dashboard';
                    } else {
                        alert("Invalid email or password.");
                    }
                },
                error: function() {
                    alert("Error logging in.");
                }
            });
        });
    });
</script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
