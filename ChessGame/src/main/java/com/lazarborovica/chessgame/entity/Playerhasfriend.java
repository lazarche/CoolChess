package com.lazarborovica.chessgame.entity;

import com.lazarborovica.chessgame.entity.Friendship;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the playerhasfriend database table.
 * 
 */
@Entity
@Table(name="playerhasfriend")
@NamedQuery(name="Playerhasfriend.findAll", query="SELECT p FROM Playerhasfriend p")
public class Playerhasfriend implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idtable1;

	@Column(length=45)
	private String status;

	//bi-directional many-to-one association to Friendship
	@ManyToOne
	@JoinColumn(name="PlayerHasFriend_idFriendShip", nullable=false)
	private Friendship friendship;

	//bi-directional many-to-one association to Player
	@ManyToOne
	@JoinColumn(name="Player_id", nullable=false)
	private Player player;

	public Playerhasfriend() {
	}

	public int getIdtable1() {
		return this.idtable1;
	}

	public void setIdtable1(int idtable1) {
		this.idtable1 = idtable1;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Friendship getFriendship() {
		return this.friendship;
	}

	public void setFriendship(Friendship friendship) {
		this.friendship = friendship;
	}

	public Player getPlayer() {
		return this.player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}


}