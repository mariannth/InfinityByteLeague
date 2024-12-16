package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Producto;
import java.util.List;

public interface ProductoService {
    List<Producto> listarProductos();
    Producto guardarProducto(Producto producto);
    Producto obtenerProductoPorId(Integer id);
    void eliminarProducto(Integer id);
}
