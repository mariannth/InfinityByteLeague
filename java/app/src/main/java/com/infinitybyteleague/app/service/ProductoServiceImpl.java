package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Producto;
import com.infinitybyteleague.app.repository.ProductoRepository;
import com.infinitybyteleague.app.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    @Override
    public List<Producto> listarProductos() {
        return productoRepository.findAll();
    }

    @Override
    public Producto guardarProducto(Producto producto) {
        return productoRepository.save(producto);
    }

    @Override
    public Producto obtenerProductoPorId(Integer id) {
        return productoRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Producto no encontrado: " + id));
    }

    @Override
    public void eliminarProducto(Integer id) {
        productoRepository.deleteById(id);
    }
}
