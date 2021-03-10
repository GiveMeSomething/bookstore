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

    private int bookId;
    private String bookName;
    private String brand;
    private double unitPrice;
    private int unitInStock;
    private int supplier;

    public Book() {
    }

    public Book(String bookName, String brand, double unitPrice, int unitInStock, int supplier, int bookId) {
        this.bookName = bookName;
        this.brand = brand;
        this.unitPrice = unitPrice;
        this.unitInStock = unitInStock;
        this.supplier = supplier;
        this.bookId = bookId;
    }

    public int getBookId() {
        return bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public String getBrand() {
        return brand;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public int getSupplier() {
        return supplier;
    }
}
