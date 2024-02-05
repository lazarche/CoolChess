package com.lazarborovica.chessgame.gameengine.chesspieces;

public class Bishop extends ChessPiece {
    public Bishop(int row, int col, PieceColor color) {
        super(row, col, color);
    }

    @Override
    public boolean isValidMove(int endRow, int endCol, ChessPiece[][] board) {
        int rowChange = Math.abs(endRow - this.getRow());
        int colChange = Math.abs(endCol - this.getCol());

        // Bishop moves diagonally
        if (rowChange == colChange) {
            return isValidCapture(endRow, endCol, board, (endRow > this.getRow()) ? 1 : -1, (endCol > this.getCol()) ? 1 : -1);
        }

        return false;
    }

    private boolean isValidCapture(int endRow, int endCol, ChessPiece[][] board, int rowIncrement, int colIncrement) {
        int row = this.getRow() + rowIncrement;
        int col = this.getCol() + colIncrement;

        while (row != endRow || col != endCol) {
            ChessPiece currentPiece = board[row][col];
            if (currentPiece != null) {
                return false; // There is a piece in the way
            }
            row += rowIncrement;
            col += colIncrement;
        }

        ChessPiece targetPiece = board[endRow][endCol];
        return targetPiece == null || targetPiece.getColor() != this.getColor();
    }

    @Override
    public String toString() {
        return "Bishop";
    }
}
