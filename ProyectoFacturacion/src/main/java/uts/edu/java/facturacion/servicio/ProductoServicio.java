package uts.edu.java.facturacion.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uts.edu.java.facturacion.modelo.Producto;
import uts.edu.java.facturacion.repositorio.ProductoRepositorio;

import java.util.List;

@Service
@Transactional
public class ProductoServicio {

    @Autowired
    private ProductoRepositorio productoRepositorio;

    public List<Producto> listarTodos() {
        return productoRepositorio.findAll();
    }

    public Producto buscarPorId(Integer id) {
        return productoRepositorio.findById(id).orElse(null);
    }

    public Producto guardar(Producto producto) {
        return productoRepositorio.save(producto);
    }

    public void eliminar(Integer id) {
        productoRepositorio.deleteById(id);
    }

    public void actualizarStock(Integer id, Integer cantidad) {
        Producto producto = buscarPorId(id);
        if (producto != null) {
            producto.setStock(producto.getStock() - cantidad);
            productoRepositorio.save(producto);
        }
    }
}
