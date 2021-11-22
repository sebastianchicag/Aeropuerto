package com.aeropuerto.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name = "avion")
public class Avion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_avion;
	private String descipcion;
	private String capacidad;
	private int marca;

	public int getCod_avion() {
		return cod_avion;
	}

	public void setCod_avion(int cod_avion) {
		this.cod_avion = cod_avion;
	}

	public String getDescipcion() {
		return descipcion;
	}

	public void setDescipcion(String descipcion) {
		this.descipcion = descipcion;
	}

	public String getCapacidad() {
		return capacidad;
	}

	public void setCapacidad(String capacidad) {
		this.capacidad = capacidad;
	}

	public int getMarca() {
		return marca;
	}

	public void setMarca(int marca) {
		this.marca = marca;
	}

}