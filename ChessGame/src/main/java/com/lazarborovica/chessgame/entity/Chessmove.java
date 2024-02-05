package com.lazarborovica.chessgame.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the chessmove database table.
 * 
 */
@Entity
@Table(name="chessmove")
@NamedQuery(name="Chessmove.findAll", query="SELECT c FROM Chessmove c")
public class Chessmove implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idMove;

	@Column(length=6)
	private String color;

	@Column(length=1)
	private String endCol;

	@Column(length=1)
	private String endRow;

	@Column(length=10)
	private String piece;

	@Column(length=1)
	private String startCol;

	@Column(length=1)
	private String startRow;

	//bi-directional many-to-one association to Chessmatch
	@ManyToOne
	@JoinColumn(name="idMatch", nullable=false)
	private Chessmatch chessmatch;

	//bi-directional many-to-one association to Player
	@ManyToOne
	@JoinColumn(name="idPlayer", nullable=false)
	private Player player;

	public Chessmove() {
	}

	public int getIdMove() {
		return this.idMove;
	}

	public void setIdMove(int idMove) {
		this.idMove = idMove;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getEndCol() {
		return this.endCol;
	}

	public void setEndCol(String endCol) {
		this.endCol = endCol;
	}

	public String getEndRow() {
		return this.endRow;
	}

	public void setEndRow(String endRow) {
		this.endRow = endRow;
	}

	public String getPiece() {
		return this.piece;
	}

	public void setPiece(String piece) {
		this.piece = piece;
	}

	public String getStartCol() {
		return this.startCol;
	}

	public void setStartCol(String startCol) {
		this.startCol = startCol;
	}

	public String getStartRow() {
		return this.startRow;
	}

	public void setStartRow(String startRow) {
		this.startRow = startRow;
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