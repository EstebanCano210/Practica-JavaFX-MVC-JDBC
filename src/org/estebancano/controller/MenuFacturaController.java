/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.controller;

import java.net.URL;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
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
import javafx.scene.control.cell.PropertyValueFactory;
import org.estebancano.dao.Conexion;
import org.estebancano.model.Factura;
import org.estebancano.system.Main;


/**
 * FXML Controller class
 *
 * @author Esteban
 */
public class MenuFacturaController implements Initializable {
    private Main stage;
    
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL Location, ResourceBundle resources) {
        cargarDatos();
    }    
              
    @FXML
    TextField tfFacturaId;

    @FXML
    TableView tblFactura;

    @FXML
    TableColumn colFacturaId, colFecha, colHora, colCliente, colEmpleado, colTotal;

    @FXML
    Button btnExit, btnBuscar , btnAgregar , btnEditar , btnEliminar;        
    
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnExit){
            stage.menuPrincipalView();
        }else if(event.getSource() == btnEliminar){
            eliminarFactura(((Factura)tblFactura.getSelectionModel().getSelectedItem()).getFacturaId());
            cargarDatos();
        }else if(event.getSource() == btnBuscar){
            
        }
    }
    
    public void cargarDatos(){  
        tblFactura.setItems(listarFacturas()); 
        colFacturaId.setCellValueFactory(new PropertyValueFactory<Factura, Integer>("facturaId"));
        colFecha.setCellValueFactory(new PropertyValueFactory<Factura, Date>("fecha"));
        colHora.setCellValueFactory(new PropertyValueFactory<Factura, Time>("hora"));
        colCliente.setCellValueFactory(new PropertyValueFactory<Factura, String>("cliente"));
        colEmpleado.setCellValueFactory(new PropertyValueFactory<Factura, String>("empleado"));
        colTotal.setCellValueFactory(new PropertyValueFactory<Factura, Double>("total"));
    }
        
        
            
    
    
    public ObservableList<Factura> listarFacturas(){
        ArrayList<Factura> factura = new ArrayList<>();
        
        try {
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_ListarFactura()";
            statement = conexion.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                int facturaId = resultSet.getInt("facturaId");
                Date fecha = resultSet.getDate("fecha");
                Time hora = resultSet.getTime("hora");
                String cliente = resultSet.getString("cliente");
                String empleado = resultSet.getString("empleado");
                Double total = resultSet.getDouble("total");
            
                factura.add(new Factura(facturaId, fecha, hora, cliente, empleado, total));           
            }           
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            try {
                if(resultSet != null){
                    resultSet.close();
                }
                
                if (statement != null){
                    statement.close();
                }
                
                if(conexion != null){
                    conexion.close();
                }               
            }catch (SQLException e){
                e.printStackTrace();
            }  
        }
        return FXCollections.observableList(factura);
    }
    
    public void eliminarFactura(int facId){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "sp_EliminarFactura(?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, facId);
            statement.execute();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
    }
    
    public Factura buscarCliente(){
        Factura factura = null;
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_BuscarFactura(?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfFacturaId.getText()));
            resultSet = statement.executeQuery();
            
            if(resultSet.next()){
                int facturaId = resultSet.getInt("facturaId");
                Date fecha = resultSet.getDate("fecha");
                Time hora = resultSet.getTime("hora");
                String cliente = resultSet.getString("cliente");
                String empleado = resultSet.getString("empleado");
                Double total = resultSet.getDouble("total");
            
                factura = new Factura(facturaId, fecha, hora, cliente, empleado, total);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                if(resultSet != null){
                    resultSet.close();
                }
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
        return factura;
    }
    
    
    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }   
}
