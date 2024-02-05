package com.lazarborovica.chessgame.service;

import com.lazarborovica.chessgame.dto.*;
import com.lazarborovica.chessgame.entity.Chessmatch;
import com.lazarborovica.chessgame.entity.Chessmove;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.entity.Playerhaschessmatch;
import com.lazarborovica.chessgame.repository.ChessMatchRepository;
import com.lazarborovica.chessgame.repository.ChessMoveRepository;
import com.lazarborovica.chessgame.repository.PlayerHasChessMatchRepository;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class StatsService {
    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    ChessMatchRepository chessMatchRepository;

    @Autowired
    PlayerHasChessMatchRepository playerHasChessMatchRepository;

    @Autowired
    ChessMoveRepository chessMoveRepository;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public List<StatsChessMatchDTO> getMatchHistory(Player player) {
        List<StatsChessMatchDTO> matches = new ArrayList<StatsChessMatchDTO>();

        player.getPlayerhaschessmatches();
        for(Playerhaschessmatch phm: player.getPlayerhaschessmatches()) {
            StatsChessMatchDTO match = new StatsChessMatchDTO();
            if(phm.getWon() < 0)
                match.setStatus("INVALID");
            else
                match.setStatus(phm.getWon() == 1? "WON":"LOST");


            match.setDate(sdf.format(phm.getChessmatch().getDate()));
            match.setNumberOfMoves(phm.getChessmatch().getChessmoves().size());
            for(Playerhaschessmatch temp: phm.getChessmatch().getPlayerhaschessmatches()) {
                if(!temp.getPlayer().getUsername().equals(phm.getPlayer().getUsername())){
                    match.setOpponentUsername(temp.getPlayer().getUsername());
                    break;
                }
            }
            match.setUsername(player.getUsername());
            match.setIdMatch(phm.getChessmatch().getId());
            matches.add(match);
        }
        return  matches;
    }

    public StatsDTO getStats(Player player) {
        StatsDTO statsDTO = new StatsDTO();

        int wins = playerHasChessMatchRepository.countAllWon(player);
        int loses = playerHasChessMatchRepository.countAllLost(player);

        int total = wins + loses;
        int ration = (int)((float)wins/(float)total * 100);

        statsDTO.setUsername(player.getUsername());
        statsDTO.setWins(wins);
        statsDTO.setLoses(loses);
        statsDTO.setLastMatch(sdf.format(chessMatchRepository.findLastMatch(player.getId(), PageRequest.of(0,1)).get(0).getDate()));
        statsDTO.setTotal(total);
        statsDTO.setRatio(ration);

        return statsDTO;
    }
    public List<ReportChessMatchDTO> getMatchHistoryReport(Player player) {
        List<ReportChessMatchDTO> matches = new ArrayList<ReportChessMatchDTO>();

        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");


        player.getPlayerhaschessmatches();
        for(Playerhaschessmatch phm: player.getPlayerhaschessmatches()) {
            ReportChessMatchDTO match = new ReportChessMatchDTO();
            if(phm.getWon() < 0)
                match.setStatus("INVALID");
            else
                match.setStatus(phm.getWon() == 1? "WON":"LOST");

            match.setDate(sdfDate.format(phm.getChessmatch().getDate()));
            match.setTime(sdfTime.format(phm.getChessmatch().getDate()));

            match.setNumberOfMoves(phm.getChessmatch().getChessmoves().size());
            for(Playerhaschessmatch temp: phm.getChessmatch().getPlayerhaschessmatches()) {
                if(!temp.getPlayer().getUsername().equals(phm.getPlayer().getUsername())){
                    match.setOpponentUsername(temp.getPlayer().getUsername());
                    break;
                }
            }
            match.setIdMatch(phm.getChessmatch().getId());
            matches.add(match);
        }
        return  matches;
    }
    public List<ReportMoveDTO> getChessmoves(int idMatch) {
        Chessmatch chessmatch = chessMatchRepository.findById(idMatch).get();

        List<ReportMoveDTO> moves = new ArrayList<>();
        int num = 1;
        for (Chessmove move: chessMoveRepository.findChessmovesByChessmatchAsc(chessmatch)) {
            ReportMoveDTO moveDTO = new ReportMoveDTO();
            moveDTO.setMoveNum(num);
//            <div>${move.piece} ${move.startCol}${move.startRow}->${move.endCol}${move.endRow}</div>
            String moveString = move.getPiece() + "  MOVED FROM  " + move.getStartCol()+""+move.getStartRow() +"  TO  " + move.getEndCol() +"" +move.getEndRow();
            if(move.getColor().equals("WHITE")) {
                moveDTO.setWhiteMove(moveString);
                moveDTO.setBlackMove("");
            } else {
                moveDTO.setBlackMove(moveString);
                moveDTO.setWhiteMove("");
            }
            num++;
            moves.add(moveDTO);
        }

        return  moves;
    }

    public MatchStatsDTO getMatchStats(int idMatch) {
        Chessmatch chessmatch = chessMatchRepository.findById(idMatch).get();
        List<Chessmove> moves = chessMoveRepository.findChessmoveByChessmatch(chessmatch);

        if(moves.size() < 2) {
            throw new RuntimeException("Can't get stats for invalid match");
        }

        MatchStatsDTO stats = new MatchStatsDTO();
        stats.setWhiteUsername(moves.get(0).getPlayer().getUsername());
        stats.setBlackUsername(moves.get(1).getPlayer().getUsername());

        stats.setBlackStatus("LOST");
        stats.setWhiteStatus("WON");

        if(chessmatch.getPlayerhaschessmatches().get(0).getWon() == 1) {
            if(chessmatch.getPlayerhaschessmatches().get(0).getPlayer().getUsername().equals(stats.getWhiteUsername()))
                stats.setWhiteStatus("WON");
            else
                stats.setBlackStatus("WON");
        } else {
            if(chessmatch.getPlayerhaschessmatches().get(1).getPlayer().getUsername().equals(stats.getWhiteUsername()))
                stats.setWhiteStatus("WON");
            else
                stats.setBlackStatus("WON");
        }

        return  stats;
    }
}
