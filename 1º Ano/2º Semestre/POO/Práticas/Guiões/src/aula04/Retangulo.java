package aula04;


public class Retangulo extends FormaGeometrica {
    private double comprimento;
    private double altura;

    public Retangulo(double comprimento, double altura) {
        if (comprimento <= 0 || altura <= 0)
            throw new IllegalArgumentException("O comprimento e a altura devem ser positivos.");
        this.comprimento = comprimento;
        this.altura = altura;
    }

    public double getComprimento() {
        return comprimento;
    }

    public void setComprimento(double comprimento) {
        if (comprimento <= 0)
            throw new IllegalArgumentException("O comprimento deve ser positivo.");
        this.comprimento = comprimento;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        if (altura <= 0)
            throw new IllegalArgumentException("A altura deve ser positiva.");
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return comprimento * altura;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * (comprimento + altura);
    }

    @Override
    public String toString() {
        return "Retângulo [Comprimento=" + comprimento + ", Altura=" + altura + "]";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
        return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        Retangulo other = (Retangulo) obj;
        return Double.doubleToLongBits(comprimento) == Double.doubleToLongBits(other.comprimento)
                && Double.doubleToLongBits(altura) == Double.doubleToLongBits(other.altura);
    }
}  
