package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.entity.Playerhasfriend;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PlayerhasfriendRepository extends JpaRepository<Playerhasfriend, Integer> {
    public List<Playerhasfriend> findByPlayer(Player player);

}
