/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

public class Product {

    private int productID;
    private String productName;
    private int categoryID;
    private String categoryName;
    private String imageURL;
    private float price;
    private int stockQuantity;
    private String shortDescription;
    private String description;

    public Product() {
    }

    public Product(int productID, String productName, int categoryID, String categoryName, String imageURL, float price, int stockQuantity, String shortDescription, String description) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.imageURL = imageURL;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.shortDescription = shortDescription;
        this.description = description;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFormattedPrice() {
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(price);
    }

}
