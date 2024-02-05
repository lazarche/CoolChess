package com.lazarborovica.chessgame.service;

import com.lazarborovica.chessgame.entity.Friendship;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.entity.Playerhasfriend;
import com.lazarborovica.chessgame.repository.FriendshipRepository;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import com.lazarborovica.chessgame.repository.PlayerhasfriendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FriendService {
    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    PlayerhasfriendRepository playerhasfriendRepository;

    @Autowired
    FriendshipRepository friendshipRepository;

    public Player getPlayer(String username) {
        return playerRepository.findByUsername(username);
    }
    public Friendship getFriendship(Player p1, Player p2) {
        List<Playerhasfriend> friendshipsPlayer1 = playerhasfriendRepository.findByPlayer(p1);
        List<Playerhasfriend> friendshipsPlayer2 = playerhasfriendRepository.findByPlayer(p2);

        for (Playerhasfriend friendshipPlayer1 : friendshipsPlayer1) {
            for (Playerhasfriend friendshipPlayer2 : friendshipsPlayer2) {
                System.out.println(friendshipPlayer1 + " " + friendshipPlayer2);
                if (friendshipPlayer1.getFriendship().equals(friendshipPlayer2.getFriendship())) {
                    return friendshipPlayer1.getFriendship();
                }
            }
        }

        return null;
    }
    public void sendFriendRequest(Player from, Player to) {
        Friendship friendship = new Friendship();
        friendship = friendshipRepository.save(friendship);

        Playerhasfriend pf1 = new Playerhasfriend();
        pf1.setPlayer(from);
        pf1.setStatus("inviter");
        pf1.setFriendship(friendship);

        Playerhasfriend pf2 = new Playerhasfriend();
        pf2.setPlayer(to);
        pf2.setStatus("waiting");
        pf2.setFriendship(friendship);

        playerhasfriendRepository.save(pf1);
        playerhasfriendRepository.save(pf2);
        friendshipRepository.save(friendship);
    }
    public List<Player> getFriends (Player p) {
        List<Playerhasfriend> friendshipsPlayer1 = playerhasfriendRepository.findByPlayer(p);
        List<Player> friends = new ArrayList<Player>();

        for(Playerhasfriend phs : friendshipsPlayer1) {
            for (Playerhasfriend rphs : phs.getFriendship().getPlayerhasfriends()) {
                if(!rphs.equals(phs)){
                    if(phs.getStatus().equals("friend"))
                        friends.add(rphs.getPlayer());
                }
            }
        }

        return  friends;
    }
    public List<Player> getRequests (Player p) {
        List<Playerhasfriend> friendshipsPlayer1 = playerhasfriendRepository.findByPlayer(p);
        List<Player> requests = new ArrayList<Player>();

        for(Playerhasfriend phs : friendshipsPlayer1) {
            if(!phs.getStatus().equals("inviter"))
            for (Playerhasfriend rphs : phs.getFriendship().getPlayerhasfriends()) {
                if(!rphs.equals(phs)){
                    if(rphs.getStatus() != null)
                        if(!rphs.getStatus().equals("friend") && !rphs.getStatus().equals("block"))
                            requests.add(rphs.getPlayer());
                }
            }
        }

        return  requests;
    }
    public void addResponse(Player p, String userName, String reply) {
        List<Playerhasfriend> friendshipsPlayer1 = playerhasfriendRepository.findByPlayer(p);

        for(Playerhasfriend phs : friendshipsPlayer1) {
            for (Playerhasfriend rphs : phs.getFriendship().getPlayerhasfriends()) {
                if(!rphs.equals(phs)){
                    if(rphs.getPlayer().getUsername().equals(userName)) {
                        rphs = playerhasfriendRepository.findById(rphs.getIdtable1()).get();

                        phs.setStatus(reply);
                        rphs.setStatus(reply);

                        playerhasfriendRepository.save(phs);
                        playerhasfriendRepository.save(rphs);
                        System.out.println("sacuvano " + reply);
                        return;
                    }
                }
            }
        }
    }
}
