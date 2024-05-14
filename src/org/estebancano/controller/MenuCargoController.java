/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.controller;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import org.estebancano.dao.Conexion;
import org.estebancano.model.Cargo;
import org.estebancano.system.Main;

/**
 * FXML Controller class
 *
 * @author informatica
 */
public class MenuCargoController implements Initializable {
    private Main stage;
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    /**
     * Initializes the controller class.
     */
    
    @FXML
    TextField tfCargoId;
    @FXML
    Button btnAgregar, btnEliminar, btnEditar,btnBuscar;   
    @FXML
    TableView tblCargo;
    @FXML
    TableColumn colCargoId, colCargo, colDescripcion;
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        
    }
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // TODO
    }

    public ObservableList<Cargo> listarCargo(){
        ArrayList<Cargo> cargos  = new ArrayList<>();
        
        try {
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_ListarCargos();";
            statement = conexion.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
              
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        
        }
                
        return FXCollections.observableList(cargos);
    }
    
    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
}
