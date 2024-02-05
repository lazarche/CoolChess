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

<c:if test="${not empty friendRequest}">
    <script>
        alert("${friendRequest}");
    </script>
</c:if>

<div class="container">
    <div class="friends-list">
        <div class="friends-list-title"> Friend List </div>
        <div class="friends-list-separator"></div>
        <div class="friends-list-add-friend">
            <form action="/CoolChess/friends/addFriend" method="post">
                <input type="text" placeholder="Search..." name="userName">
                <input type="submit" value="&#x1F50D">
            </form>
        </div>
        <c:if test="${not empty friendships}">
            <c:forEach var="player" items="${friendships}">
                <a href="/CoolChess/friends/getPage?chatWithUser=${player.username}">
                    <div class="friends-list-friend">
                        ${player.username}
                    </div>
                </a>
            </c:forEach>
        </c:if>
        <c:if test="${not empty friendship_requests}">
            <div class="friends-list-separator"></div>
            <div class="friends-list-title"> Friend Requests</div>
            <c:forEach var="player" items="${friendship_requests}">
                <a><div class="friends-list-friendrequest">
                    <a href="/CoolChess/friends/replyFriend?userName=${player.username}&result=friend"><button class="friends-list-friendrequest-accept"> </button></a>
                        ${player.username}
                    <a href="/CoolChess/friends/replyFriend?userName=${player.username}&result=block"><button class="friends-list-friendrequest-deny"> </button></a>
                </div></a>
            </c:forEach>
        </c:if>


    </div>
    <div class="friends-chatcontainer">
        <div class="friends-chat-title">Messages</div>
        <div class="friends-chat-view">
            <c:if test="${not empty messages}">
                <c:forEach var="message" items="${messages}">
                    <c:if test="${message.player.username == chatWith}">
                        <div class="messageReceived" timetext="${message.time}">
                                ${message.player.username}: ${message.content}
                                <span class="timetext">
                                        ${message.time}
                                </span>
                        </div>
                    </c:if>
                    <c:if test="${message.player.username != chatWith}">
                        <div class="messageSent">
                                ${message.player.username}: ${message.content}
                                <span class="timetext">
                                        ${message.time}
                                </span>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
        <div class="friends-chat-box">
            <form action="/CoolChess/friends/sendMessage" method="post">
                <input type="textarea" name="context">
                <c:if test="${not empty chatWith}">
                <input type ="hidden" name="receiverUsername" value="${chatWith}">
                </c:if>
                <input type="submit" value="SEND">
            </form>
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
