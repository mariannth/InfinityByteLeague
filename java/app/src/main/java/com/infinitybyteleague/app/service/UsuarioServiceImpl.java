package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Usuario;
import com.infinitybyteleague.app.repository.UsuarioRepository;
import com.infinitybyteleague.app.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public List<Usuario> listarUsuarios() {
        return usuarioRepository.findAll();
    }

    @Override
    public Usuario guardarUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    @Override
    public Usuario obtenerUsuarioPorId(Integer id) {
        return usuarioRepository.findById(id).orElseThrow(() -> 
            new RuntimeException("Usuario no encontrado: " + id));
    }

    @Override
    public void eliminarUsuario(Integer id) {
        usuarioRepository.deleteById(id);
    }
}
