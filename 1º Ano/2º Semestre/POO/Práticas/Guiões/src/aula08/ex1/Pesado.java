package ex1;

public class Pesado extends Automovel {
    
    private int peso;

    public Pesado(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int peso) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro);
        this.peso = peso;
    }

    public int getPeso() {
        return peso;
    }
    
    public void setPeso(int peso) {
        this.peso = peso;
    }

    @Override
    public  String toString() {
        return "Pesado{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", peso=" + peso + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Pesado other = (Pesado) obj;
        return super.equals(obj) && this.getPeso() == other.getPeso();
    }
}
