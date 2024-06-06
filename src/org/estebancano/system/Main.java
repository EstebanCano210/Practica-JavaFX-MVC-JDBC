/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.system;

import java.io.InputStream;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.estebancano.controller.FormCargoController;
import org.estebancano.controller.FormClienteController;
import org.estebancano.controller.FormDistribuidorController;
import org.estebancano.controller.FormUsuarioController;
import org.estebancano.controller.LoginController;
import org.estebancano.controller.MenuCargoController;
import org.estebancano.controller.MenuClienteController;
import org.estebancano.controller.MenuDistribuidorController;
import org.estebancano.controller.MenuEmpleadosController;
import org.estebancano.controller.MenuPrincipalController;
import org.estebancano.controller.MenuTicketSoporteController;

/**
 *
 * @author Esteban
 */
public class Main extends Application {
    private final String URLVIEW = "/org/estebancano/view/";
    private Stage stage;
    private Scene scene;
    
            
    @Override
    public void start(Stage stage) throws Exception {
        this.stage = stage;
        stage.setTitle("Supermercado Kinal");
        LoginView();
        menuPrincipalView();
        stage.show();
    }

    public Initializable switchScene(String fxmlName, int width, int heigth) throws Exception{
        Initializable resultado = null;
        FXMLLoader loader = new FXMLLoader();
        
        InputStream file = Main.class.getResourceAsStream(URLVIEW + fxmlName);
        loader.setBuilderFactory(new JavaFXBuilderFactory());
        loader.setLocation(Main.class.getResource(URLVIEW + fxmlName));
        
        
        scene = new Scene((AnchorPane)loader.load(file), width, heigth);
        stage.setScene(scene);
        stage.sizeToScene();
        
        resultado = (Initializable)loader.getController();
        
        return resultado;
    }
    
    public void menuPrincipalView(){
        try{
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)switchScene("MenuPrincipalView.fxml",700 , 550 );
            menuPrincipalView.setStage(this);
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuClienteView(){
        try{
            MenuClienteController menuClienteView = (MenuClienteController)switchScene("MenuClienteView.fxml",1200 , 750 );
            menuClienteView.setStage(this);
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formClienteView(int op){
        try{
            FormClienteController formClienteView = (FormClienteController) switchScene ("FormClienteView.fxml", 500, 770);
            formClienteView.setOp(op);
            formClienteView.setStage(this);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuCargoView(){
        try {
            MenuCargoController menuCargoView = (MenuCargoController)switchScene("MenuCargoView.fxml", 1200 , 750);
            menuCargoView.setStage(this);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void formCargosView(int op){
        try{
            FormCargoController formCargoView = (FormCargoController) switchScene ("FormCargoView.fxml", 500, 770);
            formCargoView.setOp(op);
            formCargoView.setStage(this);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    
    public void menuTicketSoporteView(){
        try {
            MenuTicketSoporteController menuTicketSoporteView = (MenuTicketSoporteController)switchScene("MenuTicketSoporteView.fxml", 1200 , 750);
            menuTicketSoporteView.setStage(this);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
   public void menuDistribuidorView(){
        try {
            MenuDistribuidorController menuDistribuidorView = (MenuDistribuidorController)switchScene("MenuDistribuidorView.fxml", 1200 , 750);
            menuDistribuidorView.setStage(this);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
   public void formDistribuidorView(int op){
        try{
            FormDistribuidorController formDistribuidorView = (FormDistribuidorController) switchScene ("FormDistribuidorView.fxml", 500, 770);
            formDistribuidorView.setOp(op);
            formDistribuidorView.setStage(this);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    
   public void MenuEmpleados(int op){
       try{
            MenuEmpleadosController menuEmpleadosView = (MenuEmpleadosController)switchScene("MenuEmpleadosView.fxml",1200,750);
            menuEmpleadosView.setOp(op);
            menuEmpleadosView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        } 
    }
   
   public void LoginView(){
       try{
           LoginController loginView = (LoginController)switchScene("LoginView.fxml", 500, 650);
           loginView.setStage(this);           
       }catch(Exception e){
           System.out.println(e.getMessage());
       }
   }  
   
   public void formUsuarioView(){
        try{
            FormUsuarioController formUsuarioView = (FormUsuarioController)switchScene("FormUsuarioView.fxml" , 500, 650);
            formUsuarioView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
