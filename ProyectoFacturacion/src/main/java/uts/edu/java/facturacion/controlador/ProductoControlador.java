package uts.edu.java.facturacion.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uts.edu.java.facturacion.modelo.Producto;
import uts.edu.java.facturacion.servicio.ProductoServicio;

import java.util.List;

@Controller
@RequestMapping("/views/producto")
public class ProductoControlador {

    @Autowired
    private ProductoServicio productoServicio;

    // Lista de productos
    @GetMapping("/")
    public String listar(Model model) {
        List<Producto> productos = productoServicio.listarTodos();
        model.addAttribute("productos", productos);
        return "/views/producto/producto";
    }

    // Formulario para nuevo producto
    @GetMapping("/new")
    public String mostrarFormularioNuevo(Model model) {
        model.addAttribute("producto", new Producto());
        return "/views/producto/nuevo_producto";
    }

    // Guardar producto
    @PostMapping("/save")
    public String guardar(@ModelAttribute Producto producto) {
        productoServicio.guardar(producto);
        return "redirect:/views/producto/";
    }

    // Formulario para editar producto
    @GetMapping("/editar/{id}")
    public String mostrarFormularioEditar(@PathVariable Integer id, Model model) {
        Producto producto = productoServicio.buscarPorId(id);
        model.addAttribute("producto", producto);
        return "/views/producto/editar_producto";
    }

    // Eliminar producto
    @GetMapping("/delete/{id}")
    public String eliminar(@PathVariable Integer id) {
        productoServicio.eliminar(id);
        return "redirect:/views/producto/";
    }
}
