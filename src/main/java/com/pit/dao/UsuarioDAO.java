package com.pit.dao;

import java.util.List;

import com.pit.model.Usuario;

public interface UsuarioDAO {

	public String registrarUsuario(Usuario usuario);
	public List<Usuario> obtenerUsuarios(int codigoUsuario);
	public int actualizarUsuario(Usuario usuario);
	public Usuario obtenerUsuario(String idLogin);
	
}
