package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Chessmove;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MoveRepository extends JpaRepository<Chessmove, Integer> {
}
