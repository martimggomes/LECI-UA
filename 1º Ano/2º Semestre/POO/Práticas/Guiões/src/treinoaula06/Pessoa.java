package treinoaula06;

import aula05.DateYMD;

public class Pessoa {
    private String nome;
    private int cc;
    private DateYMD dataNasc;

    public Pessoa(String nome, int cc, DateYMD dataNasc) {
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    public String getNome() {
        return nome;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + " | CC: " + cc + " | Data de Nascimento: " + dataNasc;
    }

    static class Aluno extends Pessoa {
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
            return super.toString() + " | NMec: " + nMec + " | Data de Inscrição: " + dataInsc;
        }
    }

    public static void main(String[] args) {
        DateYMD d1 = new DateYMD(5, 10, 1998);
        Pessoa p = new Pessoa("Ana Santos", 98012244, d1);
        System.out.println(p);
        DateYMD d2 = new DateYMD(29, 4, 2005);
        DateYMD d3 = new DateYMD(12, 12, 2003);
        Aluno a = new Aluno("Martim Gomes", 2332345, d3, d2);
        System.out.println(a);
    }
}
