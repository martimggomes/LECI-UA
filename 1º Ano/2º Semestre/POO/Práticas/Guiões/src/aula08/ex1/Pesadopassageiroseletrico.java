package ex1;

public class Pesadopassageiroseletrico extends Pesadodepassageiros implements VeiculoEletrico {
    
    private int autonomia;
    private int percentagem = 100;

    public Pesadopassageiroseletrico(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int peso, int numMaxPassageiros, int autonomia, int percentagem) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro, peso, numMaxPassageiros);
        this.autonomia = autonomia;
        this.percentagem = percentagem;
    }

    public int autonomia() {
        return this.autonomia;
    }

    public void carregar(int percentagem) {
        this.percentagem += percentagem;
        if (this.percentagem > 100) this.percentagem = 100;
    }

    public int getPercentagem() {
        return this.percentagem;
    }

    @Override
    public String toString() {
        return "PesadoPassageirosEletrico{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", peso=" + getPeso() + ", nMaxPassageiros=" + getNumMaxPassageiros() + ", autonomia=" + autonomia + ", carga=" + percentagem + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Pesadopassageiroseletrico other = (Pesadopassageiroseletrico) obj;
        return super.equals(obj) && this.getPercentagem() == other.getPercentagem() && this.autonomia() == other.autonomia();
    }
    
}

