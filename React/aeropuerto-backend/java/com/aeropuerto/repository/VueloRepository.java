package com.aeropuerto.repository;




import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.aeropuerto.model.Vuelo;

@EnableJpaRepositories
@Repository
public interface VueloRepository extends JpaRepository<Vuelo,Integer>{
}
