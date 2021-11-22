package com.aeropuerto.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aeropuerto.model.Ruta;
import com.aeropuerto.model.Vuelo;

import com.aeropuerto.repository.VueloRepository;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class VueloController {

	@Autowired
	private VueloRepository vueloRepository;

	@PostMapping("/registrarVuelos")
	Vuelo vuelonuevo(@RequestBody Vuelo vuelonuevo) {
		return vueloRepository.save(vuelonuevo);
	}

	@GetMapping("/listarVuelos/{cod_vuelo}")
	public ResponseEntity<Vuelo> getTutorialById(@PathVariable("cod_vuelo") int cod_vuelo) {
		Optional<Vuelo> tutorialData = vueloRepository.findById(cod_vuelo);

		if (tutorialData.isPresent()) {
			return new ResponseEntity<>(tutorialData.get(), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@PutMapping("/editarVuelo/{cod_vuelo}")
	public ResponseEntity<?> update(@RequestBody Vuelo vuelodetalle,
			@PathVariable(value = "cod_vuelo") Integer cod_vuelo) {
		Optional<Vuelo> vuelo = vueloRepository.findById(cod_vuelo);

		if (!vuelo.isPresent()) {
			return ResponseEntity.notFound().build();
		}

		vuelo.get().setCod_estado(vuelodetalle.getCod_estado());
		vuelo.get().setCod_marca(vuelodetalle.getCod_marca());
		vuelo.get().setCod_persona(vuelodetalle.getCod_persona());
		vuelo.get().setFecha_reg(vuelodetalle.getFecha_reg());
		vuelo.get().setMisrutas(vuelodetalle.getMisrutas());
		vueloRepository.save(vuelo.get());

		return ResponseEntity.status(HttpStatus.CREATED).body(vueloRepository.save(vuelo.get()));
	}

	@DeleteMapping("/eliminar/{cod_vuelo}")
	public String eliminarvuelo(@PathVariable("cod_vuelo") int cod_vuelo) {
		vueloRepository.deleteById(cod_vuelo);
		return "Registro Eliminado";
	}

	@RequestMapping(value = "/Vuelos", method = RequestMethod.GET, produces = "application/json")
	public List<Vuelo> getVuelos() {

		return vueloRepository.findAll();
	}

	@RequestMapping(value = "/VuelosporFecha/{fecha_reg}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Vuelo> getCod_vuelo(@PathVariable("fecha_reg") String fecha_reg) {

		int id = 0;

		List<Vuelo> vuelos = vueloRepository.findAll();

		for (Vuelo vuelo1 : vuelos) {
			if (vuelo1.getFecha_reg().equals(fecha_reg)) {
				id = vuelo1.getCod_vuelo();
			}
		}

		Optional<Vuelo> vuelosfecha = vueloRepository.findById(id);

		if (vuelosfecha.isPresent()) {

			return ResponseEntity.ok(vuelosfecha.get());

		} else {

			return ResponseEntity.noContent().build();

		}
	}

	@RequestMapping(value = "/VuelosporRuta/{cod_ruta}", method = RequestMethod.GET, produces = "application/json")
	public List<Vuelo> getCod_vuelo(@PathVariable("cod_ruta") Ruta cod_ruta) {
		List<Vuelo> vuelos = vueloRepository.findAll();

		List<Vuelo> rutas = new ArrayList<>();

		for (Vuelo vueloruta : vuelos) {
			if (vueloruta.getMisrutas().getCod_ruta() == (cod_ruta.getCod_ruta())) {
				rutas.add(vueloruta);
			}
		}
		rutas = vueloRepository.findAll();
		return rutas;

	}
}