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
import com.pit.model.Oferta;
import com.pit.model.Reserva;
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
			proc.registerStoredProcedureParameter("var_id_ubigeo", int.class, ParameterMode.IN);
			
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
			proc.setParameter("var_id_ubigeo", usuario.getUbigeo() == null ? null : usuario.getUbigeo().getIdUbigeo());
			
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
				ubigeo.setIdUbigeo(obj[13] == null ? 0 : (int)obj[13]);
				ubigeo.setCiudad((String)obj[14]);
				ubigeo.setProvincia((String)obj[15]);
				ubigeo.setDistrito((String)obj[16]);
				usuario.setUbigeo(ubigeo);
				
				usuario.setRol((String)obj[17]);
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ubigeo> listaUbigeo(String ciudad, String provincia, String distrito) {
		List<Ubigeo> listaUbigeo = new ArrayList<>();
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_ubigeo");
			proc.registerStoredProcedureParameter("var_ciudad", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_provincia", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_distrito", String.class, ParameterMode.IN);
			
			proc.setParameter("var_ciudad", ciudad);
			proc.setParameter("var_provincia", provincia);
			proc.setParameter("var_distrito", distrito);
			
			List<Object[]> lista = proc.getResultList();
			for(Object[] obj : lista) {
				Ubigeo ubigeo = new Ubigeo();
				if(ciudad == null && provincia == null && distrito == null) {
					ubigeo.setCiudad((String)obj[0]);
				}
				else if(ciudad != null && provincia == null && distrito == null) {
					ubigeo.setCiudad((String)obj[0]);
					ubigeo.setProvincia((String)obj[1]);
				}
				else if(ciudad != null && provincia != null && distrito == null) {
					ubigeo.setIdUbigeo((int)obj[0]);
					ubigeo.setCiudad((String)obj[1]);
					ubigeo.setProvincia((String)obj[2]);
					ubigeo.setDistrito((String)obj[3]);
				}
				else {
					ubigeo.setIdUbigeo((int)obj[0]);
					ubigeo.setDistrito((String)obj[1]);
					ubigeo.setProvincia((String)obj[2]);
					ubigeo.setCiudad((String)obj[3]);
					ubigeo.setPais((String)obj[4]);
				}
				listaUbigeo.add(ubigeo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaUbigeo;
	}

	@Override
	public int registrarReserva(Reserva reserva) {
		int result = -1;
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_registrar_reserva");
			proc.registerStoredProcedureParameter("var_id_reserva", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_id_usuario", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_id_oferta", int.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_precio", Double.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_direccion", String.class, ParameterMode.IN);
			proc.registerStoredProcedureParameter("var_fecha", Date.class, ParameterMode.IN);
			
			proc.setParameter("var_id_reserva", reserva.getIdReserva());
			proc.setParameter("var_id_usuario", reserva.getUsuario().getIdUsuario());
			proc.setParameter("var_id_oferta", reserva.getOferta().getIdOferta());
			proc.setParameter("var_precio", reserva.getPrecio());
			proc.setParameter("var_direccion", reserva.getDireccion());
			proc.setParameter("var_fecha", reserva.getFecha());
			
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
	public List<Reserva> listaReservas(int idUsuario) {
		List<Reserva> listaReservas = new ArrayList<>();
		try {
			StoredProcedureQuery proc = entityManager.createStoredProcedureQuery("sp_obtener_reservas");
			proc.registerStoredProcedureParameter("var_id_usuario", int.class, ParameterMode.IN);
			proc.setParameter("var_id_usuario", idUsuario);
			List<Object[]> lista = proc.getResultList();
			for(Object[] obj : lista) {
				Reserva reserva = new Reserva();
				reserva.setIdReserva((int)obj[0]);
				
				Usuario usuario = new Usuario();
				usuario.setIdUsuario((int)obj[1]);
				usuario.setNombre((String)obj[2]);
				usuario.setApellidos((String)obj[3]);
				reserva.setUsuario(usuario);
				
				Oferta oferta = new Oferta();
				oferta.setIdOferta((int)obj[4]);
				reserva.setOferta(oferta);
				
				reserva.setPrecio((double)obj[5]);
				reserva.setDireccion((String)obj[6]);
				reserva.setFecha((Date)obj[7]);
				
				listaReservas.add(reserva);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaReservas;
	}
	
}
