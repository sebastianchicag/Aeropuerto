package com.aeropuerto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aeropuerto.model.Ruta;
import com.aeropuerto.repository.RutaRepository;
@CrossOrigin(origins ="http://localhost:3000")
@RestController
public class RutaController {
	
	@Autowired
	private RutaRepository rutaRepository;
	
	@RequestMapping(value="/Rutas",method=RequestMethod.GET, produces= "application/json")
	public List<Ruta> getRutas(){
		return rutaRepository.findAll();
	}
}
