package com.lazarborovica.chessgame.gameengine.chesspieces;

public abstract class ChessPiece {
    private int row;
    private int col;

    String image;

    private PieceColor color;
    private int intColor = 0;

    public ChessPiece(int row, int col, PieceColor color) {
        this.row = row;
        this.col = col;
        this.color = color;
        image = getImage();

        if(color ==PieceColor.WHITE)
            intColor = 0;
        else
            intColor = 1;
    }

    public String getImage(){
        String pieceName = this.getClass().getSimpleName();
        String colorText = "black";
        if(this.color == PieceColor.WHITE)
            colorText = "white";
        return colorText+"/"+pieceName+".png";
    }

    public void makeMove(int targetRow, int targetCol) {
        row = targetRow;
        col = targetCol;
    }

    public abstract boolean isValidMove(int endRow, int endCol, ChessPiece[][] board);

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getCol() {
        return col;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public int getIntColor() {
        return intColor;
    }

    public PieceColor getColor() {
        return color;
    }

    public void setColor(PieceColor color) {
        this.color = color;
    }
}
