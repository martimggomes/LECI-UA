package ex3;

public class Shopping {
    public static void main(String[] args) {
        Product p1 = new Product("Camisolas", 15, 2);
        Product p2 = new Product("Calças", 52, 5);
        Product p3 = new ProductWithDiscount("Sapatilhas", 50,1, 50);
        Product p4 = new ProductWithDiscount("Casacos", 85, 1, 10);

        Purchase compra = new Purchase();
        compra.addProduct(p2, 2);
        compra.addProduct(p3, 2);
        compra.addProduct(p4, 3);
        compra.addProduct(p1, 1);

        compra.listProducts();
        System.out.printf("Preço total da compra %.2f\n", compra.getTotal());
    }
}