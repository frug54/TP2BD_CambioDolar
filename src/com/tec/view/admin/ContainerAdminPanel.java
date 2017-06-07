package com.tec.view.admin;

import java.awt.BorderLayout;
import java.util.List;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import com.tec.render.PanelCellEditorRenderer;
import com.tec.render.PanelTableModel;

public class ContainerAdminPanel extends javax.swing.JPanel {

    private JTable CompTable = null;
    private PanelTableModel CompModel = null;
    
    public ContainerAdminPanel() {
        initComponents();
    }
    
    public void ShowItemList(List<JPanel> paneList) {
        this.containerPanel.removeAll();
        CompModel = new PanelTableModel();
        
        for (int i = 0; i < paneList.size(); i++) {
            CompModel.addRow(paneList.get(i));
        }
        
        JTable table = new JTable(CompModel);
        table.setColumnSelectionAllowed(false);
        table.setRowHeight(paneList.get(0).getPreferredSize().height);
        table.setTableHeader(null);
        PanelCellEditorRenderer PanelCellEditorRenderer = new PanelCellEditorRenderer();
        table.setDefaultRenderer(Object.class, PanelCellEditorRenderer);
        table.setDefaultEditor(Object.class, PanelCellEditorRenderer);
        
        CompTable = table;
        
        JScrollPane CompTableScrollpane = new JScrollPane(CompTable);

        this.containerPanel.add(CompTableScrollpane, BorderLayout.CENTER);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        restaurantPanel = new javax.swing.JPanel();
        optionsLabel = new javax.swing.JLabel();
        changePWButton = new javax.swing.JButton();
        containerPanel = new javax.swing.JPanel();

        setBackground(new java.awt.Color(204, 204, 204));

        restaurantPanel.setBackground(new java.awt.Color(204, 204, 204));
        restaurantPanel.setPreferredSize(new java.awt.Dimension(880, 500));

        optionsLabel.setBackground(new java.awt.Color(153, 107, 66));
        optionsLabel.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        optionsLabel.setForeground(new java.awt.Color(255, 255, 255));
        optionsLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        optionsLabel.setText("Opciones");

        changePWButton.setBackground(new java.awt.Color(153, 107, 66));
        changePWButton.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        changePWButton.setForeground(new java.awt.Color(255, 255, 255));
        changePWButton.setText("Cambiar Contraseña");

        javax.swing.GroupLayout restaurantPanelLayout = new javax.swing.GroupLayout(restaurantPanel);
        restaurantPanel.setLayout(restaurantPanelLayout);
        restaurantPanelLayout.setHorizontalGroup(
            restaurantPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(restaurantPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(optionsLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 181, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, restaurantPanelLayout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(changePWButton))
        );
        restaurantPanelLayout.setVerticalGroup(
            restaurantPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(restaurantPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(optionsLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(111, 111, 111)
                .addComponent(changePWButton)
                .addContainerGap(317, Short.MAX_VALUE))
        );

        containerPanel.setBackground(new java.awt.Color(204, 204, 204));
        containerPanel.setLayout(new java.awt.GridLayout(1, 0));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(restaurantPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 201, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(containerPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 673, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(containerPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(restaurantPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(0, 0, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton changePWButton;
    public javax.swing.JPanel containerPanel;
    private javax.swing.JLabel optionsLabel;
    public javax.swing.JPanel restaurantPanel;
    // End of variables declaration//GEN-END:variables
}
