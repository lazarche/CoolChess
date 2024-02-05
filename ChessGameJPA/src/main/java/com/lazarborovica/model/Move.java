package com.lazarborovica.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the move database table.
 * 
 */
@Entity
@NamedQuery(name="Move.findAll", query="SELECT m FROM Move m")
public class Move implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private MovePK id;

	private String col;

	private String row;

	//bi-directional many-to-one association to Match
	@ManyToOne
	private Match match;

	//bi-directional many-to-one association to Playerdata
	@ManyToOne
	private Playerdata playerdata;

	public Move() {
	}

	public MovePK getId() {
		return this.id;
	}

	public void setId(MovePK id) {
		this.id = id;
	}

	public String getCol() {
		return this.col;
	}

	public void setCol(String col) {
		this.col = col;
	}

	public String getRow() {
		return this.row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public Match getMatch() {
		return this.match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}

	public Playerdata getPlayerdata() {
		return this.playerdata;
	}

	public void setPlayerdata(Playerdata playerdata) {
		this.playerdata = playerdata;
	}

}