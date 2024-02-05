package com.lazarborovica.chessgame.controller;

import com.lazarborovica.chessgame.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/player")
public class PlayerController {

    @Autowired
    PlayerService ps;

    @GetMapping("/getInfo")
    public String getInfo() {
        ps.getPlayers();
        return "";
    }
}
