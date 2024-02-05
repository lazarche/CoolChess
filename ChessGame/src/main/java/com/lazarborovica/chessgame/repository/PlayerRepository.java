package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Player;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlayerRepository extends JpaRepository<Player,Integer> {
    public Player findByUsername(String username);
}
