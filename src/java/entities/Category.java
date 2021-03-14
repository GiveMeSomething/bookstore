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

    private int categoryId;
    private String categoryName;
    private String desc;
    private boolean isChecked;

    public Category() {
    }

    public Category(int categoryId, String categoryName, String desc) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.desc = desc;

        this.isChecked = false;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getDesc() {
        return desc;
    }

    public boolean isIsChecked() {
        return isChecked;
    }

    public void setIsChecked(boolean isChecked) {
        this.isChecked = isChecked;
    }

}
