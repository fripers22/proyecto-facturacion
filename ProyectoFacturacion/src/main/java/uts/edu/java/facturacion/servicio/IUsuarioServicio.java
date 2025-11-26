package uts.edu.java.facturacion.servicio;



import java.util.List;

import uts.edu.java.facturacion.modelo.Usuario;

public interface IUsuarioServicio {

    // Listar todos los usuarios
    List<Usuario> getUsuarios();

    // Crear o guardar un usuario
    Usuario nuevoUsuario(Usuario usuario);

    // Buscar un usuario por ID
    Usuario buscarUsuario(Integer id);

    // Eliminar un usuario por ID
    void borrarUsuario(Integer id);
}
