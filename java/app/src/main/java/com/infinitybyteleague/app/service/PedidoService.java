package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Pedido;
import java.util.List;

public interface PedidoService {
    List<Pedido> listarPedidos();
    Pedido guardarPedido(Pedido pedido);
    Pedido obtenerPedidoPorId(Integer id);
    void eliminarPedido(Integer id);
}
