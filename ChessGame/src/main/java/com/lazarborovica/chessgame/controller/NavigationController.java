package com.lazarborovica.chessgame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavigationController {

    @GetMapping("/main")
    public String goMain() {
        return "main";
    }

    @GetMapping("/play")
    public String goPlay() {
        return "play";
    }
}
