package com.pit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pit.model.Especialidad;
import com.pit.model.Oferta;
import com.pit.service.OfertaService;
import com.pit.service.UsuarioService;

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
	
}
