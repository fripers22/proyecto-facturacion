package uts.edu.java.facturacion.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uts.edu.java.facturacion.modelo.Factura;
import uts.edu.java.facturacion.modelo.FacturaDetalle;
import uts.edu.java.facturacion.repositorio.FacturaRepositorio;
import uts.edu.java.facturacion.repositorio.FacturaDetalleRepositorio;

import java.util.List;

@Service
@Transactional
public class FacturaServicio {

    @Autowired
    private FacturaRepositorio facturaRepositorio;

    @Autowired
    private FacturaDetalleRepositorio detalleRepositorio;

    @Autowired
    private ProductoServicio productoServicio;

    public List<Factura> listarTodas() {
        return facturaRepositorio.findAll();
    }

    public Factura buscarPorId(Integer id) {
        return facturaRepositorio.findById(id).orElse(null);
    }

    public Factura guardar(Factura factura) {
        // Calcular total antes de guardar
        factura.calcularTotal();
        
        // Guardar factura
        Factura facturaGuardada = facturaRepositorio.save(factura);
        
        // Actualizar stock de productos
        for (FacturaDetalle detalle : factura.getDetalles()) {
            productoServicio.actualizarStock(
                detalle.getProducto().getId(), 
                detalle.getCantidad()
            );
        }
        
        return facturaGuardada;
    }

    public void eliminar(Integer id) {
        facturaRepositorio.deleteById(id);
    }

    public List<FacturaDetalle> obtenerDetalles(Integer facturaId) {
        return detalleRepositorio.findByFacturaId(facturaId);
    }
}
