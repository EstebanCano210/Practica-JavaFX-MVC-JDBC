/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import org.estebancano.system.Main;

/**
 * FXML Controller class
 *
 * @author informatica
 */
public class MenuTicketSoporteController implements Initializable {
    Main stage;
    
    @FXML
    TextField tfClienteId;
    @FXML
    TextArea taDescripcion;
    @FXML
    ComboBox cmbEstatus, cmbCliente, cmbFactura;
    @FXML
    TableView tblTickets;
    @FXML
    TableColumn colTicketId, colDescripcion, colEstatus, colCliente, colFacturaId;
    @FXML
    Button btnGuardar,btnVaciar,btnRegresar;
    
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnRegresar){
            stage.menuPrincipalView();
        }
    }
    
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // TODO
    }    

    
    
    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    
}
