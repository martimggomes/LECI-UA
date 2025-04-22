package aula04;

// Classe para representar um triângulo
public class Triangulo extends FormaGeometrica {
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo(double lado1, double lado2, double lado3) {
        if (lado1 <= 0 || lado2 <= 0 || lado3 <= 0)
            throw new IllegalArgumentException("Os lados devem ser positivos.");
        if (!verificarDesigualdadeTriangular(lado1, lado2, lado3))
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    private boolean verificarDesigualdadeTriangular(double a, double b, double c) {
        return a + b > c && a + c > b && b + c > a;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        if (lado1 <= 0)
            throw new IllegalArgumentException("O lado deve ser positivo.");
        if (!verificarDesigualdadeTriangular(lado1, lado2, lado3))
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        if (lado2 <= 0)
            throw new IllegalArgumentException("O lado deve ser positivo.");
        if (!verificarDesigualdadeTriangular(lado1, lado2, lado3))
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        if (lado3 <= 0)
            throw new IllegalArgumentException("O lado deve ser positivo.");
        if (!verificarDesigualdadeTriangular(lado1, lado2, lado3))
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        this.lado3 = lado3;
    }

    @Override
    public double calcularArea() {
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }

    @Override
    public double calcularPerimetro() {
        return lado1 + lado2 + lado3;
    }

    @Override
    public String toString() {
        return "Triângulo [Lado1=" + lado1 + ", Lado2=" + lado2 + ", Lado3=" + lado3 + "]";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        Triangulo other = (Triangulo) obj;
        return Double.doubleToLongBits(lado1) == Double.doubleToLongBits(other.lado1)
                && Double.doubleToLongBits(lado2) == Double.doubleToLongBits(other.lado2)
                && Double.doubleToLongBits(lado3) == Double.doubleToLongBits(other.lado3);
    }
}
