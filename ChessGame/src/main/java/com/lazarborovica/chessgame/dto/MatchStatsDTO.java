package com.lazarborovica.chessgame.dto;

public class MatchStatsDTO {
    private String whiteUsername;
    private String whiteStatus;

    private String blackUsername;
    private String blackStatus;

    public String getWhiteUsername() {
        return whiteUsername;
    }

    public void setWhiteUsername(String whiteUsername) {
        this.whiteUsername = whiteUsername;
    }

    public String getWhiteStatus() {
        return whiteStatus;
    }

    public void setWhiteStatus(String whiteStatus) {
        this.whiteStatus = whiteStatus;
    }

    public String getBlackUsername() {
        return blackUsername;
    }

    public void setBlackUsername(String blackUsername) {
        this.blackUsername = blackUsername;
    }

    public String getBlackStatus() {
        return blackStatus;
    }

    public void setBlackStatus(String blackStatus) {
        this.blackStatus = blackStatus;
    }
}
