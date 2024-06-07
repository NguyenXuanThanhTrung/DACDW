<%@ page import="fit.hcmuaf.news.entity.Users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .profile-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
        }

        .profile-container h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .profile-container p {
            color: #666;
            margin-bottom: 10px;
        }

        .profile-container .fa-user {
            color: #007bff;
            font-size: 50px;
            margin-bottom: 20px;
        }

        .profile-container ul {
            list-style: none;
            padding: 0;
            margin-bottom: 20px;
        }

        .profile-container ul li {
            display: inline-block;
            margin-right: 10px;
        }

        .profile-container ul li a {
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .profile-container ul li a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="profile-container">
    <!-- Header Navigation -->
    <ul>
        <li><a href="/index">Home</a></li>
        <li class="active"><a href="/user/profile">Profile</a></li>
    </ul>
    <i class="fas fa-user"></i>
    <h1>User Profile</h1>
    <% Users user = (Users) session.getAttribute("user");
        if (user != null) { %>
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Username:</strong> <%= user.getUsername() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Address:</strong> <%= user.getAddress() %></p>
    <p><strong>Phone Number:</strong> <%= user.getPhonenumber() %></p>
    <p><strong>Sex:</strong> <%= user.getSex() %></p>
    <p><strong>Date of Birth:</strong> <%= user.getDateofbirth() %></p>
    <% } else { %>
    <p>No user logged in.</p>
    <% } %>
</div>
</body>
</html>
