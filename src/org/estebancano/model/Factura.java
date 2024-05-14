/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.estebancano.model;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Esteban
 */
public class Factura {
    private int facturaId;
    private  Date fecha;
    private Time hora;
    private int ClienteId;
    private String cliente;
    private int EmpleadoId;
    private String empleado;
    private Double total;

    public Factura() {
    }

    public Factura(int facturaId, Date fecha, Time hora, String cliente, String empleado, Double total) {
        this.facturaId = facturaId;
        this.fecha = fecha;
        this.hora = hora;
        this.cliente = cliente;
        this.empleado = empleado;
        this.total = total;
    }

    public int getFacturaId() {
        return facturaId;
    }

    public void setFacturaId(int facturaId) {
        this.facturaId = facturaId;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    
    
    @Override
    public String toString() {
        return "Factura{" + "facturaId=" + facturaId + ", fecha=" + fecha + ", hora=" + hora + ", ClienteId=" + ClienteId + ", cliente=" + cliente + ", EmpleadoId=" + EmpleadoId + ", empleado=" + empleado + ", total=" + total + '}';
    }
}
