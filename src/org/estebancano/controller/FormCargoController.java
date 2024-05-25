/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.controller;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import org.estebancano.dao.Conexion;
import org.estebancano.dto.CargoDTO;
import org.estebancano.model.Cargo;
import org.estebancano.system.Main;
import org.estebancano.utils.SuperKinalAlert;

/**
 * FXML Controller class
 *
 * @author Esteban
 */
public class FormCargoController implements Initializable {
    private Main stage;
    private int op;
    
    private static Connection conexion;
    private static PreparedStatement statement;
  
    /**
     * Initializes the controller class.
     */  
    
    @FXML
    Button btnCancelarCargo, btnAceptar;
    
    @FXML
    TextField tfCargoId, tfCargoNombre;
    
    @FXML
    TextArea taCargoDes;
    
    @Override
    public void initialize(URL url, ResourceBundle resources) {
        if(CargoDTO.getCargoDTO().getCargos() != null){
        cargarDatos(CargoDTO.getCargoDTO().getCargos());
        }
    }  
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnCancelarCargo){
            stage.menuCargoView();
        }else if(event.getSource() == btnAceptar){
            if(op == 1){
                
                if(!tfCargoNombre.getText().equals("") && !taCargoDes.getText().equals("")){
                    agregarCargo();
                    SuperKinalAlert.getInstance().mostrarAlertaInformacion(10);
                    stage.menuCargoView();
                }else {
                    SuperKinalAlert.getInstance().mostrarAlertaInformacion(20);
                        if(tfCargoNombre.getText().equals("")) {
                            tfCargoNombre.requestFocus();
                        }else if(taCargoDes.getText().equals("")){
                            taCargoDes.requestFocus();
                        }
                    }
                }else if(op == 2){
                
                if(!tfCargoNombre.getText().equals("") && !taCargoDes.getText().equals("")){  

                    if(SuperKinalAlert.getInstance().mostrarAlertaConfirmacion(20).get() == ButtonType.OK){
                        editarCargo();
                        SuperKinalAlert.getInstance().mostrarAlertaInformacion(30);
                        CargoDTO.getCargoDTO().setCargos(null);
                        stage.menuCargoView();
                    }else{
                        stage.menuCargoView();
                    }
                 }else{
                    SuperKinalAlert.getInstance().mostrarAlertaInformacion(10);
                     if(tfCargoNombre.getText().equals("")) {
                        tfCargoNombre.requestFocus();
                     } else if(taCargoDes.getText().equals("")){
                        taCargoDes.requestFocus();
                    }
                }
            }
        }
    }
    
    public void cargarDatos(Cargo cargo){
        tfCargoId.setText(Integer.toString(cargo.getCargoId()));
        tfCargoNombre.setText(cargo.getNombreCargo());
        taCargoDes.setText(cargo.getDescripcionCargo());
    }
    
    
    public void agregarCargo(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_agregarCargo(?, ?);";
            statement = conexion.prepareStatement(sql);
            
            statement.setString(1, tfCargoNombre.getText());
            statement.setString(2, taCargoDes.getText());
            statement.execute();
            
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(conexion != null){
                    conexion.close();
                }
                if(statement != null){
                    statement.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    
    public void editarCargo(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_editarCargo(?, ? ,?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfCargoId.getText()));
            statement.setString(2, tfCargoNombre.getText());
            statement.setString(3, taCargoDes.getText());
            statement.execute();         
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(conexion != null){
                    conexion.close();
                }
                
                if(statement != null){
                    statement.close();
                }
                
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
        }
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    public void setOp(int op) {
        this.op = op;
    }   
}