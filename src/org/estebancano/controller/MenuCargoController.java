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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
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
public class MenuCargoController implements Initializable {
    private Main stage;
    private int op;
    
    private static Connection conexion;
    private static PreparedStatement statement;
    private static ResultSet resultSet;
      
    @FXML
    Button btnAgregar, btnEditar, btnEliminar, btnBuscar, btnRegresar;
    
    @FXML
    TextField tfBuscarCargo;
    
    @FXML
    TableView tblCargo;
    
    @FXML
    TableColumn colCargoNombre, colCargoDes, colCargoId;
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnRegresar){
            stage.menuPrincipalView();
        } else if(event.getSource()== btnAgregar){
            stage.formCargosView(1);
        } else if(event.getSource()== btnEditar){
            CargoDTO.getCargoDTO().setCargos((Cargo)tblCargo.getSelectionModel().getSelectedItem());
            stage.formCargosView(2);
            cargarDatos();
        }else if(event.getSource()== btnEliminar){
            if(SuperKinalAlert.getInstance().mostrarAlertaConfirmacion(10).get() == ButtonType.OK){
                eliminarCargos(((Cargo)tblCargo.getSelectionModel().getSelectedItem()).getCargoId());
                cargarDatos();
            }
        }else if(event.getSource() == btnBuscar){
            tblCargo.getItems().clear();
            if(tfBuscarCargo.getText().equals("")){
                cargarDatos();
            }else {
                op = 3;
                cargarDatos();
            }
        }
    }
    
    @Override
    public void initialize(URL url, ResourceBundle resources) {
        cargarDatos();
    }   
    
    public void cargarDatos(){
        if(op == 3){ 
            tblCargo.getItems().add(buscarCargo());
            op = 0;
        }else {
            tblCargo.setItems(listarCargos());
        }
        colCargoId.setCellValueFactory(new PropertyValueFactory<Cargo, Integer> ("cargoId"));
        colCargoNombre.setCellValueFactory(new PropertyValueFactory<Cargo, String> ("nombreCargo"));
        colCargoDes.setCellValueFactory(new PropertyValueFactory<Cargo, String> ("descripcionCargo"));
    }
    
    public ObservableList<Cargo> listarCargos(){
        ArrayList<Cargo> cargos = new ArrayList<>();
        
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_ListarCargos();";
            statement = conexion.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                int cargoId = resultSet.getInt("cargoId");
                String nombreCargo = resultSet.getString("nombreCargo");
                String descripcionCargo = resultSet.getString("descripcionCargo");
                
                cargos.add(new Cargo(cargoId, nombreCargo, descripcionCargo));
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(conexion != null){
                    conexion.close();
                }
                if(statement != null){
                    statement.close();
                }
                if(resultSet != null){
                    resultSet.close();
                }
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        
        return FXCollections.observableList(cargos);
    } 
    
    public void eliminarCargos(int cargId){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_EliminarCargo(?);";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, cargId);
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
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
    }
    
    public Cargo buscarCargo(){
        Cargo cargos = null;
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_BuscarCargo(?);";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfBuscarCargo.getText()));
            resultSet = statement.executeQuery();
            
            if(resultSet.next()){
                int cargoId = resultSet.getInt("cargoId");
                String nombreCargo = resultSet.getString("nombreCargo");
                String descripcionCargo = resultSet.getString("descripcionCargo");
                
                cargos = new Cargo(cargoId, nombreCargo, descripcionCargo);
            }
            
        }catch(SQLException e ){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(resultSet != null){
                    resultSet.close();
                }
                if(conexion != null){
                    conexion.close();
                }
                if(statement != null){
                    statement.close();
                }
            }catch (Exception e){
               System.out.println(e.getMessage()); 
            }
        }
        return cargos;
    }
    
    
    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
}