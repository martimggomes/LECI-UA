package ex3;

public interface IProduct {
    String getName();

    double getPrice();

    void setPrice(double price);

    int stock();

    void addStock(int amount);

    void removeStock(int amount);
}