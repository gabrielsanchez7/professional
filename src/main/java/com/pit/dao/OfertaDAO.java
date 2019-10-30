package com.pit.dao;

import java.util.List;

import com.pit.model.Oferta;

public interface OfertaDAO {
	
	public int registrarOferta(Oferta oferta);
	public List<Oferta> listaOfertas(int idUsuario, int idOferta);

}
