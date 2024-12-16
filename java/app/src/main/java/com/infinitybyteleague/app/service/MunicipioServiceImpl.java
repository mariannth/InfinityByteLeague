package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Municipio;
import com.infinitybyteleague.app.repository.MunicipioRepository;
import com.infinitybyteleague.app.service.MunicipioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MunicipioServiceImpl implements MunicipioService {

    @Autowired
    private MunicipioRepository municipioRepository;

    @Override
    public List<Municipio> listarMunicipios() {
        return municipioRepository.findAll();
    }

    @Override
    public Municipio guardarMunicipio(Municipio municipio) {
        return municipioRepository.save(municipio);
    }

    @Override
    public Municipio obtenerMunicipioPorId(Integer id) {
        return municipioRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Municipio no encontrado: " + id));
    }

    @Override
    public void eliminarMunicipio(Integer id) {
        municipioRepository.deleteById(id);
    }
}
