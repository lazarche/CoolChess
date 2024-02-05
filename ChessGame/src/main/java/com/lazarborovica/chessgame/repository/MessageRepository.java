package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Integer> {
}
