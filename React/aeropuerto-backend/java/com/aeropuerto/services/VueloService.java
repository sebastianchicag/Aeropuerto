package com.aeropuerto.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.aeropuerto.model.Vuelo;

@Service
public interface VueloService {
	
	public List<Vuelo> findAllVuelo();
	public Optional<Vuelo> findVuelo(int cod_vuelo);
	public boolean saveVuelo(Vuelo misvuelos);
	public boolean deleteVuelo(int cod_vuelo);
	public boolean actualizarVuelo(Vuelo misvuelosn);
}