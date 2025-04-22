package aula02;

import java.util.Scanner;

public class Ex9 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N;

        do {
            System.out.print("Digite um valor positivo N: ");
            N = sc.nextInt();
            if (N <= 0) {
                System.out.println("Valor inválido. O cateto deve ser positivo.");
            }
        } while (N <= 0);

        for (int i = N; i >= 0; i--) {
            System.out.print(i);
            if (i % 10 == 0 && i != 0) {
                System.out.println();
            } else if (i != 0) {
                System.out.print(", ");
            }
    }

        sc.close();
    }
    
}
