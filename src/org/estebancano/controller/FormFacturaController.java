/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import org.estebancano.system.Main;

/**
 * FXML Controller class
 *
 * @author Esteban
 */
public class FormFacturaController implements Initializable {
    private Main stage;
    private int op;
    /**
     * Initializes the controller class.
     */
    
    @FXML
    TextField tfFacturaId, tfFecha, tfHora, tfCliente, tfEmpleado, tfTotal;
    @FXML
    Button btnCancel, btnSafe;
    
    
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

    public void setOp(int op) {
        this.op = op;
    }
}
