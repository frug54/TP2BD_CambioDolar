package com.tec.controller.agente;

import com.tec.model.Participante;
import com.tec.model.User;
import com.tec.view.agente.ItemParticipantePanel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Calendar;
import java.util.Date;

public class ItemParticipanteController implements ActionListener{
    
    private ItemParticipantePanel itemParticipante;
    private User user;
    private Participante participante;

    public ItemParticipanteController(ItemParticipantePanel itemParticipante, User user) {
        this.itemParticipante = itemParticipante;
        this.user = user;
        itemParticipante = new ItemParticipantePanel();
        itemParticipante.addButton.addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String nombre = itemParticipante.nameTextField.getText();
        String cedula = itemParticipante.idTextField.getText();
        String telefono = itemParticipante.phoneTextField.getText();
        Date fecha = itemParticipante.calendar.getDate();
        
    }
    
    
    
}
