package uts.edu.java.facturacion.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.validation.Valid;
import uts.edu.java.facturacion.dto.UsuarioRegistroDTO;
import uts.edu.java.facturacion.servicio.UsuarioServicio;

@Controller
public class AuthControlador {
    
    @Autowired
    private UsuarioServicio usuarioServicio;
    
    @GetMapping("/")
    public String index() {
        return "redirect:/login";
    }
    
    @GetMapping("/login")
    public String mostrarFormularioLogin(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {
        
        if (error != null) {
            model.addAttribute("error", "Usuario o contraseña incorrectos");
        }
        
        if (logout != null) {
            model.addAttribute("mensaje", "Has cerrado sesión exitosamente");
        }
        
        return "login";
    }
    
    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("usuario", new UsuarioRegistroDTO());
        return "registro";
    }
    
    @PostMapping("/registro")
    public String registrarUsuario(
            @Valid @ModelAttribute("usuario") UsuarioRegistroDTO registroDTO,
            BindingResult result,
            Model model) {
        
        if (result.hasErrors()) {
            return "registro";
        }
        
        if (usuarioServicio.existePorUsername(registroDTO.getUsername())) {
            model.addAttribute("error", "El nombre de usuario ya está en uso");
            return "registro";
        }
        
        if (usuarioServicio.existePorEmail(registroDTO.getEmail())) {
            model.addAttribute("error", "El email ya está registrado");
            return "registro";
        }
        
        try {
            usuarioServicio.registrarUsuario(registroDTO);
            model.addAttribute("exito", "Registro exitoso. Por favor inicia sesión");
            return "redirect:/login?registro=exitoso";
        } catch (Exception e) {
            model.addAttribute("error", "Error al registrar el usuario: " + e.getMessage());
            return "registro";
        }
    }
    
    @GetMapping("/acceso-denegado")
    public String accesoDenegado() {
        return "acceso-denegado";
    }
}
