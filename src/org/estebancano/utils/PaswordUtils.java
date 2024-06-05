/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author informatica
 */
public class PaswordUtils {
    private static PaswordUtils instance;

    public PaswordUtils() {
    }

    public static PaswordUtils getInstance() {
        if(instance == null){
            instance = new PaswordUtils();
        }
        return instance;
    }
    
    public String encryptedPassword(String password){
        return BCrypt.hashpw(password,BCrypt.gensalt());
    }
    
    public boolean checkPassword(String pass,String encryptedPass){
        return BCrypt.checkpw(pass, encryptedPass);   
    }
}
