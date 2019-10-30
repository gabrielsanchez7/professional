package com.pit.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="tb_ubigeo")
public class Ubigeo implements Serializable {

	@Id
	@Column(name="id_ubigeo")
	private int idubigeo;
	
	@Column
	private String distrito;
	
	@Column
	private String provincia;
	
	@Column
	private String ciudad;
	
	@Column
	private String pais;

	public int getIdubigeo() {
		return idubigeo;
	}

	public void setIdubigeo(int idubigeo) {
		this.idubigeo = idubigeo;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}
	
}
