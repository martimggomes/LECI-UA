package ex1;

public class Taxi extends Automovelligeiro {
    
    private int numLicenca;

    public Taxi(String matricula, String marca, String modelo, int celindrada, int numeroDoQuadro, int capacidadeDaBagageira, int numLicenca) {
        super(matricula, marca, modelo, celindrada, numeroDoQuadro, capacidadeDaBagageira);
        this.numLicenca = numLicenca;
    }

    public int getNumLicenca() {
        return numLicenca;
    }

    public void setNumLicenca(int numLicenca) {
        this.numLicenca = numLicenca;
    }

    @Override
    public String toString() {
        return "Taxi{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", numeroDoQuadro=" + getNumeroDoQuadro() + ", capacidadeDaBagageira=" + getCapacidadeDaBagageira() + ", numLicenca=" + numLicenca + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Taxi other = (Taxi) obj;
        return super.equals(obj) && this.getNumLicenca() == other.getNumLicenca();
    }
}
