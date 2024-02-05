package com.lazarborovica.chessgame.dto;

public class StatsDTO {
    private String username;
    private int total;
    private int wins;
    private int loses;
    private int ratio;
    private String lastMatch;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int totalGames) {
        this.total = totalGames;
    }

    public int getWins() {
        return wins;
    }

    public void setWins(int wins) {
        this.wins = wins;
    }

    public int getLoses() {
        return loses;
    }

    public void setLoses(int loses) {
        this.loses = loses;
    }

    public int getRatio() {
        return ratio;
    }

    public void setRatio(int ratio) {
        this.ratio = ratio;
    }

    public String getLastMatch() {
        return lastMatch;
    }

    public void setLastMatch(String lastMatch) {
        this.lastMatch = lastMatch;
    }
}
