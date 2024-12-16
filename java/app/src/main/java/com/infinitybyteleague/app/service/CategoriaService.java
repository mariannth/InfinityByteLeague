package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Categoria;
import java.util.List;

public interface CategoriaService {
    List<Categoria> listarCategorias();
    Categoria guardarCategoria(Categoria categoria);
    Categoria obtenerCategoriaPorId(Integer id);
    void eliminarCategoria(Integer id);
}
