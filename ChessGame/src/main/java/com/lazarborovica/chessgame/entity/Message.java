package com.lazarborovica.chessgame.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the message database table.
 * 
 */
@Entity
@Table(name="message")
@NamedQuery(name="Message.findAll", query="SELECT m FROM Message m")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idMessage;

	@Column(length=1000)
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	private Date time;

	//bi-directional many-to-one association to Player
	@ManyToOne
	@JoinColumn(name="Player_id", nullable=false)
	private Player player;

	//bi-directional many-to-one association to Friendship
	@ManyToOne
	@JoinColumn(name="PlayerHasFriend_idFriendShip", nullable=false)
	private Friendship friendship;

	public Message() {
	}

	public int getIdMessage() {
		return this.idMessage;
	}

	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Player getPlayer() {
		return this.player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Friendship getFriendship() {
		return this.friendship;
	}

	public void setFriendship(Friendship friendship) {
		this.friendship = friendship;
	}

}