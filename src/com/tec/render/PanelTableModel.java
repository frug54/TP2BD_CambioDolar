package com.tec.render;

import javax.swing.JPanel;
import javax.swing.table.DefaultTableModel;

public class PanelTableModel extends DefaultTableModel {

    private static final long serialVersionUID = 1L;

    @Override
    public int getColumnCount() {
        return 1;
    }

    public void addRow(JPanel newPanel) {
        super.addRow(new Object[]{newPanel});
    }
}