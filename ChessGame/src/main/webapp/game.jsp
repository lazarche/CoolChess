<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chess Game</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/gameStyle.css" >
</head>
<body>

<form action="/CoolChess/game/move" method="post" class ="hidden" id="chessForm">
    <input type="hidden" name="selectedRow" id="selectedRow">
    <input type="hidden" name="selectedCol" id="selectedCol">
    <input type="hidden" name="targetRow" id="targetRow">
    <input type="hidden" name="targetCol" id="targetCol">
    <input type="submit" value="Select Piece" class ="hidden">
</form>

<%--<h1>Invite link</h1>--%>
<%--<c:if test="${not empty invite}">--%>
<%--    <h2>${invite}</h2>--%>
<%--</c:if>--%>

<c:if test="${not empty turnError}">
    <script>
        alert("${turnError}");
    </script>
</c:if>


<h1>
    Cool Chess
</h1>



<c:choose>
    <c:when test="${not empty gameReady}">
        <div class="container">
            <div class="chessboard-container">
                <div class="chessboard-characters">
                    <div>A</div>
                    <div>B</div>
                    <div>C</div>
                    <div>D</div>
                    <div>E</div>
                    <div>F</div>
                    <div>G</div>
                    <div>H</div>
                </div>
                <div class="chessboard-innerHolder">
                    <div class="chessboard-numbers">
                        <div>1</div>
                        <div>2</div>
                        <div>3</div>
                        <div>4</div>
                        <div>5</div>
                        <div>6</div>
                        <div>7</div>
                        <div>8</div>
                    </div>
                    <div class="chessboard">
                        <c:forEach var="row" begin="0" end="7">
                            <c:forEach var="col" begin="0" end="7">
                                <div class="square ${((row + col) % 2 == 0) ? 'even' : 'odd'}">
                                    <c:choose>
                                        <c:when test="${not empty boardData[row][col]}">
                                            <div class="chess-piece" id="piece-${row},${col}"}

                                                 onclick="selectPiece(${row}, ${col}, ${boardData[row][col].intColor})">
                                                <img src="${pageContext.request.contextPath}/static/chesspieces/${boardData[row][col].image}" alt="Chess Piece">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Empty -->
                                            <div class="chess-piece" onclick="selectEmpty(${row},${col})">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="chat-container">
                <div class="chat-opponentdata">
                    <c:if test="${not empty opponentData}">
                        <h2>Opponent data</h2>
                        <h3>Name ${opponentData.username}</h3>
                        <h3>W: ${opponentData.win}  H: ${opponentData.lose} </h3>
                        <h3>W/L Ration: ${opponentData.winRate}%</h3>
                    </c:if>
                </div>

                <div class="chat-moveData">
                    <h2>Move data</h2>
                    <div class="move-container" id="move-container">
                        <c:if test="${not empty moves}">
                            <c:forEach var="move" items="${moves}">
                                <div>${move.piece} ${move.startCol}${move.startRow}->${move.endCol}${move.endRow}</div>
                            </c:forEach>
                        </c:if>
<%--                        <div>Pawn D3->D4 </div>--%>
<%--                        <div>Pawn D7->D6 </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="overlay">
            <div class="popupError">
                <p>Please wait for the other player to join you.</p>
                    <c:if test="${not empty invite}">
                        <h2> Invite link</h2>
                        <h2>${invite}</h2>
                    </c:if>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<script>
    var selectedP = null;
    var selectedColor = null;

    function selectPiece(row, col, color) {
        var selectedPiece = document.getElementById('piece-' + row + ',' + col);
        console.log(row + " " + col + " " + color);
        if(selectedColor != null)
            if(selectedColor !== selectedPiece.color) {
                selectEmpty(row, col);
                return;
            }

        selectedP = selectedPiece;
        selectedColor = color;

        var previousSelectedPiece = document.querySelector('.chess-piece.selected');
        if (previousSelectedPiece) {
            previousSelectedPiece.classList.remove('selected');
        }

        selectedPiece.classList.add('selected');

        document.getElementById('selectedRow').value = row;
        document.getElementById('selectedCol').value = col;
    }

    function  selectEmpty(row, col) {
        if(selectedP == null){
            alert("null je");
            return;
        }

        document.getElementById('targetRow').value = row;
        document.getElementById('targetCol').value = col;
        selectedP = null;
        var previousSelectedPiece = document.querySelector('.chess-piece.selected');
        if (previousSelectedPiece) {
            previousSelectedPiece.classList.remove('selected');
        }

        document.getElementById('chessForm').submit();
    }

    function checkForUpdates() {
        const apiUrl = '/CoolChess/game/isMyTurn';

        fetch(apiUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                if(data.lose === true) {
                    location.replace('/CoolChess/game/finishGame');
                }

                if(data.upd === true) {
                    selectedP = null;
                    selectedColor = null;

                    location.replace('/CoolChess/game/updateGame');
                }
            })
    }

    setInterval(checkForUpdates, 500);
    window.onload = checkForUpdates;

</script>
<script>
    // Container to bottom
    var container = document.getElementById('move-container');
    if(container != null)
        container.scrollTop = container.scrollHeight;
</script>

</body>
</html>
