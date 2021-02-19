/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class Order {

    private String orderDate;
    private HashMap<Integer, Integer> books; // <K, V> = <BookId, Quantity>
    private float discount;

    public Order(String orderDate, HashMap<Integer, Integer> books, float discount) {
        this.orderDate = orderDate;
        this.books = books;
        this.discount = discount;
    }

    public Order() {
    }

}
