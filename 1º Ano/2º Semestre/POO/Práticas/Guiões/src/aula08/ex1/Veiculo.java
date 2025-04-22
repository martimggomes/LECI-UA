package ex1;

public class Veiculo implements KmPercorridosInterface{
    
    private String matricula;
    private String marca;
    private String modelo;
    private int celindrada;

    private int ultimoTrajeto = 0;
    private int distanciaTotal = 0;


    public Veiculo(String matricula, String marca, String modelo, int celindrada) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.celindrada = celindrada;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getMarca() {
        return marca;

    }

    public String getModelo() {
        return modelo;

    }
    public int getCelindrada() {
        return celindrada;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setCelindrada(int celindrada) {
        this.celindrada = celindrada;
    }

    public void trajeto(int quilometros) {
        System.out.println("O veículo " + this.getMatricula() + " percorreu " + quilometros + " quilômetros.");
        this.ultimoTrajeto = quilometros;
        this.distanciaTotal += quilometros;
    }

    public int ultimoTrajeto() {
        return this.ultimoTrajeto;
    }

    public int distanciaTotal() {
        return this.distanciaTotal;
    }

    @Override
    public String toString() {
        return "Veiculo{" + "matricula=" + matricula + ", marca=" + marca + ", modelo=" + modelo + ", celindrada=" + celindrada + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Veiculo other = (Veiculo) obj;
        return this.getMatricula().equals(other.getMatricula()) && this.getMarca().equals(other.getMarca()) && this.getModelo().equals(other.getModelo()) && this.getCelindrada() == other.getCelindrada();
    }
}
