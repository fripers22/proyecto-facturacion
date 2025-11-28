package uts.edu.java.facturacion.modelo; 
 
import jakarta.persistence.*; 
import jakarta.validation.constraints.Email; 
import jakarta.validation.constraints.NotBlank; 
import jakarta.validation.constraints.Size; 
import java.util.HashSet; 
import java.util.Set; 
 
@Entity 
@Table(name = "usuarios") 
public class Usuario { 
 
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Long id; 
 
    @NotBlank(message = "El nombre de usuario es obligatorio") 
    @Size(min = 3, max = 50) 
    @Column(unique = true, nullable = false, length = 50) 
    private String username; 
 
    @NotBlank(message = "La contraseña es obligatoria") 
    @Size(min = 6) 
    @Column(nullable = false) 
    private String password; 
 
    @NotBlank(message = "El email es obligatorio") 
    @Email(message = "Debe proporcionar un email válido") 
    @Column(unique = true, nullable = false) 
    private String email; 
 
    @Column(nullable = false) 
    private String nombre; 
 
    @Column(nullable = false) 
    private String apellido; 
 
    private String cedula; 
 
    @Column(nullable = false) 
    private boolean enabled = true; 
 
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL) 
    @JoinTable( 
        name = "usuarios_roles", 
        joinColumns = @JoinColumn(name = "usuario_id"), 
        inverseJoinColumns = @JoinColumn(name = "rol_id") 
    ) 
    private Set<Rol> roles = new HashSet<>(); 
 
    public Usuario() { 
    } 
 
    public Usuario(String username, String password, String email, String nombre, String apellido) { 
        this.username = username; 
        this.password = password; 
        this.email = email; 
        this.nombre = nombre; 
        this.apellido = apellido; 
        this.enabled = true; 
    } 
 
    public Long getId() { 
        return id; 
    } 
 
    public void setId(Long id) { 
        this.id = id; 
    } 
 
    public String getUsername() { 
        return username; 
    } 
 
    public void setUsername(String username) { 
        this.username = username; 
    } 
 
    public String getPassword() { 
        return password; 
    } 
 
    public void setPassword(String password) { 
        this.password = password; 
    } 
 
    public String getEmail() { 
        return email; 
    } 
 
    public void setEmail(String email) { 
        this.email = email; 
    } 
 
    public String getNombre() { 
        return nombre; 
    } 
 
    public void setNombre(String nombre) { 
        this.nombre = nombre; 
    } 
 
    public String getApellido() { 
        return apellido; 
    } 
 
    public void setApellido(String apellido) { 
        this.apellido = apellido; 
    } 
 
    public String getCedula() { 
        return cedula; 
    } 
 
    public void setCedula(String cedula) { 
        this.cedula = cedula; 
    } 
 
    public boolean isEnabled() { 
        return enabled; 
    } 
 
    public void setEnabled(boolean enabled) { 
        this.enabled = enabled; 
    } 
 
    public Set<Rol> getRoles() {
        return roles;
    }

    public void setRoles(Set<Rol> roles) {
        this.roles = roles;
    }
    
    // Helper methods para formularios que usan rol singular
    public String getRol() {
        if (roles != null && !roles.isEmpty()) {
            return roles.iterator().next().getNombre();
        }
        return null;
    }
    
    public void setRol(String rolNombre) {
        // Este método se usa desde formularios - se maneja en el controlador
    }
}