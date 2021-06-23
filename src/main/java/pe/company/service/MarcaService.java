
package pe.company.service;

import java.util.Collection;
import pe.company.model.Marca;


public interface MarcaService {
    
    public abstract void insert(Marca marca);
    public abstract void update(Marca marca);
    public abstract void delete(Integer id_marca);
    
    public abstract Marca findById(Integer id_marca);
 
    public abstract Collection<Marca> findAll();
    public abstract boolean isExist(Integer id_marca); 
}
