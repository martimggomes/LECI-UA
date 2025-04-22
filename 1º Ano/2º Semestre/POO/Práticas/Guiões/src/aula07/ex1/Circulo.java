package aula07.ex1;

import java.lang.Math;

public class Circulo extends Forma{
    private double raio;

    public Circulo(double raio, String cor) {
        super(cor);
        this.raio = raio;
    }

    public double getRaio() {
        return raio;
    }

    public void setRaio(double raio) {
        this.raio = raio;
    }

    @Override //opcional
    public double perimetro() {
        return 2 * Math.PI * raio;
    }

    @Override //opcional
    public double area() {
        return Math.PI * raio * raio;
    }
}
