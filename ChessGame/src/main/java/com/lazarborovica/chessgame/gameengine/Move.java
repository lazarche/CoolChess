package com.lazarborovica.chessgame.gameengine;

import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.gameengine.chesspieces.PieceColor;

public class Move {
    private int startRow;
    private int startCol;
    private int endRow;
    private int endCol;
    public PieceColor color;
    private Player player;

    String piece;

    public Move(int startRow, int startCol, int endRow, int endCol, Player player) {
        this.startRow = startRow;
        this.startCol = startCol;
        this.endRow = endRow;
        this.endCol = endCol;
        this.player = player;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getStartCol() {
        return startCol;
    }

    public void setStartCol(int startCol) {
        this.startCol = startCol;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player playerInGame) {
        this.player = playerInGame;
    }

    public int getEndRow() {
        return endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public int getEndCol() {
        return endCol;
    }

    public void setEndCol(int endCol) {
        this.endCol = endCol;
    }

    public String getPiece() {
        return piece;
    }

    public void setPiece(String piece) {
        this.piece = piece;
    }

    @Override
    public String toString() {
        return "Move{" +
                "startRow=" + startRow +
                ", startCol=" + startCol +
                ", endRow=" + endRow +
                ", endCol=" + endCol +
                ", player=" + player +
                '}';
    }
}