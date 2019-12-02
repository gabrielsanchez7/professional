package com.pit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pit.model.BResult;
import com.pit.model.Especialidad;
import com.pit.model.Oferta;
import com.pit.model.Reserva;
import com.pit.model.Ubigeo;
import com.pit.model.Usuario;
import com.pit.service.OfertaService;
import com.pit.service.UsuarioService;

@Controller
public class AuthenticationController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private OfertaService ofertaService;

	@RequestMapping(value="/")
	public String authentication() {
		return "authentication";
	}
	
	@RequestMapping(value="usuario/config")
	public String configAccount(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Usuario logued = (Usuario)session.getAttribute("userLogued");
		if(logued != null) {
			List<Especialidad> listaEspecialidades = usuarioService.listaEspecialidades();
			List<Oferta> listaOfertas = ofertaService.listaOfertas(logued.getIdUsuario(), 0, 0, 0, 0);
			List<Ubigeo> listaUbigeo = usuarioService.listaUbigeo(null, null, null);
			List<Reserva> listaReservas = usuarioService.listaReservas(logued.getIdUsuario(), "profesional");
			
			model.addAttribute("logued", true);
			model.addAttribute("usuario", logued);
			model.addAttribute("especialidades", listaEspecialidades);
			model.addAttribute("ofertas", listaOfertas);
			model.addAttribute("ciudades", listaUbigeo);
			model.addAttribute("contratos", listaReservas);
		}
		else {
			return "redirect:/";
		}
		return "config-account";
		
	}
	
	@RequestMapping(value="usuario/registro", method=RequestMethod.POST)
	@ResponseBody
	public BResult autenticarUsuario(@RequestBody Usuario usuario, HttpServletRequest request) {
		BResult bResult = new BResult();
		
		try {
			Ubigeo ubigeo = new Ubigeo();
			ubigeo.setIdUbigeo(0);
			usuario.setUbigeo(ubigeo);
			String auth = usuarioService.registrarUsuario(usuario);
			if(auth.equals(usuario.getIdLogin())) {
				usuario = usuarioService.obtenerUsuario(usuario.getIdLogin());
				HttpSession session = request.getSession();
				session.setAttribute("userLogued", usuario);
				
				bResult.setCodigo(202);
				bResult.setMensaje("El usuario ya se encuentra registrado");
				bResult.setResult(usuario);
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("userLogued", usuario);
				
				bResult.setCodigo(200);
				bResult.setMensaje("Registro correcto");
				bResult.setResult(usuario);
			}
		} catch (Exception e) {
			e.printStackTrace();
			bResult.setCodigo(500);
			bResult.setMensaje("Hubo un error al registrar el usuario");
		}
		
		return bResult;
	}
	
	@RequestMapping(value="usuario/actualizar", method=RequestMethod.POST)
	@ResponseBody
	public BResult actualizarUsuario(@RequestBody Usuario usuario, HttpServletRequest request) {
		BResult bResult = new BResult();
		
		try {
			String update = usuarioService.actualizarUsuario(usuario);
			Usuario updated = usuarioService.obtenerUsuario(usuario.getIdLogin());
			if(update.equals("success")) {
				bResult.setMensaje("Usuario actualizado correctamente.");
				bResult.setCodigo(200);
				bResult.setResult(updated);
				
				HttpSession session = request.getSession();
				session.setAttribute("userLogued", updated);
			}
			else {
				bResult.setMensaje("No se ha podido actualizar el usuario.");
				bResult.setCodigo(404);
				bResult.setResult(updated);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
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
	
	@RequestMapping(value="usuario/ubigeo", method=RequestMethod.GET)
	@ResponseBody
	public BResult obtenerUbigeo(@RequestParam(required=false) String ciudad, @RequestParam(required=false) String provincia, @RequestParam(required=false) String distrito) {
		BResult bResult = new BResult();
		bResult.setResult(usuarioService.listaUbigeo(ciudad, provincia, distrito));
		return bResult;
	}
	
	@RequestMapping(value="usuario/cerrar-sesion", method=RequestMethod.GET)
	public String cerrarSesion(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userLogued");
		return "redirect:/";
	}
	
	@RequestMapping(value="usuario/login", method=RequestMethod.GET)
	@ResponseBody
	public BResult loginUsuario(@RequestParam String email, @RequestParam String contrasena, HttpServletRequest request) {
		BResult bResult = new BResult();
		Usuario usuario = usuarioService.loginUsuario(email, contrasena);
		
		HttpSession session = request.getSession();
		session.setAttribute("userLogued", usuario);
		bResult.setResult(usuario);
		return bResult;
	}
	
	@RequestMapping(value="reserva/atender", method=RequestMethod.GET)
	@ResponseBody
	public BResult atenderReserva(@RequestParam String idReserva) {
		BResult bResult = new BResult();
		
		try {
			String update = usuarioService.atenderReserva(Integer.parseInt(idReserva));
			if(update.equals("success")) {
				bResult.setMensaje("Reserva atendida correctamente.");
				bResult.setCodigo(200);
			}
			else {
				bResult.setMensaje("No se ha podido atender la reserva.");
				bResult.setCodigo(404);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			bResult.setCodigo(500);
			bResult.setMensaje("Hubo un error al atender la reserva");
		}
		
		return bResult;
	}
	
}
