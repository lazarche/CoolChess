package com.lazarborovica.chessgame.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the friendship database table.
 * 
 */
@Entity
@Table(name="friendship")
@NamedQuery(name="Friendship.findAll", query="SELECT f FROM Friendship f")
public class Friendship implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idFriendShip;

	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	//bi-directional many-to-one association to Message
	@OneToMany(mappedBy="friendship")
	private List<Message> messages;

	//bi-directional many-to-one association to Playerhasfriend
	@OneToMany(mappedBy="friendship")
	private List<Playerhasfriend> playerhasfriends;

	public Friendship() {
	}

	public int getIdFriendShip() {
		return this.idFriendShip;
	}

	public void setIdFriendShip(int idFriendShip) {
		this.idFriendShip = idFriendShip;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Message addMessage(Message message) {
		getMessages().add(message);
		message.setFriendship(this);

		return message;
	}

	public Message removeMessage(Message message) {
		getMessages().remove(message);
		message.setFriendship(null);

		return message;
	}

	public List<Playerhasfriend> getPlayerhasfriends() {
		return this.playerhasfriends;
	}

	public void setPlayerhasfriends(List<Playerhasfriend> playerhasfriends) {
		this.playerhasfriends = playerhasfriends;
	}

	public Playerhasfriend addPlayerhasfriend(Playerhasfriend playerhasfriend) {
		getPlayerhasfriends().add(playerhasfriend);
		playerhasfriend.setFriendship(this);

		return playerhasfriend;
	}

	public Playerhasfriend removePlayerhasfriend(Playerhasfriend playerhasfriend) {
		getPlayerhasfriends().remove(playerhasfriend);
		playerhasfriend.setFriendship(null);

		return playerhasfriend;
	}

}