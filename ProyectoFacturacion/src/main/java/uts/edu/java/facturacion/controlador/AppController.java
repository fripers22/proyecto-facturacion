package uts.edu.java.facturacion.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AppController {

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("titulo", "Gestión Empresarial");
        return "home";
    }

    @GetMapping("/bienvenida")
    public String bienvenida() {
        return "bienvenida";
    }

}
