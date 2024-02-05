package com.lazarborovica.chessgame.gameengine;

import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.exception.GameDoesntExistsException;

import java.util.ArrayList;
import java.util.List;

public class ChessGameManager {
    List<ChessGame> chessGames = new ArrayList<ChessGame>();

    public ChessGame createChessGame(Player player1) {
        ChessGame chessGame = new ChessGame(player1, null);
        chessGames.add(chessGame);
        return  chessGame;
    }
    public ChessGame joinChessGame(Player player, String invite) {
        ChessGame chessGame = getChessGame(invite);
        if(chessGame == null)
            return null;

        chessGame.setplayer2(player);
        chessGame.startGame();
        return  chessGame;
    }
    public  boolean doesGameExists(Player player) {
        ChessGame game =
                chessGames.stream()
                        .filter(p -> p.checkOwnership(player.getUsername()))
                        .findFirst().orElse(null);

        return  game != null;
    }
    public ChessGame getChessGame(Player player) {
        ChessGame game =
                chessGames.stream()
                .filter(p -> p.checkOwnership(player.getUsername()))
                .findFirst().orElse(null);

        if(game == null)
            throw new GameDoesntExistsException("Game for player: " + player.getUsername() + " doesn't exist");

        return game;
    }
    public ChessGame getChessGame(String invite) {
        ChessGame game =
                chessGames.stream()
                        .filter(p -> p.getInviteId().equals(invite))
                        .findFirst().orElse(null);

        if(game == null)
            throw new GameDoesntExistsException("Game for invite link " + invite + " doesn't exist");

        return game;
    }
    public void finishChessGame(ChessGame game) {
        game.setplayer1(null);
        game.setplayer2(null);
        chessGames.remove(game);
    }
}
