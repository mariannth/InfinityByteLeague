package com.infinitybyteleague.app.service;

import com.infinitybyteleague.app.model.Usuario;
import java.util.List;

public interface UsuarioService {
    List<Usuario> listarUsuarios();
    Usuario guardarUsuario(Usuario usuario);
    Usuario obtenerUsuarioPorId(Integer id);
    void eliminarUsuario(Integer id);
}
