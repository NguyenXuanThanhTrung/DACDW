<%--
  Created by IntelliJ IDEA.
  User: KAKASHI
  Date: 6/5/2024
  Time: 1:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>News Details</title>
</head>
<body>
<h1>${news.title}</h1>
<p>${news.idNews}</p>
<p>${news.content}</p>
<p>${news.numberofreads}</p>
<img src="${news.image}" alt="${news.title}" />

</body>
</html>
