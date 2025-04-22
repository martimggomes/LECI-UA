package ex1;

public class Pesadodepassageiros extends Pesado {
    
    private int numMaxPassageiros;

    public Pesadodepassageiros(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int peso, int numMaxPassageiros) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro, peso);
        this.numMaxPassageiros = numMaxPassageiros;
    }

    public int getNumMaxPassageiros() {
        return numMaxPassageiros;
    }

    public void setNumMaxPassageiros(int numMaxPassageiros) {
        this.numMaxPassageiros = numMaxPassageiros;
    }

    @Override
    public String toString() {
        return "Pesadodepassageiros{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", peso=" + getPeso() + ", numMaxPassageiros=" + numMaxPassageiros + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Pesadodepassageiros other = (Pesadodepassageiros) obj;
        return super.equals(obj) && this.getNumMaxPassageiros() == other.getNumMaxPassageiros();
    }
}
