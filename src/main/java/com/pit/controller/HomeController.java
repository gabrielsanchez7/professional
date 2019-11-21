package com.pit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pit.model.BResult;
import com.pit.model.Especialidad;
import com.pit.model.Oferta;
import com.pit.model.Reserva;
import com.pit.model.Usuario;
import com.pit.service.OfertaService;
import com.pit.service.UsuarioService;
import com.pit.util.UtilWeb;

@Controller
public class HomeController {
	
	@Autowired
	private OfertaService ofertaService;
	
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value="home")
	public String home(Model model) {
		List<Oferta> listaOfertas = ofertaService.listaOfertas(0, 0, 0, 0, 0);
		List<Especialidad> listaEspecialidades = usuarioService.listaEspecialidades();
		
		model.addAttribute("ofertas", listaOfertas);
		model.addAttribute("especialidades", listaEspecialidades);
		return "home";
	}
	
	@RequestMapping(value="oferta/lista-ofertas")
	@ResponseBody
	public List<Oferta> listaOfertas (
			@RequestParam(defaultValue="0") int idUsuario,
			@RequestParam(defaultValue="0") int idOferta,
			@RequestParam(defaultValue="0") int idEspecialidad,
			@RequestParam(defaultValue="0") double menorPrecio,
			@RequestParam(defaultValue="0") double mayorPrecio) {
		List<Oferta> lista = ofertaService.listaOfertas(idUsuario, idOferta, idEspecialidad, menorPrecio, mayorPrecio);
		return lista;
	}
	
	@RequestMapping(value="oferta/{idOferta}")
	public String detalleOferta(@PathVariable int idOferta, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario)session.getAttribute("userLogued");
		Oferta oferta = ofertaService.listaOfertas(0, idOferta, 0, 0, 0).get(0);
		List<Reserva> listaReservas = usuarioService.listaReservas(usuario.getIdUsuario());
		model.addAttribute("oferta", oferta);
		model.addAttribute("initials", UtilWeb.userInitials(oferta.getUsuario()));
		model.addAttribute("reservas", listaReservas);
		return "detalle-oferta";
	}
	
	@RequestMapping(value="reservas")
	public String reservas(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario)session.getAttribute("userLogued");
		List<Reserva> listaReservas = usuarioService.listaReservas(usuario.getIdUsuario());
		model.addAttribute("reservas", listaReservas);
		return "reservas";
	}
	
	@RequestMapping(value="oferta/reserva", method=RequestMethod.POST)
	@ResponseBody
	public BResult autenticarUsuario(@RequestBody Reserva reserva, HttpServletRequest request) {
		BResult bResult = new BResult();
		HttpSession session = request.getSession();
		Usuario logued = (Usuario)session.getAttribute("userLogued");
		reserva.setUsuario(logued);
		
		try {
			int auth = usuarioService.registrarReserva(reserva);
			if(auth > 0) {
				bResult.setCodigo(200);
				bResult.setMensaje("Reserva realizada exitosamente");
			}
		} catch (Exception e) {
			e.printStackTrace();
			bResult.setCodigo(500);
			bResult.setMensaje("Hubo un error al registrar el usuario");
		}
		
		return bResult;
	}
	
}
