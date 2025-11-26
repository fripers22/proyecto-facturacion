package uts.edu.java.facturacion.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uts.edu.java.facturacion.modelo.FacturaDetalle;

import java.util.List;

@Repository
public interface FacturaDetalleRepositorio extends JpaRepository<FacturaDetalle, Integer> {
    
    List<FacturaDetalle> findByFacturaId(Integer facturaId);
}
