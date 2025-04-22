package aula09.ex3;

public class Plane {
    private String id;
    private String fabricante;
    private String modelo;
    private int anoProducao;
    private int numPassageiros;
    private int velocidadeMaxima;

    public Plane(String id, String fabricante, String modelo, int anoProducao, int numPassageiros, int velocidadeMaxima) {
        this.id = id;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.anoProducao = anoProducao;
        this.numPassageiros = numPassageiros;
        this.velocidadeMaxima = velocidadeMaxima;
    }

    public String getId() {
        return id;
    }

    public String getFabricante() {
        return fabricante;
    }

    public String getModelo() {
        return modelo;
    }

    public int getAnoProducao() {
        return anoProducao;
    }

    public int getNumPassageiros() {
        return numPassageiros;
    }

    public int getVelocidadeMaxima() {
        return velocidadeMaxima;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setAnoProducao(int anoProducao) {
        this.anoProducao = anoProducao;
    }

    public void setNumPassageiros(int numPassageiros) {
        this.numPassageiros = numPassageiros;
    }

    public void setVelocidadeMaxima(int velocidadeMaxima) {
        this.velocidadeMaxima = velocidadeMaxima;
    }

    @Override
    public String toString() {
        return "Plane{" +
                "id='" + id + '\'' +
                ", fabricante='" + fabricante + '\'' +
                ", modelo='" + modelo + '\'' +
                ", anoProducao=" + anoProducao +
                ", numPassageiros=" + numPassageiros +
                ", velocidadeMaxima=" + velocidadeMaxima +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        Plane p = (Plane) obj;
        return id.equals(p.id) && fabricante.equals(p.fabricante) && modelo.equals(p.modelo) && anoProducao == p.anoProducao && numPassageiros == p.numPassageiros && velocidadeMaxima == p.velocidadeMaxima;
    }

    @Override
    public int hashCode() {
        return id.hashCode() + fabricante.hashCode() + modelo.hashCode() + anoProducao + numPassageiros + velocidadeMaxima;
    }
}
