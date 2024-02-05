package com.lazarborovica.chessgame.repository;

import com.lazarborovica.chessgame.entity.Chessmatch;
import com.lazarborovica.chessgame.entity.Chessmove;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChessMoveRepository extends JpaRepository<Chessmove, Integer> {

    //Ovaj je za igru jer divovi se prave jedan iznad drugog
    @Query("SELECT cm FROM Chessmove cm WHERE cm.chessmatch = :chessmatch ORDER BY cm.idMove DESC")
    public List<Chessmove> findChessmoveByChessmatch(Chessmatch chessmatch);

    @Query("SELECT cm FROM Chessmove cm WHERE cm.chessmatch = :chessmatch ORDER BY cm.idMove ASC ")
    public List<Chessmove> findChessmovesByChessmatchAsc(Chessmatch chessmatch);
}
