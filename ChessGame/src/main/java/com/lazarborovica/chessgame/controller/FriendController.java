package com.lazarborovica.chessgame.controller;

import com.lazarborovica.chessgame.entity.Friendship;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import com.lazarborovica.chessgame.service.ChatService;
import com.lazarborovica.chessgame.service.FriendService;
import com.lazarborovica.chessgame.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/friends")
public class FriendController {

    @Autowired
    FriendService friendService;

    @Autowired
    ChatService chatService;

    @GetMapping("/getPage")
    public String getPage(String chatWithUser, Model m){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player self = friendService.getPlayer(username);

        if(chatWithUser != null) {
            m.addAttribute("chatWith", chatWithUser);
            Player second = friendService.getPlayer(chatWithUser);
            Friendship f = friendService.getFriendship(self, second);
            m.addAttribute("messages", chatService.getMessages(f));
        }


        m.addAttribute("friendships", friendService.getFriends(self));
        m.addAttribute("friendship_requests", friendService.getRequests(self));

        return "friends";
    }

    @PostMapping("/addFriend")
    public String addFriend(String userName, Model m) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Player self = friendService.getPlayer(username);
        Player player = friendService.getPlayer(userName);

        if(player == null) {
            m.addAttribute("friendRequest", "There is no user with that name! :(");
            return "friends";
        }
        if(friendService.getFriendship(self,player) != null) {
            m.addAttribute("friendRequest", "You are already friend with that user or friend request is pending for answer! :(");
            return "friends";
        }

        friendService.sendFriendRequest(self, player);
        m.addAttribute("friendRequest", "Friend request has been sent! :)");

        return "friends";
    }

    @GetMapping("/replyFriend")
    public String replyFriend(String userName, String result, Model m) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        System.out.println("ovdee smo " + userName + " " + result);
        Player self = friendService.getPlayer(username);
        friendService.addResponse(self, userName, result);

        return "redirect:/friends/getPage";
    }

    @PostMapping("/sendMessage")
    public String sendMessage(String receiverUsername, String context, Model m) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();

        Player self = friendService.getPlayer(username);
        Player player = friendService.getPlayer(receiverUsername);
        Friendship friendship = friendService.getFriendship(self,player);

        System.out.println(self.getUsername() + " sends message to " + receiverUsername + " context: " + context);

        if(friendship != null) {
            System.out.println("ovde smo b");
            chatService.sendMessage(self, friendship, context);
        } else {
            m.addAttribute("messageError", "You are not friend with that user!");
        }

        return "redirect:/friends/getPage?chatWithUser="+receiverUsername;
    }
}
