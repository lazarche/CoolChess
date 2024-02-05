package com.lazarborovica.chessgame.controller;

import com.lazarborovica.chessgame.entity.Chessmove;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.exception.GameDoesntExistsException;
import com.lazarborovica.chessgame.gameengine.ChessGame;
import com.lazarborovica.chessgame.gameengine.ChessGameManager;
import com.lazarborovica.chessgame.gameengine.Move;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import com.lazarborovica.chessgame.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/game")
public class GameController {

    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    GameService gameService;

    ChessGameManager chessManager = new ChessGameManager();

    @GetMapping("/game")
    public String game() {
        return "game";
    }

    @GetMapping("/createGame")
    public String createGame(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player player = playerRepository.findByUsername(username);

        ChessGame game;
        if(!chessManager.doesGameExists(player)) {
            game = chessManager.createChessGame(player);
            System.out.println("Game created inv link : \n" + game.getInviteId());
        } else {
            game = chessManager.getChessGame(player);
        }

        if(game.isInitialized()) {
            model.addAttribute("gameReady", true);
        }

        model.addAttribute("boardData", game.getChessBoard().board);
        model.addAttribute("invite", game.getInviteId());

        return "game";
    }

    @GetMapping("/joinGame")
    public String joinGame(String invite, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        System.out.println("Join game id:" + invite);

        Player player = playerRepository.findByUsername(username);
        ChessGame game;
        if(!chessManager.doesGameExists(player)) {
            game = chessManager.joinChessGame(player, invite);
            game.setChessmatch(gameService.MatchStarted(game.getplayer1(), game.getplayer2()));
        } else {
            game = chessManager.getChessGame(player);
        }

        Player opponent = game.getplayer2();
        if(game.getplayer2().getUsername().equals(player.getUsername()))
            opponent = game.getplayer1();
        model.addAttribute("opponentData", gameService.getOpponentData(game.getChessmatch(), opponent));

        model.addAttribute("boardData", game.getChessBoard().board);
        model.addAttribute("gameReady", true);
        return "game";
    }

    @GetMapping("/updateGame")
    public String updateGame(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player player = playerRepository.findByUsername(username);

        ChessGame game;
        if(chessManager.doesGameExists(player)) {
            game = chessManager.getChessGame(player);
        } else {
            throw new GameDoesntExistsException("Game doesn't exist");
        }
        if(game.isInitialized()) {
            model.addAttribute("gameReady", true);
        }

        Player opponent = game.getplayer2();
        if(game.getplayer2().getUsername().equals(player.getUsername()))
            opponent = game.getplayer1();
        model.addAttribute("opponentData", gameService.getOpponentData(game.getChessmatch(), opponent));

        model.addAttribute("boardData", game.getChessBoard().board);
        model.addAttribute("moves", gameService.getChessMoves(game.getChessmatch()));

        //Check win
        if(game.isFinished()) {
            //Player lost
            chessManager.finishChessGame(game);
            return "finish";
        }

        return "game";
    }

    @PostMapping("/move")
    public String makeMove(@RequestParam int selectedRow, @RequestParam int selectedCol,
                                           @RequestParam int targetRow, @RequestParam int targetCol, Model model) {

        //Get player and game
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player player = playerRepository.findByUsername(username);
        ChessGame chessGame = chessManager.getChessGame(player);

        model.addAttribute("gameReady", true);

        //Opponent data
        Player opponent = chessGame.getplayer2();
        if(chessGame.getplayer2().getUsername().equals(player.getUsername()))
            opponent = chessGame.getplayer1();
        model.addAttribute("opponentData", gameService.getOpponentData(chessGame.getChessmatch(), opponent));

        //Check turn
        boolean isMyTurn = chessGame.isMyTurn(player);
        if(!isMyTurn) {
            model.addAttribute("boardData", chessGame.getChessBoard().board);
            model.addAttribute("turnError", "Wait for opponent to finish his turn");
            return "game";
        }

        //Move
        Move move = new Move(selectedRow, selectedCol, targetRow, targetCol, player);
        if(chessGame.getChessBoard().board[selectedRow][selectedCol] != null)
            move.setPiece(chessGame.getChessBoard().board[selectedRow][selectedCol].toString());
        boolean validMove = chessGame.makeMove(move);
        if(!validMove) {
            model.addAttribute("moves", gameService.getMoves(chessGame.getChessmatch()));
            model.addAttribute("turnError", "Your move isn't valid");
        } else {
            List<Chessmove> moves = gameService.AddMoveToMatch(chessGame.getChessmatch(), move);
            model.addAttribute("moves", moves);
        }

        //Check win
        if(chessGame.isWinMove(player)) {
            //Player won
            model.addAttribute("win", true);
            chessGame.Finish();
            gameService.FinishMatch(chessGame.getChessmatch(), player);
            return "finish";
        }

        model.addAttribute("boardData", chessGame.getChessBoard().board);
        return "game";
    }

    @GetMapping("/finishGame")
    public String finishGame(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player player = playerRepository.findByUsername(username);

        ChessGame game;
        if(chessManager.doesGameExists(player)) {
            game = chessManager.getChessGame(player);
        } else {
            throw new GameDoesntExistsException("Game doesn't exist");
        }
        if(game.isInitialized()) {
            model.addAttribute("gameReady", true);
        }

        Player opponent = game.getplayer2();
        if(game.getplayer2().getUsername().equals(player.getUsername()))
            opponent = game.getplayer1();
        model.addAttribute("opponentData", gameService.getOpponentData(game.getChessmatch(), opponent));

        model.addAttribute("boardData", game.getChessBoard().board);
        model.addAttribute("moves", gameService.getChessMoves(game.getChessmatch()));

        return "game";
    }

    @GetMapping("/isMyTurn")
    public ResponseEntity<?> getUpdate() {
        //Get player and game
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player player = playerRepository.findByUsername(username);
        ChessGame chessGame = chessManager.getChessGame(player);

        boolean isUpdated = chessGame.isUpdated(player);

        if(isUpdated)
            return ResponseEntity.status(HttpStatus.OK).body("{\"upd\": true}");
        else
            return ResponseEntity.status(HttpStatus.OK).body("{\"upd\": false}");
    }

//    @PostMapping("/surrenderGame")
//    public String surrenderGame(Model model) {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        String username = authentication.getName();
//
//        Player player = playerRepository.findByUsername(username);
//
//        ChessGame game;
//        if(chessManager.doesGameExists(player)) {
//            game = chessManager.getChessGame(player);
//        } else {
//            throw new GameDoesntExistsException("Game doesn't exist");
//        }
//
//        chessManager.finishChessGame(game);
//
//        return "finish";
//    }

}

