package com.lazarborovica.chessgame.gameengine;

import com.lazarborovica.chessgame.gameengine.chesspieces.*;

public class ChessBoard {
    public ChessPiece[][] board;

    public ChessBoard() {
        this.board = new ChessPiece[8][8];
        initializeBoard();
    }
    public ChessPiece[][] getBoard() {
        return board;
    }
    public void initializeBoard() {
        // Initialize pawns
        for (int col = 0; col < 8; col++) {
            board[1][col] = new Pawn(1, col, PieceColor.WHITE);
            board[6][col] = new Pawn(6, col, PieceColor.BLACK);
        }

        // Initialize rooks
        board[0][0] = new Rook(0, 0, PieceColor.WHITE);
        board[0][7] = new Rook(0, 7, PieceColor.WHITE);
        board[7][0] = new Rook(7, 0, PieceColor.BLACK);
        board[7][7] = new Rook(7, 7, PieceColor.BLACK);

        // Initialize knights
        board[0][1] = new Knight(0, 1, PieceColor.WHITE);
        board[0][6] = new Knight(0, 6, PieceColor.WHITE);
        board[7][1] = new Knight(7, 1, PieceColor.BLACK);
        board[7][6] = new Knight(7, 6, PieceColor.BLACK);

        // Initialize bishops
        board[0][2] = new Bishop(0, 2, PieceColor.WHITE);
        board[0][5] = new Bishop(0, 5, PieceColor.WHITE);
        board[7][2] = new Bishop(7, 2, PieceColor.BLACK);
        board[7][5] = new Bishop(7, 5, PieceColor.BLACK);

        // Initialize queens
        board[0][3] = new Queen(0, 3, PieceColor.WHITE);
        board[7][4] = new Queen(7, 3, PieceColor.BLACK);

        // Initialize kings
        board[0][4] = new King(0, 4, PieceColor.WHITE);
        board[7][3] = new King(7, 4, PieceColor.BLACK);
    }
    public boolean isValidMove(Move move) {
        ChessPiece piece = board[move.getStartRow()][move.getStartCol()];
        if(piece == null)
            return false;

        if(piece.getColor() != move.color)
            return false;

        return  piece.isValidMove(move.getEndRow(), move.getEndCol(), board);
    }
    public void makeMove(Move move) {
        ChessPiece piece = board[move.getStartRow()][move.getStartCol()];
        board[move.getStartRow()][move.getStartCol()] = null;
        board[move.getEndRow()][move.getEndCol()] = piece;
        piece.setRow(move.getEndRow());
        piece.setCol(move.getEndCol());
    }
    public boolean isKingAlive(PieceColor p) {
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 8; j++) {
                ChessPiece piece = board[i][j];
                if(piece != null)
                    if(piece.getColor() == p && piece.getClass() == King.class)
                        return true;
            }
        }
        return false;
    }
}
