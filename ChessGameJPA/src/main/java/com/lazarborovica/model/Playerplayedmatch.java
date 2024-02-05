package com.lazarborovica.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the playerplayedmatch database table.
 * 
 */
@Entity
@NamedQuery(name="Playerplayedmatch.findAll", query="SELECT p FROM Playerplayedmatch p")
public class Playerplayedmatch implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private PlayerplayedmatchPK id;

	private int won;

	//bi-directional many-to-one association to Match
	@ManyToOne
	private Match match;

	//bi-directional many-to-one association to Playerdata
	@ManyToOne
	private Playerdata playerdata;

	public Playerplayedmatch() {
	}

	public PlayerplayedmatchPK getId() {
		return this.id;
	}

	public void setId(PlayerplayedmatchPK id) {
		this.id = id;
	}

	public int getWon() {
		return this.won;
	}

	public void setWon(int won) {
		this.won = won;
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