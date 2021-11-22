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
@Table(name = "marca")
public class Marca {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_marca;
	private String nombre;

	@OneToMany
	@JoinColumn(name = "marca")
	private List<Avion> misaviones;
	
	@OneToMany
	@JoinColumn(name="cod_marca")
	private List<Vuelo> misvuelos;

	public int getCod_marca() {
		return cod_marca;
	}

	public void setCod_marca(int cod_marca) {
		this.cod_marca = cod_marca;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}