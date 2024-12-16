package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Estado;
import java.util.List;

public interface EstadoService {
    List<Estado> listarEstados();
    Estado guardarEstado(Estado estado);
    Estado obtenerEstadoPorId(Integer id);
    void eliminarEstado(Integer id);
}
