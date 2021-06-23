
package pe.company.service;

import java.util.Collection;
import pe.company.model.Categoria;


public interface CategoriaService {
    
    public abstract void insert(Categoria categoria);
    public abstract void update(Categoria categoria);
    public abstract void delete(Integer id_categoria);
    
    public abstract Categoria findById(Integer id_categoria);
    public abstract Collection<Categoria> findAll();
    public abstract boolean isExist(Integer id_categoria); 
}
