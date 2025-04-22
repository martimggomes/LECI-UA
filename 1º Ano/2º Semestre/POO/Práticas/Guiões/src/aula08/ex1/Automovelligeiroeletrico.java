package ex1;

public class Automovelligeiroeletrico extends Automovelligeiro implements VeiculoEletrico {
    
    private int autonomia;
    private int percentagem = 100;

    public Automovelligeiroeletrico(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int capacidadeDaBagageira, int autonomia, int percentagem) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro, capacidadeDaBagageira);
        this.autonomia = autonomia;
        this.percentagem = percentagem;
    }

    public int autonomia() {
        return autonomia;
    }

    public void carregar(int percentagem) {
        this.percentagem += percentagem;
        if (percentagem > 100) {
            this.percentagem = 100;
        }
    }

    public int gePercentagem() {
        return percentagem;
    }

    @Override
    public String toString() {
        return "Automovelligeiroeletrico{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", capacidadeDaBagageira=" + getCapacidadeDaBagageira() + ", autonomia=" + autonomia + ", percentagem=" + percentagem + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Automovelligeiroeletrico other = (Automovelligeiroeletrico) obj;
        return super.equals(obj) && this.autonomia == other.autonomia && this.percentagem == other.percentagem;
    }

}
