package treinoaula02;

import java.util.Scanner;

public class ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite um tempo em segundos: ");
        int Tempo = sc.nextInt();

        int Horas = Tempo / 3600;
        int Min = (Tempo % 3600) / 60;
        int Seg = Tempo % 60;

        System.out.printf("%02d:%02d:%02d", Horas, Min, Seg);

        sc.close();

    }
}
