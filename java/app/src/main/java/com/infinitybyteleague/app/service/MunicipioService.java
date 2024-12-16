package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Municipio;
import java.util.List;

public interface MunicipioService {
    List<Municipio> listarMunicipios();
    Municipio guardarMunicipio(Municipio municipio);
    Municipio obtenerMunicipioPorId(Integer id);
    void eliminarMunicipio(Integer id);
}
