
package pe.company.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;


@Configuration //esta clase es de configuracion
@EnableWebSecurity //habilita el uso de spring security
public class SecurityConfig 
        extends WebSecurityConfigurerAdapter
{
    @Autowired
    @Qualifier("customSuccessHandler")
    private SimpleUrlAuthenticationSuccessHandler successHandler;
    
    @Autowired
    @Qualifier("userDetailsServiceImpl")
    private UserDetailsService detailsService;

    //método para los usuarios autenticados (en memoria)
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception 
    {
        //se verifica el usuario si existe en la BD
        auth.userDetailsService(detailsService);
        
        //el usuario autenticado utiliza servicios del proveedor
        auth.authenticationProvider(daoAuthenticationProvider());
        
    } 

    //método para las autorizaciones de los usuarios
    @Override
    protected void configure(HttpSecurity http) throws Exception 
    {
        
            //dando permiso de URLs según el rol del usuario
        http.authorizeRequests()
            .antMatchers("/","/index").permitAll()
               .antMatchers("/administrador/**","/usuario/**","/usuario_nuevo/**","/usuario_editar/**","/usuario_eliminar/**"
                    ,"/roles/**","/tipoDocumento/**","/tipoDocumento_nuevo/**","/tipoDocumento_editar/**","/tipoDocumento_eliminar/**"
                    ,"/cliente/**","/cliente_nuevo/**","/cliente_editar/**","/cliente_eliminar/**"
                    ,"/proveedor/**","/proveedor_nuevo/**","/proveedor_editar/**","/proveedor_eliminar/**"
                    ).access("hasRole('ADMINISTRADOR')")     
                
            .antMatchers("/vendedor/**","/venta/**","/tipoPago/**").access("hasRole('VENDEDOR')")
                
            .antMatchers("/almacenero/**", "/reporte/**","/compra/**", "/compra_nuevo/**","/marca/**","/marca_nuevo/**","/marca_editar/**","/marca_eliminar/**"
                    ,"/categoria/**","/categoria_nuevo/**","/categoria_editar/**","/categoria_eliminar/**"
                    ,"/producto/**","/producto_nuevo/**","/producto_editar/**","/producto_eliminar/**").access("hasRole('ALMACENERO')")
            .antMatchers("/clientes/**").access("hasRole('CLIENTES')");

        //se usará un fomulario login personalizado
        http.authorizeRequests().and()
            .formLogin()
            .loginPage("/login")
            .usernameParameter("txtUsername")
            .passwordParameter("txtPassword")
            .successHandler(successHandler);
        
        //URL de mensaje de error de acceso no permitido
        //se busca el value: /access_denied y debe mostrar la página de error
        http.authorizeRequests().and()
            .exceptionHandling().accessDeniedPage("/access_denied");
        
        //protección contra ataques maliciosos
        http.authorizeRequests().and()
            .csrf();
    }  
    
    //bean que especifica el tipo de cifrado
    @Bean
    public PasswordEncoder passwordEncoder() {
        PasswordEncoder pe=new BCryptPasswordEncoder();
        return pe;
    }
    
    //bea que se detalla las provisiones disponibles
    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider()
    {
        //objeto proveedor
        DaoAuthenticationProvider dap=
                new DaoAuthenticationProvider();
        
        dap.setUserDetailsService(detailsService);
        dap.setPasswordEncoder(passwordEncoder());
        
        return dap;                
    }
}
