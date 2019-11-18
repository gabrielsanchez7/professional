package com.pit.service;

import java.util.List;

import com.pit.model.Oferta;

public interface OfertaService {
	
	public int registrarOferta(Oferta oferta);
	public List<Oferta> listaOfertas(int idUsuario, int idOferta, int idEspecialidad, double menorPrecio, double mayorPrecio);

}
