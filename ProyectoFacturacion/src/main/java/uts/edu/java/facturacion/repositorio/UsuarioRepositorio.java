package uts.edu.java.facturacion.repositorio;
import org.springframework.data.jpa.repository.JpaRepository;

import uts.edu.java.facturacion.modelo.Usuario;

public interface UsuarioRepositorio extends JpaRepository<Usuario, Integer> {

}
