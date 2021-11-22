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
@Table(name="ruta")
public class Ruta {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cod_ruta;
	private String origen;
	private String destino;
	
	@OneToMany
	@JoinColumn(name="cod_ruta")
	private List<Vuelo> miivuelos;
	
	
	public int getCod_ruta() {
		return cod_ruta;
	}

	public void setCod_ruta(int cod_ruta) {
		this.cod_ruta = cod_ruta;
	}

	public String getOrigen() {
		return origen;
	}

	public void setOrigen(String origen) {
		this.origen = origen;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

}
