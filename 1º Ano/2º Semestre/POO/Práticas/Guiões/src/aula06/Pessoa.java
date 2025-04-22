package aula06;

import aula05.DateYMD;

class Pessoa {
    private String nome;
    private int cc;
    private DateYMD dataNasc;

    public Pessoa(String nome, int cc, DateYMD dataNasc) {
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    public String getName() {
        return nome;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + "; CC: " + cc + "; Data de Nascimento: " + dataNasc;
    }
}

class Aluno extends Pessoa {
    private static int proximoNMec = 100;
    private int nMec;
    private DateYMD dataInsc;

    public Aluno(String nome, int cc, DateYMD dataNasc, DateYMD dataInsc) {
        super(nome, cc, dataNasc);
        this.nMec = proximoNMec++;
        this.dataInsc = dataInsc;
    }

    public Aluno(String nome, int cc, DateYMD dataNasc) {
        this(nome, cc, dataNasc, new DateYMD(2024, 1, 1)); 
    }

    public int getNMec() {
        return nMec;
    }

    @Override
    public String toString() {
        return super.toString() + "; NMec: " + nMec + "; Data de Inscrição: " + dataInsc;
    }
}

class Professor extends Pessoa {
    private String categoria;
    private String departamento;

    public Professor(String nome, int cc, DateYMD dataNasc, String categoria, String departamento) {
        super(nome, cc, dataNasc);
        this.categoria = categoria;
        this.departamento = departamento;
    }

    @Override
    public String toString() {
        return super.toString() + "; Categoria: " + categoria + "; Departamento: " + departamento;
    }
}

class Bolseiro extends Aluno {
    private Professor orientador;
    private double bolsa;

    public Bolseiro(String nome, int cc, DateYMD dataNasc, Professor orientador, double bolsa) {
        super(nome, cc, dataNasc);
        this.orientador = orientador;
        this.bolsa = bolsa;
    }

    public void setBolsa(double bolsa) {
        this.bolsa = bolsa;
    }

    public double getBolsa() {
        return bolsa;
    }

    public Professor getOrientador() {
        return orientador;
    }

    @Override
    public String toString() {
        return super.toString() + "; Orientador: " + orientador.getName() + "; Bolsa: " + bolsa;
    }

    public static void main(String[] args) {
        Aluno al = new Aluno("Andreia Melo", 9855678, new DateYMD(1990, 7, 18), new DateYMD(2018, 9, 1));

        Professor p1 = new Professor("Jorge Almeida", 3467225, new DateYMD(1967, 3, 13),
                "Associado", "Informática");
        Bolseiro bls = new Bolseiro("Igor Santos", 8976543, new DateYMD(1985, 5, 11), p1,
                900);
        bls.setBolsa(1050);
        System.out.println("Aluno: " + al.getName());
        System.out.println(al);

        System.out.println("Bolseiro: " + bls.getName() + ", NMec: "
                + bls.getNMec() + ", Bolsa: " + bls.getBolsa() + ", Orientador: " +
                bls.getOrientador().getName());
        System.out.println(bls);
    }
}
