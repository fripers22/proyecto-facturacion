package uts.edu.java.facturacion.servicio;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import uts.edu.java.facturacion.modelo.Usuario;
import uts.edu.java.facturacion.repositorio.UsuarioRepositorio;

@Service
@Transactional
public class UsuarioServicio implements IUsuarioServicio {

    // Atributo (objeto) de tipo Repositorio
    @Autowired
    UsuarioRepositorio usuarioRepositorio;

    @Override
    public List<Usuario> getUsuarios() {
        return usuarioRepositorio.findAll();
    }

    @Override
    public Usuario nuevoUsuario(Usuario usuario) {
        return usuarioRepositorio.save(usuario);
    }

    @Override
    public Usuario buscarUsuario(Integer id) {
        return usuarioRepositorio.findById(id).orElse(null);
    }

    @Override
    public void borrarUsuario(Integer id) {
        usuarioRepositorio.deleteById(id);
    }
}
