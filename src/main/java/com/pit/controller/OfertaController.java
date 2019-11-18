package com.pit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pit.model.BResult;
import com.pit.model.Oferta;
import com.pit.model.Usuario;
import com.pit.service.OfertaService;
import com.pit.util.UtilWeb;

@RequestMapping(value="oferta")
@Controller
public class OfertaController {
	
	@Autowired
	private OfertaService ofertaService;
	
	@RequestMapping(value="/registrar", method=RequestMethod.POST)
	@ResponseBody
	public BResult registrarOferta(@RequestBody Oferta oferta, HttpServletRequest request) {
		BResult bResult = new BResult();
		HttpSession session = request.getSession();
		Usuario logued = (Usuario)session.getAttribute("userLogued");
		
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(logued.getIdUsuario());
		oferta.setUsuario(usuario);
		
		int register = ofertaService.registrarOferta(oferta);
		
		if(register > 0) {
			bResult.setCodigo(200);
			bResult.setMensaje("Oferta registrada");
			bResult.setResult(oferta);
		}
		
		return bResult;
	}
	
	@RequestMapping(value="/listar", method=RequestMethod.GET)
	@ResponseBody
	public BResult listaOfertas(@RequestParam(required=false, defaultValue="0") int idOferta, HttpServletRequest request) {
		BResult bResult = new BResult();
		Usuario logued = UtilWeb.usuarioLogin(request);
		
		try {
			List<Oferta> listaOfertas = ofertaService.listaOfertas(logued.getIdUsuario(), idOferta, 0, 0, 0);
			bResult.setCodigo(200);
			bResult.setResult(listaOfertas);
		} catch (Exception e) {
			e.printStackTrace();
			bResult.setCodigo(500);
			bResult.setMensaje("Hubo un error al obtener las ofertas");
		}
		
		return bResult;
	}

}
