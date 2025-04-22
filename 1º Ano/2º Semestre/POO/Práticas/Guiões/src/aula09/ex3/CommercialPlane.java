package aula09.ex3;

public class CommercialPlane extends Plane {
    
    private int numTripulantes;

    public CommercialPlane(String id, String fabricante, String modelo, int anoProducao, int numPassageiros, int velocidadeMaxima, int numTripulantes) {
        super(id, fabricante, modelo, anoProducao, numPassageiros, velocidadeMaxima);
        this.numTripulantes = numTripulantes;
    }

    public int getNumTripulantes() {
        return numTripulantes;
    }

    public void setNumTripulantes(int numTripulantes) {
        this.numTripulantes = numTripulantes;
    }

    public String getPlaneType() {
        return "Comercial";
    }

    @Override
    public String toString() {
        return super.toString() + " | Tripulantes: " + numTripulantes;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        CommercialPlane cp = (CommercialPlane) obj;
        return super.equals(cp) && numTripulantes == cp.numTripulantes;
    }

    @Override
    public int hashCode() {
        return super.hashCode() + numTripulantes;
    }


}
