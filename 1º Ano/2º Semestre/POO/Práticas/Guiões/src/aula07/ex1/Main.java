package aula07.ex1;

public class Main {
    public static void main(String[] args) {
        Circulo c = new Circulo(5, "azul");
        Retangulo r = new Retangulo("preto", 3, 5);
        Triangulo t = new Triangulo(3, 5, 7, "verde");
        System.out.println("A área do círculo é " + c.area());
        System.out.println("A área do retângulo é " + r.area());
        System.out.println("A área do triângulo é " + t.area());
        System.out.println("O perímetro do círculo é " + c.perimetro());
        System.out.println("O perímetro do retângulo é " + r.perimetro());
        System.out.println("O perímetro do triângulo é " + t.perimetro());
    }
}
