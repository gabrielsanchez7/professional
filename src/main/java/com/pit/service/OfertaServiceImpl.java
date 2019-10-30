package com.pit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pit.dao.OfertaDAO;
import com.pit.model.Oferta;

@Service
public class OfertaServiceImpl implements OfertaService {
	
	@Autowired
	private OfertaDAO ofertaDao;

	@Override
	public int registrarOferta(Oferta oferta) {
		return ofertaDao.registrarOferta(oferta);
	}

	@Override
	public List<Oferta> listaOfertas(int idUsuario, int idOferta) {
		return ofertaDao.listaOfertas(idUsuario, idOferta);
	}
	
}
