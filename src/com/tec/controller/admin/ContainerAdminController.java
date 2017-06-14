package com.tec.controller.admin;

import com.tec.conection.AdminConection;
import com.tec.controller.login.LogInController;
import com.tec.model.User;
import com.tec.view.admin.ContainerAdminPanel;
import com.tec.view.admin.ItemUsersPanel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.JPanel;


public class ContainerAdminController implements ActionListener {
    private ContainerAdminPanel containerPanel;
    private User user;
    private LogInController controller;

    public ContainerAdminController(User user) {
        this.containerPanel = new ContainerAdminPanel();
        this.user = user;
        this.controller = LogInController.getSingletonInstance();
        this.containerPanel.changePWButton.addActionListener(this);
        this.containerPanel.usersListButton.addActionListener(this);
    }
    
    public void displayContainerAdmin() {
        controller.getMainFrame().getContentPane().removeAll();
        controller.getMainFrame().getContentPane().add(containerPanel);
        controller.getMainFrame().repaint();
        controller.getMainFrame().revalidate();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(this.containerPanel.changePWButton == e.getSource()) {
            System.out.println("Changge Password");
            ChangePWController changePWController = new ChangePWController(user);
            containerPanel.containerPanel.removeAll();
            JPanel options = changePWController.getChangePWPanel();
            containerPanel.containerPanel.add(options);
            controller.getMainFrame().repaint();
            controller.getMainFrame().revalidate();
        } else if(this.containerPanel.usersListButton == e.getSource()) {
            displayUsers();
        }
    }
    
    public void displayUsers() {
        containerPanel.containerPanel.removeAll();
        AdminConection adminConection = new AdminConection();
        ArrayList<User> users = adminConection.getUsers();
        
        ArrayList<JPanel> panelList = new ArrayList<JPanel>();
        for(int i = 0; users.size() > i; i++) {
            ItemUsersPanel itemUser = new ItemUsersPanel();
            itemUser.PasswordField.setText(users.get(i).getContraseña());
            itemUser.nickUserTextField.setText(users.get(i).getNick());
            itemUser.userComboBox.setSelectedItem(users.get(i).getTipoUsuario());
            
            itemUserController itemUserController = new itemUserController(itemUser, users.get(i)) {
                public void addUser(User user) {
                    displayAddUser(user);
                }
            };
            panelList.add(itemUserController.getItemUserPanel());
            System.out.println("Element inserted");
        }
        containerPanel.ShowItemList(panelList);
        controller.getMainFrame().repaint();
        controller.getMainFrame().revalidate();
    }
    
    public void displayAddUser(User user) {
        
    }
    
    
}
