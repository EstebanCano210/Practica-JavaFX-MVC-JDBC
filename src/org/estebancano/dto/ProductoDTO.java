/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.dto;

import org.estebancano.model.Producto;

/**
 *
 * @author Esteban
 */
public class ProductoDTO {
    private static ProductoDTO instance;
    private Producto producto;

    public ProductoDTO() {
    }
    
    public static ProductoDTO getProductoDTO(){
        if(instance == null){
            instance = new ProductoDTO();
        }
        return instance;
    }

    public Producto getCargo() {
        return producto;
    }

    public void setCargo(Producto producto) {
        this.producto = producto;
    }
}
