package com.aeropuerto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aeropuerto.model.Ruta;


@Service
public interface RutaService {
	
	public List<Ruta> findAllRuta();
}
