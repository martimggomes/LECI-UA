package POO2021;

import java.util.Arrays;
import java.util.TreeSet;
import java.util.Collection;

public class PasseioBicicleta extends Atividade {
    private Collection<String> locais;

    public PasseioBicicleta(int identificador, String nome, String[] locais) {
        super(identificador, nome);
        this.locais = new TreeSet<String>(Arrays.asList(locais));
    }

    public PasseioBicicleta(int identificador, String nome) {
        super(identificador, nome);
        this.locais = new TreeSet<>();
    }

    @Override
    public Collection<String> locais() {
        return locais;
    }

    public Collection<String> getLocais() {
        return locais;
    }

    public void setLocais(Collection<String> locais) {
        this.locais = locais;
    }

    public void addLocal(String local) {
        this.locais.add(local);
    }
}
