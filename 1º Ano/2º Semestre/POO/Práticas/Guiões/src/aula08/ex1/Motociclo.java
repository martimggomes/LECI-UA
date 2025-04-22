package ex1;

public class Motociclo extends Veiculo {
    
    private String tipo;

    public Motociclo(String matricula, String marca, String modelo, int celindrada, String tipo) {
        super(matricula, marca, modelo, celindrada);
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Motociclo{" + "matricula=" + getMatricula() + ", marca=" + getMarca() + ", modelo=" + getModelo() + ", potenciaCv=" + getCelindrada() + ", tipo=" + tipo + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Motociclo other = (Motociclo) obj;
        return super.equals(obj) && this.getTipo().equals(other.getTipo());
    }
}
