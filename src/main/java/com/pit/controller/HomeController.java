package com.pit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pit.model.Oferta;
import com.pit.service.OfertaService;

@Controller
public class HomeController {
	
	@Autowired
	private OfertaService ofertaService;

	@RequestMapping(value="home")
	public String home(Model model) {
		List<Oferta> listaOfertas = ofertaService.listaOfertas(0, 0);
		model.addAttribute("ofertas", listaOfertas);
		return "home";
	}
	
}
