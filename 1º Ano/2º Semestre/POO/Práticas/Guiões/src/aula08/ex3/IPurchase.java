package ex3;

public interface IPurchase {
    void addProduct(Product product, int amount);

    void listProducts();

    double getTotal();
}