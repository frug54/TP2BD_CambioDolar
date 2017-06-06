package com.tec.model;

public class UserModel {
    int Id;
    String tipoUsuario;

    public UserModel(int Id, String tipoUsuario) {
        this.Id = Id;
        this.tipoUsuario = tipoUsuario;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    
}
