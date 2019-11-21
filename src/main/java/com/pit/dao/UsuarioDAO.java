package com.pit.dao;

import java.util.List;

import com.pit.model.Especialidad;
import com.pit.model.Reserva;
import com.pit.model.Ubigeo;
import com.pit.model.Usuario;

public interface UsuarioDAO {

	public String registrarUsuario(Usuario usuario);
	public String actualizarUsuario(Usuario usuario);
	public Usuario obtenerUsuario(String idLogin);
	
	public List<Especialidad> listaEspecialidades();
	public List<Ubigeo> listaUbigeo(String ciudad, String provincia, String distrito);
	
	public int registrarReserva(Reserva reserva);
	public List<Reserva> listaReservas(int idUsuario);
	
}
