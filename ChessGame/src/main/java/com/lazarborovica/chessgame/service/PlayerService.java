package com.lazarborovica.chessgame.service;

import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayerService {

    @Autowired
    PlayerRepository pr;

    public int getPlayers() {
        List<Player> list = pr.findAll();
        System.out.println(list.size());
        return list.size();
    }
}
