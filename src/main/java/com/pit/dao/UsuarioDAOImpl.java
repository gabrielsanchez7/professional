package com.pit.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pit.model.Especialidad;
import com.pit.model.Ubigeo;
import com.pit.model.Usuario;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public String registrarUsuario(Usuario usuario) {
		String result = null;
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_registrar_usuario");
			proc.registerStoredProcedureParameter("var_id_login", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_nombre", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_apellidos", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_email", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_avatar", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_tipo_login", String.class, ParameterMode.IN);
			
			proc.setParameter("var_id_login", usuario.getIdLogin());
			proc.setParameter("var_nombre", usuario.getNombre());
			proc.setParameter("var_apellidos", usuario.getApellidos());
			proc.setParameter("var_email", usuario.getEmail());
			proc.setParameter("var_avatar", usuario.getAvatar());
			proc.setParameter("var_tipo_login", usuario.getTipoLogin());
			
			proc.execute();
			
			result = (String) proc.getSingleResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	@Transactional
	public String actualizarUsuario(Usuario usuario) {
		String result = null;
		
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_actualizar_usuario");
			proc.registerStoredProcedureParameter("var_id_login", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_nombre", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_apellidos", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_email", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_contrasena", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_fecha_nacimiento", Date.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_avatar", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_celular", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_calificacion", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_presentacion", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_rol", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_id_ubigeo", String.class, ParameterMode.IN);
			
			proc.setParameter("var_id_login", usuario.getIdLogin());
			proc.setParameter("var_nombre", usuario.getNombre());
			proc.setParameter("var_apellidos", usuario.getApellidos());
			proc.setParameter("var_email", usuario.getEmail());
			proc.setParameter("var_contrasena", usuario.getContrasena());
			proc.setParameter("var_fecha_nacimiento", usuario.getFechaNacimiento());
			proc.setParameter("var_avatar", usuario.getAvatar());
			proc.setParameter("var_celular", usuario.getCelular());
			proc.setParameter("var_calificacion", usuario.getCalificacion());
			proc.setParameter("var_presentacion", usuario.getPresentacion());
			proc.setParameter("var_rol", usuario.getRol());
			proc.setParameter("var_id_ubigeo", usuario.getUbigeo() == null ? null : usuario.getUbigeo().getIdubigeo());
			
			proc.execute();
			result = (String)proc.getSingleResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@SuppressWarnings({ "unchecked"})
	@Override
	public Usuario obtenerUsuario(String idLogin) {
		Usuario usuario = null;
		
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_usuario");
			proc.registerStoredProcedureParameter("var_id_login", String.class, ParameterMode.IN);
			
			proc.setParameter("var_id_login", idLogin);
			List<Object[]> lista = proc.getResultList();
			for(Object[] obj : lista) {
				usuario = new Usuario();
				usuario.setIdUsuario((int)obj[0]);
				usuario.setIdLogin((String)obj[1]);
				usuario.setNombre((String)obj[2]);
				usuario.setApellidos((String)obj[3]);
				usuario.setEmail((String)obj[4]);
				usuario.setContrasena((String)obj[5]);
				usuario.setFechaNacimiento((Date)obj[6]);
				usuario.setAvatar((String)obj[7]);
				usuario.setCelular((String)obj[8]);
				usuario.setCalificacion(obj[9] == null ? 0 : (int)obj[9]);
				usuario.setPresentacion((String)obj[10]);
				usuario.setTipoLogin((String)obj[11]);
				usuario.setFechaRegistro((Date)obj[12]);
				
				Ubigeo ubigeo = new Ubigeo();
				ubigeo.setIdubigeo(obj[13] == null ? 0 : (int)obj[13]);
				usuario.setUbigeo(ubigeo);
				
				usuario.setRol((String)obj[14]);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return usuario;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Especialidad> listaEspecialidades() {
		List<Especialidad> listaEspecialidades = new ArrayList<>();
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_especialidades");
			List<Object[]> lista = proc.getResultList();
			for(Object[] obj : lista) {
				Especialidad especialidad = new Especialidad();
				especialidad.setIdEspecialidad((int)obj[0]);
				especialidad.setDescripcion((String)obj[1]);
				
				listaEspecialidades.add(especialidad);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaEspecialidades;
	}
	
}
