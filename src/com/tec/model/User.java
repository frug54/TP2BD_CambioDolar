package com.tec.model;

public class User {
    int Id;
    String tipoUsuario;
    String contraseña;
    String estado;

    public User(int Id, String tipoUsuario, String contraseña, String estado) {
        this.Id = Id;
        this.tipoUsuario = tipoUsuario;
        this.contraseña = contraseña;
        this.estado = estado;
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

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "User{" + "Id=" + Id + ", tipoUsuario=" + tipoUsuario + ", contrase\u00f1a=" + contraseña + ", estado=" + estado + '}';
    }
       
}
