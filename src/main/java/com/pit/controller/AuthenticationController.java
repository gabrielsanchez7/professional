package com.pit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pit.model.BResult;
import com.pit.model.Usuario;
import com.pit.service.UsuarioService;

@Controller
public class AuthenticationController {
	
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value="/")
	public String authentication() {
		return "authentication";
	}
	
	@RequestMapping(value="usuario/config")
	public String configAccount() {
		return "config-account";
	}
	
	@RequestMapping(value="usuario/registro", method=RequestMethod.POST)
	@ResponseBody
	public BResult autenticarUsuario(@RequestBody Usuario usuario) {
		BResult bResult = new BResult();
		
		try {
			String auth = usuarioService.registrarUsuario(usuario);
			if(auth.equals(usuario.getIdLogin())) {
				bResult.setCodigo(202);
				bResult.setMensaje("El usuario ya se encuentra registrado");
				bResult.setResult(usuario);
			}
			else {
				bResult.setCodigo(200);
				bResult.setMensaje("Registro correcto");
				bResult.setResult(usuario);
			}
		} catch (Exception e) {
			bResult.setCodigo(500);
			bResult.setMensaje("Hubo un error al registrar el usuario");
		}
		
		return bResult;
	}
	
	@RequestMapping(value="usuario/listar", method=RequestMethod.GET)
	@ResponseBody
	public List<Usuario> obtenerUsuarios(){
		List<Usuario> lista = usuarioService.obtenerUsuarios(2);
		return lista;
	}
	
	@RequestMapping(value="usuario/actualizar", method=RequestMethod.POST)
	@ResponseBody
	public BResult actualizarUsuario(@RequestBody Usuario usuario) {
		BResult bResult = new BResult();
		
		try {
			int update = usuarioService.actualizarUsuario(usuario);
			if(update == 1) {
				bResult.setMensaje("Usuario actualizado correctamente.");
				bResult.setCodigo(200);
				bResult.setResult(usuario);
			}
			else {
				bResult.setMensaje("No se ha podido actualizar el usuario.");
				bResult.setCodigo(404);
			}
		}
		catch (Exception e) {
			bResult.setCodigo(500);
			bResult.setMensaje("Hubo un error al registrar el usuario");
		}
		
		return bResult;
	}
	
	@RequestMapping(value="usuario/obtener", method=RequestMethod.GET)
	@ResponseBody
	public BResult obtenerUsuario(@RequestParam(name="idLogin") String idLogin) {
		BResult bResult = new BResult();
		bResult.setResult(usuarioService.obtenerUsuario(idLogin));
		return bResult;
	}
	
}
