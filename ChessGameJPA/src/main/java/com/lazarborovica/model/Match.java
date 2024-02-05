package com.lazarborovica.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the match database table.
 * 
 */
@Entity
@NamedQuery(name="Match.findAll", query="SELECT m FROM Match m")
public class Match implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	//bi-directional many-to-one association to Move
	@OneToMany(mappedBy="match")
	private List<Move> moves;

	//bi-directional many-to-one association to Playerplayedmatch
	@OneToMany(mappedBy="match")
	private List<Playerplayedmatch> playerplayedmatches;

	public Match() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<Move> getMoves() {
		return this.moves;
	}

	public void setMoves(List<Move> moves) {
		this.moves = moves;
	}

	public Move addMove(Move move) {
		getMoves().add(move);
		move.setMatch(this);

		return move;
	}

	public Move removeMove(Move move) {
		getMoves().remove(move);
		move.setMatch(null);

		return move;
	}

	public List<Playerplayedmatch> getPlayerplayedmatches() {
		return this.playerplayedmatches;
	}

	public void setPlayerplayedmatches(List<Playerplayedmatch> playerplayedmatches) {
		this.playerplayedmatches = playerplayedmatches;
	}

	public Playerplayedmatch addPlayerplayedmatch(Playerplayedmatch playerplayedmatch) {
		getPlayerplayedmatches().add(playerplayedmatch);
		playerplayedmatch.setMatch(this);

		return playerplayedmatch;
	}

	public Playerplayedmatch removePlayerplayedmatch(Playerplayedmatch playerplayedmatch) {
		getPlayerplayedmatches().remove(playerplayedmatch);
		playerplayedmatch.setMatch(null);

		return playerplayedmatch;
	}

}