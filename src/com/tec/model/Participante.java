package com.tec.model;

import java.util.Date;

public class Participante {
    private String cedula;
    private Date fecha;
    private String nombre;
    private String telefono;
    private String correo;

    public Participante(String cedula, Date fecha, String nombre, String telefono, String correo) {
        this.cedula = cedula;
        this.fecha = fecha;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
    }

    public Participante() {
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Override
    public String toString() {
        return "Participante{" + "cedula=" + cedula + ", fecha=" + fecha + ", nombre=" + nombre + ", telefono=" + telefono + ", correo=" + correo + '}';
    }
    
    
}
