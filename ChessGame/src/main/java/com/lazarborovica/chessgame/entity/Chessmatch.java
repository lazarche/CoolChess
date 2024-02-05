package com.lazarborovica.chessgame.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the chessmatch database table.
 * 
 */
@Entity
@Table(name="chessmatch")
@NamedQuery(name="Chessmatch.findAll", query="SELECT c FROM Chessmatch c")
public class Chessmatch implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	@Column(length=45)
	private String status;

	//bi-directional many-to-one association to Chessmove
	@OneToMany(mappedBy="chessmatch")
	private List<Chessmove> chessmoves;

	//bi-directional many-to-one association to Playerhaschessmatch
	@OneToMany(mappedBy="chessmatch")
	private List<Playerhaschessmatch> playerhaschessmatches;

	public Chessmatch() {
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

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Chessmove> getChessmoves() {
		return this.chessmoves;
	}

	public void setChessmoves(List<Chessmove> chessmoves) {
		this.chessmoves = chessmoves;
	}

	public Chessmove addChessmove(Chessmove chessmove) {
		getChessmoves().add(chessmove);
		chessmove.setChessmatch(this);

		return chessmove;
	}

	public Chessmove removeChessmove(Chessmove chessmove) {
		getChessmoves().remove(chessmove);
		chessmove.setChessmatch(null);

		return chessmove;
	}

	public List<Playerhaschessmatch> getPlayerhaschessmatches() {
		return this.playerhaschessmatches;
	}

	public void setPlayerhaschessmatches(List<Playerhaschessmatch> playerhaschessmatches) {
		this.playerhaschessmatches = playerhaschessmatches;
	}

	public Playerhaschessmatch addPlayerhaschessmatch(Playerhaschessmatch playerhaschessmatch) {
		getPlayerhaschessmatches().add(playerhaschessmatch);
		playerhaschessmatch.setChessmatch(this);

		return playerhaschessmatch;
	}

	public Playerhaschessmatch removePlayerhaschessmatch(Playerhaschessmatch playerhaschessmatch) {
		getPlayerhaschessmatches().remove(playerhaschessmatch);
		playerhaschessmatch.setChessmatch(null);

		return playerhaschessmatch;
	}

}