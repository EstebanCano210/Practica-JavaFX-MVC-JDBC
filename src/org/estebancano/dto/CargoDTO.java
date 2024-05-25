/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.dto;

import org.estebancano.model.Cargo;

/**
 *
 * @author Esteban
 */
public class CargoDTO {    
    private static CargoDTO instance;

    private Cargo cargos;

    public Cargo getCargos() {
        return cargos;
    }

    public void setCargos(Cargo cargos) {
        this.cargos = cargos;
    }
   
    private CargoDTO (){
        
    }
    
    public static CargoDTO getCargoDTO(){
        if(instance == null){
            instance = new CargoDTO();
        }
        return instance;
    }
}

