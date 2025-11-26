package uts.edu.java.facturacion.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uts.edu.java.facturacion.modelo.Factura;
import uts.edu.java.facturacion.modelo.FacturaDetalle;
import uts.edu.java.facturacion.modelo.Producto;
import uts.edu.java.facturacion.servicio.FacturaServicio;
import uts.edu.java.facturacion.servicio.ProductoServicio;

import java.util.List;

@Controller
@RequestMapping("/views/factura")
public class FacturaControlador {

    @Autowired
    private FacturaServicio facturaServicio;

    @Autowired
    private ProductoServicio productoServicio;

    // Lista de facturas
    @GetMapping("/")
    public String listar(Model model) {
        List<Factura> facturas = facturaServicio.listarTodas();
        model.addAttribute("facturas", facturas);
        return "/views/factura/factura";
    }

    // Formulario para nueva factura
    @GetMapping("/new")
    public String mostrarFormularioNuevo(Model model) {
        model.addAttribute("factura", new Factura());
        List<Producto> productos = productoServicio.listarTodos();
        model.addAttribute("productos", productos);
        return "/views/factura/nueva_factura";
    }

    // Guardar factura
    @PostMapping("/save")
    public String guardar(@ModelAttribute Factura factura) {
        facturaServicio.guardar(factura);
        return "redirect:/views/factura/";
    }

    // Ver detalles de factura
    @GetMapping("/detalle/{id}")
    public String verDetalle(@PathVariable Integer id, Model model) {
        Factura factura = facturaServicio.buscarPorId(id);
        model.addAttribute("factura", factura);
        return "/views/factura/detalle_factura";
    }

    // Eliminar factura
    @GetMapping("/delete/{id}")
    public String eliminar(@PathVariable Integer id) {
        facturaServicio.eliminar(id);
        return "redirect:/views/factura/";
    }
}
