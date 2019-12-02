package com.pit.service;

import java.util.List;

import com.pit.model.Especialidad;
import com.pit.model.Reserva;
import com.pit.model.Ubigeo;
import com.pit.model.Usuario;

public interface UsuarioService {
	
	public String registrarUsuario(Usuario usuario);
	public String actualizarUsuario(Usuario usuario);
	public Usuario obtenerUsuario(String idLogin);
	public Usuario loginUsuario(String email, String contrasena);
	
	public List<Especialidad> listaEspecialidades();
	public List<Ubigeo> listaUbigeo(String ciudad, String provincia, String distrito);
	
	public int registrarReserva(Reserva reserva);
	public List<Reserva> listaReservas(int idUsuario, String tipo);
	public String atenderReserva(int idReserva);

}
