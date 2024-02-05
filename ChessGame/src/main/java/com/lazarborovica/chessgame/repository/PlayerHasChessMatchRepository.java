package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.entity.Playerhaschessmatch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PlayerHasChessMatchRepository extends JpaRepository<Playerhaschessmatch, Integer> {

    @Query("SELECT COUNT(phs) FROM Playerhaschessmatch phs WHERE phs.player = :player AND phs.won = 1")
    public int countAllWon(@Param("player") Player player);

    @Query("SELECT COUNT(phs) FROM Playerhaschessmatch phs WHERE phs.player = :player AND phs.won = 0")
    public int countAllLost(@Param("player") Player player);

}
