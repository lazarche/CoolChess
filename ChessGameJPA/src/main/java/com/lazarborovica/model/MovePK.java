package com.lazarborovica.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the move database table.
 * 
 */
@Embeddable
public class MovePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private int id;

	@Column(insertable=false, updatable=false)
	private int match_id;

	@Column(insertable=false, updatable=false)
	private int playerData_id;

	public MovePK() {
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMatch_id() {
		return this.match_id;
	}
	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}
	public int getPlayerData_id() {
		return this.playerData_id;
	}
	public void setPlayerData_id(int playerData_id) {
		this.playerData_id = playerData_id;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof MovePK)) {
			return false;
		}
		MovePK castOther = (MovePK)other;
		return 
			(this.id == castOther.id)
			&& (this.match_id == castOther.match_id)
			&& (this.playerData_id == castOther.playerData_id);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.id;
		hash = hash * prime + this.match_id;
		hash = hash * prime + this.playerData_id;
		
		return hash;
	}
}