package com.lazarborovica.chessgame.gameengine.chesspieces;

public class Rook extends ChessPiece {
    public Rook(int row, int col, PieceColor color) {
        super(row, col, color);
    }

    @Override
    public boolean isValidMove(int endRow, int endCol, ChessPiece[][] board) {
        int rowChange = Math.abs(endRow - this.getRow());
        int colChange = Math.abs(endCol - this.getCol());


        if (rowChange == 0) {
            return isValidCapture(endRow, endCol, board, 0, (int) Math.signum(endCol-this.getCol()));
        } else if (colChange == 0) {
            return isValidCapture(endRow, endCol, board, (int) Math.signum(endRow-this.getRow()), 0);
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
        return "Rook";
    }
}
