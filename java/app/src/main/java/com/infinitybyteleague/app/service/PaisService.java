package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Pais;
import java.util.List;

public interface PaisService {
    List<Pais> listarPaises();
    Pais guardarPais(Pais pais);
    Pais obtenerPaisPorId(Integer id);
    void eliminarPais(Integer id);
}
