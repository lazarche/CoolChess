package com.lazarborovica.chessgame.controller;

import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@ControllerAdvice
@RequestMapping(value="/auth")
public class LoginController {
    @Autowired
    PlayerRepository pr;

    @RequestMapping(value="/loginPage", method= RequestMethod.GET)
    public String loginPage() {

        return "login";
    }

    @RequestMapping(value = "/registerPage", method = RequestMethod.GET)
    public String newUser(Model model) {
        Player player = new Player();
        model.addAttribute("player", player);
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("player") Player player) {
        System.out.println("dovde smo dosli");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        player.setPassword(passwordEncoder.encode(player.getPassword()));

        pr.save(player);
        return "redirect:/auth/loginPage";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        request.getSession().removeAttribute("loggedUser");
        return "redirect:/auth/loginPage";
    }
}
