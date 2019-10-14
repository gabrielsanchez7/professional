package com.pit.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pit.model.Usuario;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private SessionFactory sessionFactory;

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

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> obtenerUsuarios(int codigoUsuario) {
		List<Usuario> lista = null;
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_usuarios");
			proc.registerStoredProcedureParameter("codigo", int.class, ParameterMode.IN);
			proc.setParameter("codigo", codigoUsuario);
			proc.execute(); 
			
			lista = (List<Usuario>) proc.getResultList();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return lista;
	}

	@Override
	public int actualizarUsuario(Usuario usuario) {
		int result = 0;
		
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
			
			proc.execute();
			result = proc.getUpdateCount();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public Usuario obtenerUsuario(String idLogin) {
		Usuario usuario = null;
		
		try {
//			Session session = sessionFactory.getCurrentSession();
//			usuario = session.createStoredProcedureCall("sp_obtener_usuario").
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_usuario");
			proc.registerStoredProcedureParameter("var_id_login", String.class, ParameterMode.IN);
			
			proc.setParameter("var_id_login", idLogin);
//			usuario = (Usuario)proc.getSingleResult();
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
				usuario.setCalificacion((int)obj[9]);
				usuario.setPresentacion((String)obj[10]);
				usuario.setTipoLogin((String)obj[11]);
				usuario.setFechaRegistro((Date)obj[12]);
			}
			
			return usuario;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return usuario;
	}
	
}
