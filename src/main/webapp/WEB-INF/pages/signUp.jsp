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
    $(document).ready(function() {
        $('#username').on('blur', function() {
            var username = $(this).val();
            $.ajax({
                url: '/checkUsername',
                type: 'GET',
                data: { username: username },
                success: function(response) {
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
        $('#signUpButton').click(function(event) {
            event.preventDefault();
            var name = $('input[placeholder="Name"]').val();
            var email = $('input[placeholder="Email"]').val();
            var password = $('input[placeholder="Password"]').val();
            var confirmPassword = $('#confirmPassword').val();

            if (name === "" || email === "" || password === "" || confirmPassword === "") {
                alert("All fields are required.");
                return;
            }

            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return;
            }

            $.ajax({
                url: '/check-username',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ email: email }),
                success: function(response) {
                    if (response.exists) {
                        alert("Email is already registered.");
                    } else {
                        $('form').submit();
                    }
                },
                error: function() {
                    alert("Error checking email.");
                }
            });
        });
    });
</script>

<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
