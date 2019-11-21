package com.pit.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pit.model.Usuario;

public class UtilWeb {

	public static Usuario usuarioLogin(HttpServletRequest request) {
		Usuario usuario = new Usuario();
		HttpSession session = request.getSession();
		if(session != null) {
			Usuario logued = (Usuario)session.getAttribute("userLogued");
			usuario.setIdUsuario(logued.getIdUsuario());			
			return usuario;
		}
		else return null;
	}
	
	public static String userInitials(Usuario usuario) {
		return String.valueOf(usuario.getNombre().charAt(0)) + String.valueOf(usuario.getApellidos().charAt(0));
	}
	
}
