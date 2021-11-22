package com.aeropuerto.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "factura")
public class Factura {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_factura;
	private String total;
	private String asiento;
	private String clase;
	private Date fecha_reg;
	private int cod_vuelo;

	
	public int getCod_factura() {
		return cod_factura;
	}

	public void setCod_factura(int cod_factura) {
		this.cod_factura = cod_factura;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getAsiento() {
		return asiento;
	}

	public void setAsiento(String asiento) {
		this.asiento = asiento;
	}

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public Date getFecha_reg() {
		return fecha_reg;
	}

	public void setFecha_reg(Date fecha_reg) {
		this.fecha_reg = fecha_reg;
	}

	public int getCod_vuelo() {
		return cod_vuelo;
	}

	public void setCod_vuelo(int cod_vuelo) {
		this.cod_vuelo = cod_vuelo;
	}

}
