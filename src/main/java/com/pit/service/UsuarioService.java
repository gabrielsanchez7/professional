package com.pit.service;

import java.util.List;

import com.pit.model.Usuario;

public interface UsuarioService {
	
	public String registrarUsuario(Usuario usuario);
	public List<Usuario> obtenerUsuarios(int codigoUsuario);
	public int actualizarUsuario(Usuario usuario);
	public Usuario obtenerUsuario(String idLogin);

}
