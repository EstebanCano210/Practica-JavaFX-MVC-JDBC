/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.utils;

import java.util.Optional;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;

/**
 *
 * @author informatica
 */
public class SuperKinalAlert {
    private static SuperKinalAlert instance;
    private SuperKinalAlert(){
    }
    
    public static SuperKinalAlert getInstance(){
        if(instance == null){
            instance = new SuperKinalAlert();
        }
        return instance;
    }
    
    public void mostrarAlertaInformacion(int code){
        if(code == 10){ //Codigo 10 para agregar registros
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Confirmacion Registro");
            alert.setHeaderText("Confirmacion Registro");
            alert.setContentText("Registro Exitoso!");
            alert.showAndWait();
        }else if (code == 20){ //Codigo 20 para editar registros
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Edicion Registro");
            alert.setHeaderText("Edicion Registro");
            alert.setContentText("Edicion Realizada!");
            alert.showAndWait();
        }else if (code == 30){ //Codigo 30 para los campos pendientea
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Campos Pendientes");
            alert.setHeaderText("Campos Pendientes");
            alert.setContentText("Algunos campos necesarios para el registro estan vacios!");
            alert.showAndWait();
        }
    }
    
    public Optional <ButtonType> mostrarAlertaConfirmacion(int code){
        Optional<ButtonType> action = null;
        if(code == 100){
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("Eliminacion Registro");
            alert.setHeaderText("Eliminacion Registro");
            alert.setContentText("¿Desea confirmar la eliminacion del registro?");
            action = alert.showAndWait();
        }else if(code == 110){
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("Edicion Registro");
            alert.setHeaderText("Edicion Registro");
            alert.setContentText("¿Desea confirmar la edicion del registro?");
            action = alert.showAndWait();
        }       
        return action;        
    }
    
    public void alertaSaludo(String usuario){
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Bienvenido");
        alert.setHeaderText("Bienvenido " + usuario);
        alert.showAndWait();   
    }
}
