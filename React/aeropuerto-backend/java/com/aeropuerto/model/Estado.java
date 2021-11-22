package com.aeropuerto.model;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="estado")
public class Estado {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cod_estado;
	private String estado;
	
	@OneToMany
	@JoinColumn(name="cod_estado")
	private List<Vuelo> misvuelos;
	
	public int getCod_estado() {
		return cod_estado;
	}

	public void setCod_estado(int cod_estado) {
		this.cod_estado = cod_estado;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}