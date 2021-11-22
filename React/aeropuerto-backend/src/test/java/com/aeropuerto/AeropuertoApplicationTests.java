package com.aeropuerto;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.aeropuerto.model.Ruta;
import com.aeropuerto.model.Vuelo;
import com.aeropuerto.repository.RutaRepository;
import com.aeropuerto.repository.VueloRepository;

@SpringBootTest
class AeropuertoApplicationTests {

	@Autowired
	RutaRepository rutaRepository;

	@Autowired
	VueloRepository vueloRepository;

	@Test
	public void crearVuelo() {
		Vuelo vuelonuevo = new Vuelo();
		vuelonuevo.setCod_vuelo(11);
		vuelonuevo.setCod_estado(1);
		vuelonuevo.setCod_marca(1);
		vuelonuevo.setCod_persona(1);
		String mifecha = "2021-11-09";
		vuelonuevo.setFecha_reg(mifecha);
	}

	@Test
	public void listarVuelos() {
		List<Vuelo> misvuelos = vueloRepository.findAll();
		assertThat(misvuelos).size().isGreaterThan(0);
	}

	@Test
	public void listarunVuelo() {
		Vuelo vuelo = vueloRepository.findById(4).get();
		assertEquals(1, vuelo.getCod_estado());
	}

	@Test
	public void actualizarVuelo() {
		Vuelo avuelo = vueloRepository.findById(2).get();
		avuelo.setCod_estado(2);
		vueloRepository.save(avuelo);
		assertNotEquals(1, vueloRepository.findById(2).get().getCod_estado());
	}

	@Test
	public void eliminarVuelo() {
		vueloRepository.deleteById(6);
		assertThat(vueloRepository.existsById(6)).isFalse();
	}

	@Test
	public void listarRutas() {
		List<Ruta> misrutas = rutaRepository.findAll();
		assertThat(misrutas).size().isGreaterThan(0);
	}

	@Test
	public void listarRuta() {
		Ruta ruta = rutaRepository.findById(1).get();
		assertEquals(1, ruta.getCod_ruta());
	}
}