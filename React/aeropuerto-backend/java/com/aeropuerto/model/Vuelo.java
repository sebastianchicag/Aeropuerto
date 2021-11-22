package com.aeropuerto.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "vuelo")
public class Vuelo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_vuelo;
	private int cod_estado;
	private int cod_marca;
	private int cod_persona;
	
	private String fecha_reg;

	@OneToMany
	@JoinColumn(name = "cod_vuelo")
	private List<Factura> misfacturas;

	@ManyToOne
	@JoinColumn(name = "cod_ruta")
	private Ruta misrutas;

	public Ruta getMisrutas() {
		return misrutas;
	}

	public void setMisrutas(Ruta misrutas) {
		this.misrutas = misrutas;
	}

	public int getCod_vuelo() {
		return cod_vuelo;
	}

	public void setCod_vuelo(int cod_vuelo) {
		this.cod_vuelo = cod_vuelo;
	}

	public int getCod_estado() {
		return cod_estado;
	}

	public void setCod_estado(int cod_estado) {
		this.cod_estado = cod_estado;
	}

	public int getCod_marca() {
		return cod_marca;
	}

	public void setCod_marca(int cod_marca) {
		this.cod_marca = cod_marca;
	}

	public int getCod_persona() {
		return cod_persona;
	}

	public void setCod_persona(int cod_persona) {
		this.cod_persona = cod_persona;
	}

	public String getFecha_reg() {
		return fecha_reg;
	}

	public void setFecha_reg(String fecha_reg) {
		this.fecha_reg = fecha_reg;
	}

	public List<Factura> getMisfacturas() {
		return misfacturas;
	}

	public void setMisfacturas(List<Factura> misfacturas) {
		this.misfacturas = misfacturas;
	}
}