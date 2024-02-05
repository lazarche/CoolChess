package com.lazarborovica.chessgame.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the player database table.
 * 
 */
@Entity
@Table(name="player")
@NamedQuery(name="Player.findAll", query="SELECT p FROM Player p")
public class Player implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(length=45)
	private String email;

	@Column(length=45)
	private String firstName;

	@Column(length=45)
	private String lastName;

	@Column(length=255)
	private String password;

	@Column(length=255)
	private String profileImage;

	private int status;

	@Column(length=45)
	private String username;

	//bi-directional many-to-one association to Chessmove
	@OneToMany(mappedBy="player")
	private List<Chessmove> chessmoves;

	//bi-directional many-to-one association to Message
	@OneToMany(mappedBy="player")
	private List<Message> messages;

	//bi-directional many-to-one association to Playerhaschessmatch
	@OneToMany(mappedBy="player")
	private List<Playerhaschessmatch> playerhaschessmatches;

	//bi-directional many-to-one association to Playerhasfriend
	@OneToMany(mappedBy="player")
	private List<Playerhasfriend> playerhasfriends;

	public Player() {
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

	public String getProfileImage() {
		return this.profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
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

	public List<Chessmove> getChessmoves() {
		return this.chessmoves;
	}

	public void setChessmoves(List<Chessmove> chessmoves) {
		this.chessmoves = chessmoves;
	}

	public Chessmove addChessmove(Chessmove chessmove) {
		getChessmoves().add(chessmove);
		chessmove.setPlayer(this);

		return chessmove;
	}

	public Chessmove removeChessmove(Chessmove chessmove) {
		getChessmoves().remove(chessmove);
		chessmove.setPlayer(null);

		return chessmove;
	}

	public List<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Message addMessage(Message message) {
		getMessages().add(message);
		message.setPlayer(this);

		return message;
	}

	public Message removeMessage(Message message) {
		getMessages().remove(message);
		message.setPlayer(null);

		return message;
	}

	public List<Playerhaschessmatch> getPlayerhaschessmatches() {
		return this.playerhaschessmatches;
	}

	public void setPlayerhaschessmatches(List<Playerhaschessmatch> playerhaschessmatches) {
		this.playerhaschessmatches = playerhaschessmatches;
	}

	public Playerhaschessmatch addPlayerhaschessmatch(Playerhaschessmatch playerhaschessmatch) {
		getPlayerhaschessmatches().add(playerhaschessmatch);
		playerhaschessmatch.setPlayer(this);

		return playerhaschessmatch;
	}

	public Playerhaschessmatch removePlayerhaschessmatch(Playerhaschessmatch playerhaschessmatch) {
		getPlayerhaschessmatches().remove(playerhaschessmatch);
		playerhaschessmatch.setPlayer(null);

		return playerhaschessmatch;
	}

	public List<Playerhasfriend> getPlayerhasfriends() {
		return this.playerhasfriends;
	}

	public void setPlayerhasfriends(List<Playerhasfriend> playerhasfriends) {
		this.playerhasfriends = playerhasfriends;
	}

	public Playerhasfriend addPlayerhasfriend(Playerhasfriend playerhasfriend) {
		getPlayerhasfriends().add(playerhasfriend);
		playerhasfriend.setPlayer(this);

		return playerhasfriend;
	}

	public Playerhasfriend removePlayerhasfriend(Playerhasfriend playerhasfriend) {
		getPlayerhasfriends().remove(playerhasfriend);
		playerhasfriend.setPlayer(null);

		return playerhasfriend;
	}

}