package com.infinitybyteleague.app.repository;

import com.infinitybyteleague.app.model.Municipio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MunicipioRepository extends JpaRepository<Municipio, Integer> {
}
