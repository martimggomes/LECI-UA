package ex1;

public class Automovel extends Veiculo {

    private int numeroDoQuadro;

    public Automovel(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro) {
        super(matricula, marca, modelo, celindrada);
        this.numeroDoQuadro = numeroDoQuadro;
    }
    
    public int getNumeroDoQuadro() {
        return numeroDoQuadro;
    }

    public void setNumeroquadro(int numeroDoQuadro) {
        this.numeroDoQuadro = numeroDoQuadro;
    }

    @Override
    public String toString() {
        return "Automovel{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + numeroDoQuadro + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Automovel other = (Automovel) obj;
        return super.equals(obj) && this.getNumeroDoQuadro() == other.getNumeroDoQuadro();
        
    }

}
