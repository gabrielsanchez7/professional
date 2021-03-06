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
	public List<Oferta> listaOfertas(int idUsuario, int idOferta, int idEspecialidad, double menorPrecio, double mayorPrecio) {
		return ofertaDao.listaOfertas(idUsuario, idOferta, idEspecialidad, menorPrecio, mayorPrecio);
	}

	@Override
	public List<Object[]> listaHorariosOcupados(int idOferta, String fecha) {
		return ofertaDao.listaHorariosOcupados(idOferta, fecha);
	}

	@Override
	public String actualizarOferta(Oferta oferta) {
		return ofertaDao.actualizarOferta(oferta);
	}
	
}
