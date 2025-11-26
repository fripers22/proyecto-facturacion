package uts.edu.java.facturacion.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uts.edu.java.facturacion.modelo.Factura;

@Repository
public interface FacturaRepositorio extends JpaRepository<Factura, Integer> {
}
