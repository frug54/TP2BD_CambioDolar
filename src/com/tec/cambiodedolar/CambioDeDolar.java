package com.tec.cambiodedolar;

import com.tec.controller.login.LogInController;

public class CambioDeDolar {

    public static void main(String[] args) {
        LogInController logInController = LogInController.getSingletonInstance();
        logInController.initInterface();
    }
    
}
