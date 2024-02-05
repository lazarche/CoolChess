<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Roboto:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
    <title>Cool Chess</title>
</head>
<body>

<header>
    <div>
        <a href="/CoolChess/main">Home</a>
        <a href="/CoolChess/play">Play</a>
        <security:authorize access="isAuthenticated()">
            <a href="/CoolChess/stats/userStats">Stats</a>
            <a href="/CoolChess/friends/getPage">Friends</a>
        </security:authorize>
    </div>
    <div>
        <security:authorize access="isAnonymous()">
            <a href="/CoolChess/auth/loginPage">Login</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
<%--            <a href="#">Profile</a>--%>
            <a href="/CoolChess/auth/logout">Logout</a>
        </security:authorize>
    </div>
</header>
<div class="container">
    <div class="content">
        <img class="auth-logo" src="${pageContext.request.contextPath}/static/images/logo.png">

        <form action="/CoolChess/game/joinGame" method="get">
            <input type="text" name="invite" placeholder="invite" required>
            <br>
            <input type="submit" value="Join Game">
        </form>
    </div>
</div>

<footer>
    <div class="copyright-footer">
        <span style="color:white">Made by Lazar Borovica</span>
    </div>
</footer>

</body>
</html>
