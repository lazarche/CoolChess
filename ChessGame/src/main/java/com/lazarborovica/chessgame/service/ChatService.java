package com.lazarborovica.chessgame.service;


import com.lazarborovica.chessgame.entity.Friendship;
import com.lazarborovica.chessgame.entity.Message;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.entity.Playerhasfriend;
import com.lazarborovica.chessgame.repository.FriendshipRepository;
import com.lazarborovica.chessgame.repository.MessageRepository;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ChatService {

    @Autowired
    MessageRepository messageRepository;

    @Autowired
    FriendshipRepository friendshipRepository;

    @Autowired
    PlayerRepository playerRepository;

    public void sendMessage(Player self, Friendship friendship, String content) {
        Message message = new Message();
        message.setContent(content);
        message.setPlayer(self);
        message.setFriendship(friendship);
        message.setTime(new Date());

        message = messageRepository.save(message);

        friendship.addMessage(message);
        friendshipRepository.save(friendship);

        self.addMessage(message);
        playerRepository.save(self);

        messageRepository.save(message);
    }

    public List<Message> getMessages(Friendship friendship) {
        return  friendship.getMessages();
    }
}
