package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Pais;
import com.infinitybyteleague.app.repository.PaisRepository;
import com.infinitybyteleague.app.service.PaisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaisServiceImpl implements PaisService {

    @Autowired
    private PaisRepository paisRepository;

    @Override
    public List<Pais> listarPaises() {
        return paisRepository.findAll();
    }

    @Override
    public Pais guardarPais(Pais pais) {
        return paisRepository.save(pais);
    }

    @Override
    public Pais obtenerPaisPorId(Integer id) {
        return paisRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("País no encontrado: " + id));
    }

    @Override
    public void eliminarPais(Integer id) {
        paisRepository.deleteById(id);
    }
}
