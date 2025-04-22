package aula010.ex3;

import java.util.HashMap;
import java.util.LinkedList;

public class ContaodorLetras {
    private final HashMap<Character, LinkedList<Integer>> posicao = new HashMap<>();
    private final String texto;

    public ContaodorLetras(String texto) {
        this.texto = texto;
    }

    public void posicao() {
        for (int i = 0; i < this.texto.length(); i++) {
            char l = this.texto.charAt(i);
                if (this.posicao.containsKey(l)) {
                    this.posicao.get(l).add(i);
                } else {
                    LinkedList<Integer> pos = new LinkedList<>();
                    pos.add(i);
                    this.posicao.put(l, pos);
                }
        }
    }


    public HashMap<Character, LinkedList<Integer>> getPosicao() {
        return this.posicao;
    }
}
