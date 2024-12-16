package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Pago;
import com.infinitybyteleague.app.repository.PagoRepository;
import com.infinitybyteleague.app.service.PagoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PagoServiceImpl implements PagoService {

    @Autowired
    private PagoRepository pagoRepository;

    @Override
    public List<Pago> listarPagos() {
        return pagoRepository.findAll();
    }

    @Override
    public Pago guardarPago(Pago pago) {
        return pagoRepository.save(pago);
    }

    @Override
    public Pago obtenerPagoPorId(Integer id) {
        return pagoRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Pago no encontrado: " + id));
    }

    @Override
    public void eliminarPago(Integer id) {
        pagoRepository.deleteById(id);
    }
}
