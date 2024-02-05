package com.lazarborovica.chessgame.service;

import com.lazarborovica.chessgame.dto.OpponentDataDTO;
import com.lazarborovica.chessgame.entity.Chessmatch;
import com.lazarborovica.chessgame.entity.Chessmove;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.entity.Playerhaschessmatch;
import com.lazarborovica.chessgame.gameengine.Move;
import com.lazarborovica.chessgame.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class GameService {
    @Autowired
    ChessMatchRepository chessMatchRepository;
    @Autowired
    MoveRepository moveRepository;
    @Autowired
    PlayerHasChessMatchRepository playerHasChessMatchRepository;
    @Autowired
    PlayerRepository playerRepository;
    @Autowired
    ChessMoveRepository chessMoveRepository;
    @Transactional
    public Chessmatch MatchStarted(Player p1, Player p2) {
        Chessmatch chessMatch = new Chessmatch();
        chessMatch.setStatus("started");
        chessMatch.setDate(new Date());

        p1 = playerRepository.findById(p1.getId()).get();
        p2 = playerRepository.findById(p2.getId()).get();

        //chessMatch = ChessMatchRepository.save(chessMatch);

        Playerhaschessmatch phm1 = new Playerhaschessmatch();
        phm1.setPlayer(p1);
        phm1.setChessmatch(chessMatch);
        phm1.setWon(-1);

        Playerhaschessmatch phm2 = new Playerhaschessmatch();
        phm2.setPlayer(p2);
        phm2.setChessmatch(chessMatch);
        phm2.setWon(-1);

        chessMatchRepository.save(chessMatch);

        playerHasChessMatchRepository.save(phm1);
        playerHasChessMatchRepository.save(phm2);

        playerRepository.save(p1);
        playerRepository.save(p2);

        return  chessMatch;
    }
    String[] conv = {"A", "B", "C", "D", "E", "F", "G", "H"};
    public List<Chessmove> AddMoveToMatch(Chessmatch chessmatch, Move move) {
        chessmatch = chessMatchRepository.findById(chessmatch.getId()).get();
        Chessmove chessmove = new Chessmove();
        chessmove.setPlayer(move.getPlayer());
        chessmove.setChessmatch(chessmatch);

        chessmove.setStartRow((move.getStartRow()+1) +"");
        chessmove.setStartCol(conv[move.getStartCol()]);

        chessmove.setEndCol(conv[move.getEndCol()]);
        chessmove.setEndRow((move.getEndRow()+1)+"");

        chessmove.setColor(move.color.toString());
        chessmove.setPiece(move.getPiece());

        chessmove = chessMoveRepository.save(chessmove);

        return chessmatch.getChessmoves();
    }
    public List<Chessmove> getChessMoves(Chessmatch chessmatch) {
        if(chessmatch == null)
            return null;
        chessmatch = chessMatchRepository.findById(chessmatch.getId()).get();
        return chessmatch.getChessmoves();
    }
    public OpponentDataDTO getOpponentData(Chessmatch chessmatch, Player opponent){
        if(chessmatch == null)
            return null;
        chessmatch = chessMatchRepository.findById(chessmatch.getId()).get();
        opponent = playerRepository.findById(opponent.getId()).get();

        float won = playerHasChessMatchRepository.countAllWon(opponent);
        float lost = playerHasChessMatchRepository.countAllLost(opponent);

        int total = (int) (won+lost);

        int ration = (int)((float)won/(float)total * 100);

        OpponentDataDTO opponentDataDTO = new OpponentDataDTO();
        opponentDataDTO.setUsername(opponent.getUsername());
        opponentDataDTO.setWin((int) won);
        opponentDataDTO.setLose((int) lost);
        opponentDataDTO.setWinRate(ration);

        return opponentDataDTO;
    }
    public void FinishMatch(Chessmatch chessmatch, Player winner) {
        chessmatch = chessMatchRepository.findById(chessmatch.getId()).get();
        chessmatch.setStatus("finished");
        for(Playerhaschessmatch phcm : chessmatch.getPlayerhaschessmatches()) {
            if(phcm.getPlayer().getUsername().equals(winner.getUsername()))
                phcm.setWon(1);
            else
                phcm.setWon(0);
            playerHasChessMatchRepository.save(phcm);
        }
        chessMatchRepository.save(chessmatch);
    }
    public List<Chessmove> getMoves(Chessmatch chessmatch) {
        return chessMoveRepository.findChessmoveByChessmatch(chessmatch);
    }
}
