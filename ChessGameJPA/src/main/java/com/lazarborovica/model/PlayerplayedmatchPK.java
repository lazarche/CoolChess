package com.lazarborovica.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the playerplayedmatch database table.
 * 
 */
@Embeddable
public class PlayerplayedmatchPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private int playerData_id;

	@Column(insertable=false, updatable=false)
	private int match_id;

	public PlayerplayedmatchPK() {
	}
	public int getPlayerData_id() {
		return this.playerData_id;
	}
	public void setPlayerData_id(int playerData_id) {
		this.playerData_id = playerData_id;
	}
	public int getMatch_id() {
		return this.match_id;
	}
	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof PlayerplayedmatchPK)) {
			return false;
		}
		PlayerplayedmatchPK castOther = (PlayerplayedmatchPK)other;
		return 
			(this.playerData_id == castOther.playerData_id)
			&& (this.match_id == castOther.match_id);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.playerData_id;
		hash = hash * prime + this.match_id;
		
		return hash;
	}
}