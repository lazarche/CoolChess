package com.lazarborovica.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the playerdata database table.
 * 
 */
@Entity
@Table(name = "playerdata")
@NamedQuery(name="Playerdata.findAll", query="SELECT p FROM Playerdata p")
public class Playerdata implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String email;

	private String firstName;

	private String lastName;

	private String password;

	private int status;

	private String username;

	//bi-directional many-to-many association to Playerdata
	@ManyToMany
	@JoinTable(
		name="friend"
		, joinColumns={
			@JoinColumn(name="PlayerData_id1")
			}
		, inverseJoinColumns={
			@JoinColumn(name="PlayerData_id")
			}
		)
	private List<Playerdata> playerdata1;

	//bi-directional many-to-many association to Playerdata
	@ManyToMany(mappedBy= "playerdata1")
	private List<Playerdata> playerdata2;

	//bi-directional many-to-one association to Move
	@OneToMany(mappedBy="playerdata")
	private List<Move> moves;

	//bi-directional many-to-one association to Playerplayedmatch
	@OneToMany(mappedBy="playerdata")
	private List<Playerplayedmatch> playerplayedmatches;

	public Playerdata() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Playerdata> getPlayerdata1() {
		return this.playerdata1;
	}

	public void setPlayerdata1(List<Playerdata> playerdata1) {
		this.playerdata1 = playerdata1;
	}

	public List<Playerdata> getPlayerdata2() {
		return this.playerdata2;
	}

	public void setPlayerdata2(List<Playerdata> playerdata2) {
		this.playerdata2 = playerdata2;
	}

	public List<Move> getMoves() {
		return this.moves;
	}

	public void setMoves(List<Move> moves) {
		this.moves = moves;
	}

	public Move addMove(Move move) {
		getMoves().add(move);
		move.setPlayerdata(this);

		return move;
	}

	public Move removeMove(Move move) {
		getMoves().remove(move);
		move.setPlayerdata(null);

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
		playerplayedmatch.setPlayerdata(this);

		return playerplayedmatch;
	}

	public Playerplayedmatch removePlayerplayedmatch(Playerplayedmatch playerplayedmatch) {
		getPlayerplayedmatches().remove(playerplayedmatch);
		playerplayedmatch.setPlayerdata(null);

		return playerplayedmatch;
	}

}