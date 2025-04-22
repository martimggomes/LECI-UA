package treinoaula02;

import java.util.Scanner;

public class ex5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Velocidade 1: ");
        int v1 = sc.nextInt();
        System.out.print("Distância 1: ");
        double d1 = sc.nextDouble();
        System.out.print("Velocidade 2: ");
        int v2 = sc.nextInt();
        System.out.print("Distância 2: ");
        double d2 = sc.nextDouble();

        double Tempo = (d1/v1) + (d2/v2);

        double Vm = (d2 + d1) / Tempo;

        System.out.println("A velocidade média final é de " + Vm);
        sc.close();
    }
}
