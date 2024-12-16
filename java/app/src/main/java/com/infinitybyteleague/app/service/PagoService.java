package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Pago;
import java.util.List;

public interface PagoService {
    List<Pago> listarPagos();
    Pago guardarPago(Pago pago);
    Pago obtenerPagoPorId(Integer id);
    void eliminarPago(Integer id);
}

