package com.lazarborovica.chessgame.dto;

import com.lazarborovica.chessgame.entity.Chessmove;
import com.lazarborovica.chessgame.entity.Player;

import java.util.Date;
import java.util.List;

public class StatsChessMatchDTO {
    private int idMatch;
    private String status;
    private int numberOfMoves;
    private String date;
    private String opponentUsername;
    private String username;

    public StatsChessMatchDTO() {

    }

    public int getIdMatch() {
        return idMatch;
    }

    public void setIdMatch(int idMatch) {
        this.idMatch = idMatch;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getNumberOfMoves() {
        return numberOfMoves;
    }

    public void setNumberOfMoves(int numberOfMoves) {
        this.numberOfMoves = numberOfMoves;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOpponentUsername() {
        return opponentUsername;
    }

    public void setOpponentUsername(String opponentUsername) {
        this.opponentUsername = opponentUsername;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
