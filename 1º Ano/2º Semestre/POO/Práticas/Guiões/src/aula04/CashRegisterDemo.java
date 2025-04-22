package aula04;

import java.util.ArrayList;
import java.util.List;

class Product {
  private String name;
  private double price;
  private int quantity;

  public Product(String name, double price, int quantity) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
  }

  public double getTotalValue() {
    return price * quantity;
  }

  public String getName() {
    return name;
  }

  public double getPrice() {
    return price;
  }

  public int getQuantity() {
    return quantity;
  }
}

class CashRegister {
  private List<Product> products; 

  public CashRegister() {
    this.products = new ArrayList<>();
  }

  public void addProduct(Product product) {
    products.add(product); 
  }

  public double getTotalCost() {
    double total = 0;
    for (Product product : products) {
      total += product.getTotalValue();
    }
    return total;
  }

  @Override
  public String toString() {
      StringBuilder sb = new StringBuilder();
      sb.append(String.format("%-15s", "Product"))
          .append(String.format("%-10s", "Price"))
          .append(String.format("%-10s", "Quantity"))
          .append(String.format("%-15s", "Total"))
          .append("\n");
      for (Product product : products) {
          sb.append(String.format("%-15s", product.getName()))
              .append(String.format("%-10.2f", product.getPrice()).replace(",", "."))
              .append(String.format("%-10d", product.getQuantity()))
              .append(String.format("%-15.2f", product.getTotalValue()).replace(",", "."))
              .append("\n");
      }
      return sb.toString();
  }
  
  
}

public class CashRegisterDemo {

  public static void main(String[] args) {

    CashRegister cr = new CashRegister();
    cr.addProduct(new Product("Book", 9.99, 3)); 
    cr.addProduct(new Product("Pen", 1.99, 10));
    cr.addProduct(new Product("Headphones", 29.99, 2));
    cr.addProduct(new Product("Notebook", 19.99, 5));
    cr.addProduct(new Product("Phone Case", 5.99, 1));

    System.out.println(cr);

    System.out.println("Total value: " + cr.getTotalCost());
  }
}
