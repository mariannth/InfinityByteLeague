package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Estado;
import com.infinitybyteleague.app.repository.EstadoRepository;
import com.infinitybyteleague.app.service.EstadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstadoServiceImpl implements EstadoService {

    @Autowired
    private EstadoRepository estadoRepository;

    @Override
    public List<Estado> listarEstados() {
        return estadoRepository.findAll();
    }

    @Override
    public Estado guardarEstado(Estado estado) {
        return estadoRepository.save(estado);
    }

    @Override
    public Estado obtenerEstadoPorId(Integer id) {
        return estadoRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Estado no encontrado: " + id));
    }

    @Override
    public void eliminarEstado(Integer id) {
        estadoRepository.deleteById(id);
    }
}
