package com.aeropuerto.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.aeropuerto.model.Ruta;

@EnableJpaRepositories
@Repository
public interface RutaRepository extends JpaRepository<Ruta,Integer>{

}
