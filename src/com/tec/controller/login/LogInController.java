package com.tec.controller.login;

import com.tec.cambiodedolar.MainFrame;
import com.tec.model.UserModel;
import com.tec.view.LogIn.LogInView;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;

public class LogInController implements ActionListener {
    private static LogInController controllerLogIn;
    private MainFrame mainFrame;
    private LogInView logInView;
    
    public static LogInController getSingletonInstance () {
        if(controllerLogIn == null) {
            controllerLogIn = new LogInController();
        }
        return controllerLogIn;
    }

    LogInController() {
        mainFrame = new MainFrame();
        logInView = new LogInView();
        logInView.ingresarButton.addActionListener(this);
        logInView.generalButton.addActionListener(this);
    }
    
    public void initInterface() {
        mainFrame.setLayout(new BorderLayout());
        mainFrame.getContentPane().add(logInView);
        mainFrame.pack();
        mainFrame.setResizable(false);
        mainFrame.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (logInView.ingresarButton  == e.getSource()) {
            String password = logInView.passwordTextField.getText();
            String usernick = logInView.userTextField.getText();

            // Llamar metodo de base de datos
            UserModel user = null;

            if(user != null) {
                if (user.getTipoUsuario() == "Admin") {
                    System.out.println("Admin");
                } else if (user.getTipoUsuario() == "Agente") {
                    System.out.println("Agente");
                } else {
                    System.out.println("Paricipante");
                }
            } else {
                JOptionPane.showMessageDialog(null, "El usuario o contraseña no se encontraron en la base de datos", "Datos no encotrados", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            System.out.println("Public en general");
        }
    }  
}
