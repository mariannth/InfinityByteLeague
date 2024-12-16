package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Pedido;
import com.infinitybyteleague.app.repository.PedidoRepository;
import com.infinitybyteleague.app.service.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PedidoServiceImpl implements PedidoService {

    @Autowired
    private PedidoRepository pedidoRepository;

    @Override
    public List<Pedido> listarPedidos() {
        return pedidoRepository.findAll();
    }

    @Override
    public Pedido guardarPedido(Pedido pedido) {
        return pedidoRepository.save(pedido);
    }

    @Override
    public Pedido obtenerPedidoPorId(Integer id) {
        return pedidoRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Pedido no encontrado: " + id));
    }

    @Override
    public void eliminarPedido(Integer id) {
        pedidoRepository.deleteById(id);
    }
}
