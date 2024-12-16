package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Categoria;
import com.infinitybyteleague.app.repository.CategoriaRepository;
import com.infinitybyteleague.app.service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    @Autowired
    private CategoriaRepository categoriaRepository;

    @Override
    public List<Categoria> listarCategorias() {
        return categoriaRepository.findAll();
    }

    @Override
    public Categoria guardarCategoria(Categoria categoria) {
        return categoriaRepository.save(categoria);
    }

    @Override
    public Categoria obtenerCategoriaPorId(Integer id) {
        return categoriaRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Categoría no encontrada: " + id));
    }

    @Override
    public void eliminarCategoria(Integer id) {
        categoriaRepository.deleteById(id);
    }
}
