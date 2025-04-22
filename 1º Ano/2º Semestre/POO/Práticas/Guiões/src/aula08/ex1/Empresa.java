package ex1;

import java.util.ArrayList;

public class Empresa {
    
    private String nome;
    private String codigoPostal;
    private String email;

    private ArrayList<Veiculo> veiculos;

    public Empresa(String nome, String codigoPostal, String email) {
        this.nome = nome;
        this.codigoPostal = codigoPostal;
        this.email = email;
        this.veiculos = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public String getEmail() {
        return email;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<Veiculo> getVeiculos() {
        return veiculos;
    }

    public void addVeiculo(Veiculo veiculo) {
        this.veiculos.add(veiculo);
    }

    public void addVeiculos(Veiculo ... veiculos) {
        for (Veiculo veiculo : veiculos) {
            this.veiculos.add(veiculo);
        }
    }

    @Override
    public String toString() {
        return "Empresa{" + "nome=" + nome + ", codigoPostal=" + codigoPostal + ", email=" + email + ", veiculos=" + veiculos + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;

        final Empresa other = (Empresa) obj;
        return this.getNome().equals(other.getNome()) &&
            this.getCodigoPostal().equals(other.getCodigoPostal()) &&
            this.getEmail().equals(other.getEmail()) &&
            this.getVeiculos().equals(other.getVeiculos());
    }

}
