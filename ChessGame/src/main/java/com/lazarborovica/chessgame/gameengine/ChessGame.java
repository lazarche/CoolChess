package com.lazarborovica.chessgame.gameengine;

import com.lazarborovica.chessgame.entity.Chessmatch;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.gameengine.chesspieces.PieceColor;

import java.util.Random;

public class ChessGame {
    private Chessmatch chessmatch;
    private String inviteId;
    private Player player1;
    private Player player2;
    private Player currentTurn;
    private ChessBoard chessBoard;
    private boolean gameOver;
    private boolean updated;
    private boolean initialized;
    private boolean finished;
    public ChessGame(Player Player) {
        inviteId = getRandomString(25);
        updated = false;
        initialized = false;
        finished = false;

        this.player1 = player1;
        this.player2 = null;
        this.currentTurn = player1;
        this.chessBoard = new ChessBoard();
        this.gameOver = false;
    }
    public ChessGame(Player player1, Player player2) {
        inviteId = getRandomString(25);
        updated = false;
        initialized = false;
        finished = false;

        this.player1 = player1;
        this.player2 = player2;
        this.currentTurn = player1;
        this.chessBoard = new ChessBoard();
        this.gameOver = false;
    }
    public ChessBoard getChessBoard() {
        return chessBoard;
    }
    public void startGame() {
        chessBoard.initializeBoard();
        updated = true;
        initialized=true;
    }
    public boolean isMyTurn(Player player) {
        return currentTurn.getUsername().equals(player.getUsername());
    }
    public  boolean isUpdated(Player player){
        boolean toReturn = isMyTurn(player) && updated;
        if(toReturn)
            updated = false;
        return  toReturn;
    }
    PieceColor getPlayerColor(Player player) {
        if(player.getUsername().equals(player1.getUsername()))
            return PieceColor.WHITE;
        else if(player.getUsername().equals(player2.getUsername()))
            return PieceColor.BLACK;

        return  PieceColor.WHITE;
    }
    public boolean makeMove(Move move) {
        move.color = getPlayerColor(move.getPlayer());
        boolean validMove = chessBoard.isValidMove(move);

        if (validMove) {
            chessBoard.makeMove(move);
            updated = true;
            NextTurn();

            return  true;

            //TODO
            //gameOver = chessBoard.isGameOver();
        }
        return  false;
    }
    private void NextTurn() {
        if(currentTurn.equals(player1))
            currentTurn = player2;
        else
            currentTurn = player1;
    }
    public boolean checkOwnership(String username) {
        if(player1.getUsername().equals(username))
            return  true;
        else
            if(player2 != null)
                if(player2.getUsername().equals(username))
                    return  true;

        return  false;
    }
    public boolean isWinMove(Player player) {
        PieceColor color = PieceColor.WHITE;
        if(player.getUsername().equals(player1.getUsername()))
            color = PieceColor.BLACK;

        return !chessBoard.isKingAlive(color);
    }
    public boolean isFinished() {return finished;}

    //~~~~~~~Getters && Setters~~~~~~~

    public Chessmatch getChessmatch() {
        return chessmatch;
    }

    public void setChessmatch(Chessmatch chessmatch) {
        this.chessmatch = chessmatch;
    }

    public  boolean isInitialized() {
        return initialized;
    }

    public Player getplayer1() {
        return player1;
    }

    public void setplayer1(Player player1) {
        this.player1 = player1;
    }

    public Player getplayer2() {
        return player2;
    }

    public void setplayer2(Player player2) {
        this.player2 = player2;
    }

    public String getInviteId() {return inviteId;}
    protected String getRandomString(int lenght) {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < lenght) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
    public void Finish() {
        finished = true;
    }
}
