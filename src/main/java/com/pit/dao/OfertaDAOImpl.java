package com.pit.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pit.model.Especialidad;
import com.pit.model.Oferta;
import com.pit.model.Usuario;

@Repository
public class OfertaDAOImpl implements OfertaDAO {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public int registrarOferta(Oferta oferta) {
		int result = -1;
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_registrar_oferta");
			proc.registerStoredProcedureParameter("var_id_usuario", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_id_especialidad", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_descripcion", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_precio_hora", double.class, ParameterMode.IN);
			
			proc.setParameter("var_id_usuario", oferta.getUsuario().getIdUsuario());
			proc.setParameter("var_id_especialidad", oferta.getEspecialidad().getIdEspecialidad());
			proc.setParameter("var_descripcion", oferta.getDescripcion());
			proc.setParameter("var_precio_hora", oferta.getPrecioHora());
			
			proc.execute();
			
			result = Integer.parseInt((String) proc.getSingleResult());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Oferta> listaOfertas(int idUsuario, int idOferta) {
		List<Oferta> listaOfertas = new ArrayList<>();
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_ofertas");
			proc.registerStoredProcedureParameter("var_id_usuario", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_id_oferta", int.class, ParameterMode.IN);
			proc.setParameter("var_id_usuario", idUsuario);
			proc.setParameter("var_id_oferta", idOferta);
			
			List<Object[]> lista = proc.getResultList();
			for(Object[] obj : lista) {
				Oferta oferta = new Oferta();
				oferta.setIdOferta((int)obj[0]);
				oferta.setDescripcion((String)obj[1]);
				oferta.setPrecioHora((double)obj[2]);
				
				Usuario usuario = new Usuario();
				usuario.setIdUsuario((int)obj[3]);
				usuario.setNombre((String)obj[4]);
				usuario.setApellidos((String)obj[5]);
				usuario.setAvatar((String)obj[6]);
				usuario.setCelular((String)obj[7]);
				usuario.setCalificacion((int)obj[8]);
				usuario.setPresentacion((String)obj[9]);
				oferta.setUsuario(usuario);
				
				Especialidad especialidad = new Especialidad();
				especialidad.setIdEspecialidad((int)obj[10]);
				especialidad.setDescripcion((String)obj[11]);
				oferta.setEspecialidad(especialidad);
				
				listaOfertas.add(oferta);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return listaOfertas;
	}

}
