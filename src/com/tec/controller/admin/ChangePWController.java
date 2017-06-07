package com.tec.controller.admin;

import com.tec.model.User;
import com.tec.view.admin.ChangePWPanel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;

public class ChangePWController implements ActionListener {
    private ChangePWPanel changePWPanel;
    private User user;

    public ChangePWController(User user) {
        changePWPanel = new ChangePWPanel();
        changePWPanel.changeButton.addActionListener(this);
        this.user = user;
    }

    public ChangePWPanel getChangePWPanel() {
        return changePWPanel;
    }

    public void setChangePWPanel(ChangePWPanel changePWPanel) {
        this.changePWPanel = changePWPanel;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String currentPassword = changePWPanel.currentPasswordField.getText();
        String newPassword = changePWPanel.newPasswordField.getText();
        String repetedPassword = changePWPanel.repeatPasswordField.getText();
        
        if(user.getContraseña() == currentPassword) {
            if (newPassword == repetedPassword) {
                // Llamar a la funcion que realiza el update
                System.out.println("Updated succees!!!");
            } else {
                JOptionPane.showMessageDialog(null, "La nueva contraseña ingresada no coincide con la repetida", "Contraseña invalida", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "La contraseña ingresada no coincide con la actual", "Contraseña invalida", JOptionPane.ERROR_MESSAGE);
        }
    }
    
}
