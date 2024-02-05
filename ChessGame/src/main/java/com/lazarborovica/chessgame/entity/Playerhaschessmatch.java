package com.lazarborovica.chessgame.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the playerhaschessmatch database table.
 * 
 */
@Entity
@Table(name="playerhaschessmatch")
@NamedQuery(name="Playerhaschessmatch.findAll", query="SELECT p FROM Playerhaschessmatch p")
public class Playerhaschessmatch implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idtable1;

	private int won;

	//bi-directional many-to-one association to Chessmatch
	@ManyToOne
	@JoinColumn(name="ChessMatch_id", nullable=false)
	private Chessmatch chessmatch;

	//bi-directional many-to-one association to Player
	@ManyToOne
	@JoinColumn(name="Player_id", nullable=false)
	private Player player;

	public Playerhaschessmatch() {
	}

	public int getIdtable1() {
		return this.idtable1;
	}

	public void setIdtable1(int idtable1) {
		this.idtable1 = idtable1;
	}

	public int getWon() {
		return this.won;
	}

	public void setWon(int won) {
		this.won = won;
	}

	public Chessmatch getChessmatch() {
		return this.chessmatch;
	}

	public void setChessmatch(Chessmatch chessmatch) {
		this.chessmatch = chessmatch;
	}

	public Player getPlayer() {
		return this.player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

}