/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Hai Duong
 */
public class Service {
    private int id;
    private Room room;
    private String name;
    private int serviceprice;
    private int elecno;
    private int elecunit;
    private int amount;
    private String note;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getServiceprice() {
        return serviceprice;
    }

    public void setServiceprice(int serviceprice) {
        this.serviceprice = serviceprice;
    }

    public int getElecno() {
        return elecno;
    }

    public void setElecno(int elecno) {
        this.elecno = elecno;
    }

    public int getElecunit() {
        return elecunit;
    }

    public void setElecunit(int elecunit) {
        this.elecunit = elecunit;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}
