package com.aeropuerto.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="persona")
public class Persona {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cod_persona;
	private String tipo_documento;
	private String doc_persona;
	private String nombre_persona;
	private String apellido_persona;
	private Date fecha_nac;
	private String sexo;
	private String correo;
	private String celular;
	private Date fecha_reg;
	
	@OneToMany
	@JoinColumn(name="cod_persona")
	private List<Vuelo> misvuelos;

	public int getCod_persona() {
		return cod_persona;
	}
	public void setCod_persona(int cod_persona) {
		this.cod_persona = cod_persona;
	}
	public String getTipo_documento() {
		return tipo_documento;
	}
	public void setTipo_documento(String tipo_documento) {
		this.tipo_documento = tipo_documento;
	}
	public String getDoc_persona() {
		return doc_persona;
	}
	public void setDoc_persona(String doc_persona) {
		this.doc_persona = doc_persona;
	}
	public String getNombre_persona() {
		return nombre_persona;
	}
	public void setNombre_persona(String nombre_persona) {
		this.nombre_persona = nombre_persona;
	}
	public String getApellido_persona() {
		return apellido_persona;
	}
	public void setApellido_persona(String apellido_persona) {
		this.apellido_persona = apellido_persona;
	}
	public Date getFecha_nac() {
		return fecha_nac;
	}
	public void setFecha_nac(Date fecha_nac) {
		this.fecha_nac = fecha_nac;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public Date getFecha_reg() {
		return fecha_reg;
	}
	public void setFecha_reg(Date fecha_reg) {
		this.fecha_reg = fecha_reg;
	}
}