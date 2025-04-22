package ex1;

public class Pesadodemercadorias extends Pesado {
    
    private int cargaMaxima;

    public Pesadodemercadorias(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int peso, int cargaMaxima) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro, peso);
        this.cargaMaxima = cargaMaxima;
    }

    public int getCargaMaxima() {
        return cargaMaxima;
    }

    public void setCargaMaxima(int cargaMaxima) {
        this.cargaMaxima = cargaMaxima;
    }

    @Override
    public String toString() {
        return "Pesadodemercadorias{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", peso=" + getPeso() + ", cargaMaxima=" + cargaMaxima + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Pesadodemercadorias other = (Pesadodemercadorias) obj;
        return super.equals(obj) && this.getCargaMaxima() == other.getCargaMaxima();
    }
}
