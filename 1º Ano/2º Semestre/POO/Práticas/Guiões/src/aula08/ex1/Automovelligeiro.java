package ex1;

public class Automovelligeiro extends Automovel {

    private int capacidadeDaBagageira;

    public Automovelligeiro(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int capacidadeDaBagageira) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro);
        this.capacidadeDaBagageira = capacidadeDaBagageira;
    }

    public int getCapacidadeDaBagageira() {
        return capacidadeDaBagageira;
    }

    public void setCapacidadeDaBagageira(int capacidadeDaBagageira) {
        this.capacidadeDaBagageira = capacidadeDaBagageira;
    }

    @Override
    public String toString() {
        return "Automovelligeiro{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", capacidadeDaBagageira=" + capacidadeDaBagageira + '}';
    }   

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Automovelligeiro other = (Automovelligeiro) obj;
        return super.equals(obj) && this.getCapacidadeDaBagageira() == other.getCapacidadeDaBagageira();
    }
    
}
