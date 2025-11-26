package uts.edu.java.facturacion.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AppController {

    @GetMapping("/bienvenida")
    public String bienvenida() {
        return "bienvenida";
    }

}
