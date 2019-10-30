package com.pit.service;

import java.util.List;

import com.pit.model.Especialidad;
import com.pit.model.Usuario;

public interface UsuarioService {
	
	public String registrarUsuario(Usuario usuario);
	public String actualizarUsuario(Usuario usuario);
	public Usuario obtenerUsuario(String idLogin);
	
	public List<Especialidad> listaEspecialidades();

}
