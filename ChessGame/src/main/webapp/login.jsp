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
        <div class="auth-container">
            <h3> User registration </h3>

            <c:url var="loginUrl" value="/login" />
            <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
                <div>
                    <p class="submit-message red">Check your data.</p>
                </div>
            </c:if>
            <form action="${loginUrl}" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="submit" value="Log in">
            </form>
            <div class="label-container">
                You don't have account? <a href="/CoolChess/auth/registerPage">Register</a>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="copyright-footer">
        <span style="color:white">Made by Lazar Borovica</span>
    </div>
</footer>
</body>
</html>
