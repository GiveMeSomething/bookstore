/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Admin
 */
public class Book {

    private String bookName;
    private String brand;
    private double unitPrice;
    private int unitInStock;
    private int supplier;

    public Book() {
    }

    public Book(String bookName, String brand, double unitPrice, int unitInStock, int supplier) {
        this.bookName = bookName;
        this.brand = brand;
        this.unitPrice = unitPrice;
        this.unitInStock = unitInStock;
        this.supplier = supplier;
    }

}
