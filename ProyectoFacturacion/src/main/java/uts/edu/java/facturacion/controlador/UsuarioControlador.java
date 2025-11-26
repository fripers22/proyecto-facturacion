package uts.edu.java.facturacion.controlador;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import uts.edu.java.facturacion.modelo.Usuario;
import uts.edu.java.facturacion.servicio.UsuarioServicio;

@Controller
@RequestMapping("/views/usuario")
public class UsuarioControlador {

    @Autowired
    UsuarioServicio usuarioServicio;

    // -----------------------------------------------------
    // Página principal (lista de usuarios)
    // -----------------------------------------------------
    @RequestMapping("/")
    public String verIndex(Model model) {
        List<Usuario> listaUsuarios = usuarioServicio.getUsuarios();
        model.addAttribute("listaUsuarios", listaUsuarios);
        return "/views/usuario/usuario";
    }

    // -----------------------------------------------------
    // Página para registrar un nuevo usuario
    // -----------------------------------------------------
    @RequestMapping("/new")
    public String mostrarPaginaNuevoUsuario(Model model) {
        Usuario usuario = new Usuario();
        model.addAttribute("usuario", usuario);
        return "/views/usuario/nuevo_usuario";
    }

    // -----------------------------------------------------
    // Guardar usuario (nuevo o editado)
    // -----------------------------------------------------
    @PostMapping("/save")
    public String saveUsuario(Usuario usuario, Model model) {
        usuarioServicio.nuevoUsuario(usuario);
        return "redirect:/views/usuario/";
    }

    // -----------------------------------------------------
    // Cargar datos del usuario para editar
    // -----------------------------------------------------
    @GetMapping("/listar/{id}")
    public String listarId(@PathVariable int id, Model model) {
        model.addAttribute("usuario", usuarioServicio.buscarUsuario(id));
        return "/views/usuario/editar_usuario";
    }

    // -----------------------------------------------------
    // Eliminar usuario por ID
    // -----------------------------------------------------
    @RequestMapping("/delete/{id}")
    public String deleteUsuario(@PathVariable(name = "id") int id) {
        usuarioServicio.borrarUsuario(id);
        return "redirect:/views/usuario/";
    }
}

