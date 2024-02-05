package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Chessmatch;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChessMatchRepository extends JpaRepository<Chessmatch, Integer> {

    @Query("SELECT phcm.chessmatch FROM Playerhaschessmatch phcm WHERE phcm.player.id = :playerId")
    public List<Chessmatch> findAllByPlayerId(@Param("playerId") int playerId);

    @Query("SELECT phcm.chessmatch FROM Playerhaschessmatch phcm WHERE phcm.player.id = :playerId ORDER BY phcm.chessmatch.date DESC")
    public List<Chessmatch> findLastMatch(@Param("playerId") int playerId, Pageable pageable);
}
