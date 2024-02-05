package com.lazarborovica.chessgame.gameengine.chesspieces;

public class King extends ChessPiece {
    public King(int row, int col, PieceColor color) {
        super(row, col, color);
    }

    @Override
    public boolean isValidMove(int endRow, int endCol, ChessPiece[][] board) {
        int rowChange = Math.abs(endRow - this.getRow());
        int colChange = Math.abs(endCol - this.getCol());

        // King moves one square in any direction
        ChessPiece targetPiece = board[endRow][endCol];
        return (rowChange <= 1 && colChange <= 1) && (targetPiece == null || targetPiece.getColor() != this.getColor());
    }
    @Override
    public String toString() {
        return "King";
    }
}