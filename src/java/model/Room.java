/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Hai Duong
 */
public class Room {
    private int rid;
    private int rtype;
    private int price;
    private ArrayList<Customer> customers;
    
    public Room(){
        customers = new ArrayList<>();
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getRtype() {
        return rtype;
    }

    public void setRtype(int rtype) {
        this.rtype = rtype;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public ArrayList<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(ArrayList<Customer> customers) {
        this.customers = customers;
    }
    
    
}
