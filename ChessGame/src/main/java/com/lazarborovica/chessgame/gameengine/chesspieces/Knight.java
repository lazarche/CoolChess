package com.lazarborovica.chessgame.gameengine.chesspieces;

public class Knight extends ChessPiece {
    public Knight(int row, int col, PieceColor color) {
        super(row, col, color);
    }

    @Override
    public boolean isValidMove(int endRow, int endCol, ChessPiece[][] board) {
        int rowChange = Math.abs(endRow - this.getRow());
        int colChange = Math.abs(endCol - this.getCol());

        // Knight moves in an "L" shape
        if ((rowChange == 2 && colChange == 1) || (rowChange == 1 && colChange == 2)) {
            ChessPiece targetPiece = board[endRow][endCol];
            return targetPiece == null || targetPiece.getColor() != this.getColor();
        }

        return false;
    }

    @Override
    public String toString() {
        return "Knight";
    }
}

