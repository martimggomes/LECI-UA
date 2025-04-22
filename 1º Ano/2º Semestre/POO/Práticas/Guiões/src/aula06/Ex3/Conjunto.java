package aula06.Ex3;

public class Conjunto {
    private int[] numeros;
    private int tamanho;

    public Conjunto() {
        this.numeros = new int[20];
        this.tamanho = 0;
    }

    public void insert(int numero) {
        if (this.contains(numero) == false) {
            numeros[tamanho] = numero;
            tamanho++;
        }
    } 

    public boolean contains(int numero) {
        for (int i = 0; i < tamanho; i++) {
            if (numeros[i] == numero) {
                return true;
            } 
        } 
        return false;
    }
}
