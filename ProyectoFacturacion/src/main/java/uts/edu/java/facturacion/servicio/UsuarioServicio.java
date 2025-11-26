package uts.edu.java.facturacion.servicio;

import java.util.List;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import uts.edu.java.facturacion.dto.UsuarioRegistroDTO;
import uts.edu.java.facturacion.modelo.Rol;
import uts.edu.java.facturacion.modelo.Usuario;
import uts.edu.java.facturacion.repositorio.RolRepositorio;
import uts.edu.java.facturacion.repositorio.UsuarioRepositorio;

@Service
@Transactional
public class UsuarioServicio implements IUsuarioServicio {

    @Autowired
    UsuarioRepositorio usuarioRepositorio;
    
    @Autowired
    private RolRepositorio rolRepositorio;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

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
        return usuarioRepositorio.findById(Long.valueOf(id)).orElse(null);
    }

    @Override
    public void borrarUsuario(Integer id) {
        usuarioRepositorio.deleteById(Long.valueOf(id));
    }
    
    @Transactional
    public Usuario registrarUsuario(UsuarioRegistroDTO registroDTO) {
        if (usuarioRepositorio.existsByUsername(registroDTO.getUsername())) {
            throw new RuntimeException("El nombre de usuario ya está en uso");
        }
        
        if (usuarioRepositorio.existsByEmail(registroDTO.getEmail())) {
            throw new RuntimeException("El email ya está registrado");
        }
        
        Usuario usuario = new Usuario();
        usuario.setUsername(registroDTO.getUsername());
        usuario.setPassword(passwordEncoder.encode(registroDTO.getPassword()));
        usuario.setEmail(registroDTO.getEmail());
        usuario.setNombre(registroDTO.getNombre());
        usuario.setApellido(registroDTO.getApellido());
        usuario.setEnabled(true);
        
        Set<Rol> roles = new HashSet<>();
        Rol rolUser = rolRepositorio.findByNombre("ROLE_USER")
                .orElseGet(() -> {
                    Rol nuevoRol = new Rol("ROLE_USER");
                    return rolRepositorio.save(nuevoRol);
                });
        roles.add(rolUser);
        usuario.setRoles(roles);
        
        return usuarioRepositorio.save(usuario);
    }
    
    public Usuario buscarPorUsername(String username) {
        return usuarioRepositorio.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }
    
    public boolean existePorUsername(String username) {
        return usuarioRepositorio.existsByUsername(username);
    }
    
    public boolean existePorEmail(String email) {
        return usuarioRepositorio.existsByEmail(email);
    }
}
