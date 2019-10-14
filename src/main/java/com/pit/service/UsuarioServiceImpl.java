package com.pit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pit.dao.UsuarioDAO;
import com.pit.model.Usuario;

@Service
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private UsuarioDAO usuarioDAO;

	@Override
	public String registrarUsuario(Usuario usuario) {
		return usuarioDAO.registrarUsuario(usuario);
	}

	@Override
	public List<Usuario> obtenerUsuarios(int codigoUsuario) {
		return usuarioDAO.obtenerUsuarios(codigoUsuario);
	}

	@Override
	public int actualizarUsuario(Usuario usuario) {
		return usuarioDAO.actualizarUsuario(usuario);
	}

	@Override
	public Usuario obtenerUsuario(String idLogin) {
		return usuarioDAO.obtenerUsuario(idLogin);
	}

}
