/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.dto;

import org.estebancano.model.Factura;

/**
 *
 * @author Esteban
 */
public class FacturaDTO {
    private static FacturaDTO instance;
    private Factura factura;
    
    private FacturaDTO(){
    
    }
    
    public static FacturaDTO getFacturaDTO(){
        if(instance == null){
            instance = new FacturaDTO();
        }
        return instance;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setCliente(Factura factura) {
        this.factura = factura;
    }
}
