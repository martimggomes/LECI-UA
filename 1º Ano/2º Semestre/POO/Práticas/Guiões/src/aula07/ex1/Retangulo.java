package aula07.ex1;

public class Retangulo extends Forma {
    private double comprimento;
    private double altura;

    public Retangulo(String cor, double comprimento, double altura) {
        super(cor);
        this.comprimento = comprimento;
        this.altura = altura;
    }

    public double getComprimento() {
        return comprimento;
    }

    public void setComprimento(double comprimento) {
        this.comprimento = comprimento;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public double perimetro() {
        return comprimento * 2 + altura * 2;
    }

    public double area() {
        return altura * comprimento;
    }
}
