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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/statsStyle.css" >
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
    <div class="matchhistory-container">
        <div class ="stats-main-title">&#9876; Match History &#9876;
            <a href="/CoolChess/stats/reportMatchHistory" ><button class="matchhistory-export-button"> &#8595; </button></a>
        </div>
        <div class="matchhistory-container-inner">
            <c:if test="${not empty matches}">
                <c:forEach var="chessmatch" items="${matches}">
                    <div class="matchhistory-match">
                        <div class="matchhistory-match-title"> ${chessmatch.username} vs ${chessmatch.opponentUsername}           ~${chessmatch.status}~
                            <a class="matchhistory-match-export" href="/CoolChess/stats/reportMatch?idMatch=${chessmatch.idMatch}"><button class="matchhistory-export-button"> &#8595; </button></a>
                        </div>
                        <div class="matchhistory-match-content"> Date: ${chessmatch.date}  Number of moves: ${chessmatch.numberOfMoves}</div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
    <div class="stats-container">
        <div>
            <div class ="stats-main-title">
                Stats
            </div>
            <c:if test="${not empty statsData}">
            </c:if>
            <div class="stats-separator"></div>
            <div class="stats-title"> Username </div>
            <div class="stats-container"> ${statsData.username} </div>
            <div class="stats-separator"></div>
            <div class="stats-title"> Total Games </div>
            <div class="stats-container"> ${statsData.total} </div>
            <div class="stats-separator"></div>
            <div class="stats-title"> Wins </div>
            <div class="stats-container"> ${statsData.wins}</div>
            <div class="stats-separator"></div>
            <div class="stats-title"> Loses</div>
            <div class="stats-container"> ${statsData.loses}</div>
            <div class="stats-separator"></div>
            <div class="stats-title"> Win/Lose Ration</div>
            <div class="stats-container"> ${statsData.ratio}% </div>
            <div class="stats-separator"></div>
            <div class="stats-title"> Last Match </div>
            <div class="stats-container"> ${statsData.lastMatch} </div>
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
