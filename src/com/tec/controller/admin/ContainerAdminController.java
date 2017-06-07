package com.tec.controller.admin;

import com.tec.controller.login.LogInController;
import com.tec.model.User;
import com.tec.view.admin.ContainerAdminPanel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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
            ChangePWController changePWController = new ChangePWController(user);
            containerPanel.containerPanel.removeAll();
            JPanel options = changePWController.getChangePWPanel();
            containerPanel.containerPanel.add(options);
            controller.getMainFrame().repaint();
            controller.getMainFrame().revalidate();
        }
    }
    
    
    
    
}
