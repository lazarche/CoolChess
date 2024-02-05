package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Friendship;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FriendshipRepository extends JpaRepository<Friendship,Integer> {
}
