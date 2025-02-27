/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author a
 */
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {

    private Map<Integer, CartItem> items;

    public ShoppingCart() {
        items = new HashMap<>();
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    // Add item to cart
    public void addItem(Product product, int quantity) {
        if (items.containsKey(product.getProductID())) {
            CartItem item = items.get(product.getProductID());
            int newQuantity = item.getQuantity() + quantity;
            if (newQuantity <= product.getStockQuantity()) {
                item.setQuantity(newQuantity);
            } else {
                item.setQuantity(product.getStockQuantity());
            }
        } else {
            items.put(product.getProductID(), new CartItem(product, quantity));
        }
    }

    // Update quantity
    public void updateQuantity(int productId, int quantity, int stockQuantity) {
        CartItem item = items.get(productId);
        if (item != null) {
            if (quantity <= stockQuantity) {
                item.setQuantity(quantity);
            } else {
                item.setQuantity(stockQuantity);
            }
        }
    }

    // Calculate total price
    public String getTotalPrice() {
        float total = 0;
        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(total);
    }
    
    public float getTotalAmount() {
        float total = 0;
        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }
        return total;
    }

    public void removeItem(int productID) {
        if (items.containsKey(productID)) {
            items.remove(productID);
        }
    }

    public int getItemCount() {
        int totalCount = 0;
        for (CartItem item : items.values()) {
            totalCount += item.getQuantity();
        }
        return totalCount;
    }

    
    
    // Check if cart is empty
    public boolean isEmpty() {
        return items.isEmpty();
    }
}
