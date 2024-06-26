<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="../../assets/css/style2.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>
        .error-message {
            color: red;
            background-color: rgba(255, 0, 0, 0.1);
            padding: 5px;
            margin-top: 5px;
            border-radius: 3px;
            display: none;
        }
        .scrollable {
            max-height: 400px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<div class="container right-panel-active" id="container">
    <div class="form-container sign-up-container">
        <div class="scrollable">
            <form id="signUpForm">
                <h1>Create Account</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>or use your email for registration</span>
                <input type="text" name="name" placeholder="Name" required autocomplete="name"/>
                <input type="text" name="address" placeholder="Address" required autocomplete="address-line1"/>
                <input type="email" name="email" placeholder="Email" required autocomplete="email"/>
                <input type="text" name="phoneNumber" placeholder="Phone Number" required autocomplete="tel"/>
                <input type="text" name="username" placeholder="Username" required autocomplete="username"/>
                <input type="password" name="password" placeholder="Password" required autocomplete="new-password"/>
                <input type="password" id="confirmPassword" placeholder="Confirm Password" required autocomplete="new-password"/>
                <input type="date" name="dateOfBirth" placeholder="Date of Birth" required autocomplete="bday"/>
                <select name="sex" required autocomplete="sex">
                    <option value="" disabled selected>Sex</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
                <div id="passwordError" class="error-message"></div>
                <br>
                <button type="submit" id="signUpButton">Sign Up</button>
            </form>
        </div>
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
    const signUpForm = document.getElementById('signUpForm');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordError = document.getElementById('passwordError');

    signUpForm.addEventListener('submit', (event) => {
        event.preventDefault();

        const formData = new FormData(signUpForm);
        const name = formData.get('name');
        const address = formData.get('address');
        const email = formData.get('email');
        const phoneNumber = formData.get('phoneNumber');
        const username = formData.get('username');
        const password = formData.get('password');
        const confirmPassword = confirmPasswordInput.value;
        const sex = formData.get('sex');
        const dateOfBirth = formData.get('dateOfBirth');

        // Check if all fields are filled
        if (!name || !address || !email || !phoneNumber || !username || !password || !confirmPassword || !sex || !dateOfBirth) {
            passwordError.style.display = 'block';
            passwordError.innerText = 'Please fill in all fields.';
            return;
        }

        // Check email format
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            passwordError.style.display = 'block';
            passwordError.innerText = 'Email address is not valid.';
            return;
        }

        // Check if password is at least 8 characters
        if (password.length < 8) {
            passwordError.style.display = 'block';
            passwordError.innerText = 'Password must be at least 8 characters.';
            return;
        }

        // Check if password and confirm password match
        if (password !== confirmPassword) {
            passwordError.style.display = 'block';
            passwordError.innerText = 'Password and confirm password do not match.';
            return;
        }

        passwordError.style.display = 'none';

        $.ajax({
            url: '/signUp',
            method: 'POST',
            data: {
                name: name,
                address: address,
                email: email,
                phoneNumber: phoneNumber,
                username: username,
                password: password,
                sex: sex,
                dateOfBirth: dateOfBirth
            },
            success: function(response) {
                if (response.success) {
                    Swal.fire({
                        title: 'Sign Up Success!',
                        text: 'You have successfully signed up.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = '/login';
                        }
                    });
                } else {
                    passwordError.style.display = 'block';
                    passwordError.innerText = response.message;
                }
            },
            error: function(xhr, status, error) {
                console.error('Sign up failed:', error);
                passwordError.style.display = 'block';
                passwordError.innerText = 'Sign up failed. Please try again.';
            }
        });
    });
</script>

<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
