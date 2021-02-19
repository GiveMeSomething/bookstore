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
public class Category {

    private String categoryName;
    private String desc;

    public Category(String categoryName, String desc) {
        this.categoryName = categoryName;
        this.desc = desc;
    }

    public Category() {
    }

}
