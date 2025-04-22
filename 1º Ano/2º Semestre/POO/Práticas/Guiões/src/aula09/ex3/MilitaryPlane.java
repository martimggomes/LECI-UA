package aula09.ex3;

public class MilitaryPlane extends Plane {
    
    private int numMunicoes;

    public MilitaryPlane(String id, String fabricante, String modelo, int anoProducao, int numPassageiros, int velocidadeMaxima, int numMunicoes) {
        super(id, fabricante, modelo, anoProducao, numPassageiros, velocidadeMaxima);
        this.numMunicoes = numMunicoes;
    }

    public int getNumMunicoes() {
        return numMunicoes;
    }

    public void setNumMunicoes(int numMunicoes) {
        this.numMunicoes = numMunicoes;
    }

    public String getPlaneType() {
        return "Militar";
    }

    @Override
    public String toString() {
        return super.toString() + " | Munições: " + numMunicoes;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        MilitaryPlane mp = (MilitaryPlane) obj;
        return super.equals(mp) && numMunicoes == mp.numMunicoes;
    }

    @Override
    public int hashCode() {
        return super.hashCode() + numMunicoes;
    }


}
