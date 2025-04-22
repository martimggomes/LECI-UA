package aula04;

// Classe para representar um círculo
public class Circulo extends FormaGeometrica {
    private double raio;

    public Circulo(double raio) {
        if (raio <= 0)
            throw new IllegalArgumentException("O raio deve ser positivo.");
        this.raio = raio;
    }

    public double getRaio() {
        return raio;
    }

    public void setRaio(double raio) {
        if (raio <= 0)
            throw new IllegalArgumentException("O raio deve ser positivo.");
        this.raio = raio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * raio * raio;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * raio;
    }

    @Override
    public String toString() {
        return "Círculo [Raio=" + raio + "]";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        Circulo other = (Circulo) obj;
        return Double.doubleToLongBits(raio) == Double.doubleToLongBits(other.raio);
    }
}
