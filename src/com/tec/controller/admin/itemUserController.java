package com.tec.controller.admin;

import com.tec.model.User;
import com.tec.view.admin.ItemUsersPanel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class itemUserController implements ActionListener {
    private ItemUsersPanel itemUserPanel;
    private User user;

    public itemUserController(ItemUsersPanel itemUserPanel, User user) {
        this.itemUserPanel = itemUserPanel;
        this.user = user;
        this.itemUserPanel.createButton.setVisible(false);
        this.itemUserPanel.PasswordField.enable(false);
        this.itemUserPanel.nickUserTextField.setEditable(false);
        this.itemUserPanel.userComboBox.enable(false);
        this.itemUserPanel.disableButton.addActionListener(this);
        if (user.getEstado() != "Activo") {
            this.itemUserPanel.disableButton.setText("Deshabilidato");
            this.itemUserPanel.disableButton.setEnabled(false);
        }
    }

    public itemUserController(ItemUsersPanel itemUserPanel) {
        this.itemUserPanel = itemUserPanel;
    }

    public ItemUsersPanel getItemUserPanel() {
        return itemUserPanel;
    }

    public void setItemUserPanel(ItemUsersPanel itemUserPanel) {
        this.itemUserPanel = itemUserPanel;
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if(itemUserPanel.disableButton == e.getSource()) {
            this.itemUserPanel.disableButton.setText("Deshabilidato");
            this.itemUserPanel.disableButton.setEnabled(false);
            // Sp para cambiar el estado de un Usuario a dehabilitado
        } else {
            String rol = this.itemUserPanel.userComboBox.getSelectedItem().toString();
            String alias = this.itemUserPanel.nickUserTextField.getText();
            String password = this.itemUserPanel.PasswordField.getText();
                
            User user = null;
            user.setContraseña(password);
            user.setNick(alias);
            user.setTipoUsuario(rol);
            if (this.itemUserPanel.userComboBox.getSelectedItem().toString().equals("Participante")) {
                addUser(user);
            } else {
                
            }
            
        }
    }
    
    public void addUser(User user) {
    }
    
    
}
