package com.lazarborovica.chessgame.gameengine.chesspieces;

public class Pawn extends ChessPiece {
    boolean firstMove = true;
    public Pawn(int row, int col, PieceColor color) {
        super(row, col, color);
    }

    @Override
    public boolean isValidMove(int endRow, int endCol, ChessPiece[][] board) {
        int rowChange = Math.abs(endRow - this.getRow());
        int colChange = Math.abs(endCol - this.getCol());

        if (colChange == 0) {
            // Moving forward
            if (this.getColor() == PieceColor.WHITE && endRow > this.getRow()) {
                if (rowChange == 1 && board[endRow][endCol] == null) {
                    return true;
                } else if (rowChange == 2 && firstMove && board[endRow - 1][endCol] == null && board[endRow][endCol] == null) {
                    return true;
                }
            } else if (this.getColor() == PieceColor.BLACK && endRow < this.getRow()) {
                if (rowChange == 1 && board[endRow][endCol] == null) {
                    return true;
                } else if (rowChange == 2 && firstMove && board[endRow + 1][endCol] == null && board[endRow][endCol] == null) {
                    return true;
                }
            }
        }

        // Capturing diagonally
        if (colChange == 1 && rowChange == 1) {
            ChessPiece targetPiece = board[endRow][endCol];
            return targetPiece != null && targetPiece.getColor() != this.getColor();
        }

        return false;
    }

    public void makeMove(int targetRow, int targetCol) {
        setRow(targetRow);
        setCol(targetCol);
        firstMove = false;
    }

    @Override
    public String toString() {
        return "Pawn";
    }

}

