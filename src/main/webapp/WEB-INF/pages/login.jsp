<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link rel="stylesheet" href="../../assets/css/style2.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-in-container">
        <form id="loginForm" action="#">
            <h1>Sign in</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your account</span>
            <input type="text" name="username" id="username" placeholder="Username" autocomplete="username"/>
            <input type="password" name="password" id="password" placeholder="Password" autocomplete="current-password"/>
            <div id="loginError" class="error-message"></div>
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
            <button type="submit" id="loginButton">Sign In</button>
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

<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const loginForm = document.getElementById('loginForm');
        const loginError = document.getElementById('loginError');

        if (loginForm) {
            loginForm.addEventListener('submit', async function(event) {
                event.preventDefault();
                const formData = new FormData(this); // Capture form data

                // Convert FormData to JSON object
                const formDataJson = {};
                for (const [key, value] of formData.entries()) {
                    formDataJson[key] = value;
                }

                try {
                    const response = await fetch('/checklogin', {
                        method: 'POST',
                        body: JSON.stringify(formDataJson), // Convert to JSON string
                        headers: {
                            'Content-Type': 'application/json',
                            'User-agent': 'news app',
                        }
                    });

                    const responseData = await response.json();

                    if (responseData.success) {
                        Swal.fire({
                            title: 'Login Success!',
                            text: 'You have successfully logged in.',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                if (responseData.role === 'ADMIN') {
                                    window.location.href = '/admin';
                                } else {
                                    window.location.href = '/index';
                                }
                            }
                        });
                    } else {
                        loginError.innerText = responseData.message || 'Login failed. Please try again.';
                        loginError.style.display = 'block';
                    }
                } catch (error) {
                    console.error('Login failed:', error);
                    loginError.innerText = 'Login failed. Please try again.';
                    loginError.style.display = 'block';
                }
            });
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const signUpButton = document.getElementById('signUp');
        if (signUpButton) {
            signUpButton.addEventListener('click', function() {
                window.location.href = '/signUp';
            });
        }
    });
</script>

</body>
</html>
