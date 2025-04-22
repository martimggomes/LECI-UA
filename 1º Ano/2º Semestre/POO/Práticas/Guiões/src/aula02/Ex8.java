package aula02;

import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double CatA, CatB;

        do {
            System.out.print("Digite o valor do cateto A (positivo): ");
            CatA = sc.nextDouble();
            if (CatA <= 0) {
                System.out.println("Valor inválido. O cateto deve ser positivo.");
            }
        } while (CatA <= 0);

        do {
            System.out.print("Digite o valor do cateto B (positivo): ");
            CatB = sc.nextDouble();
            if (CatB <= 0) {
                System.out.println("Valor inválido. O cateto deve ser positivo.");
            }
        } while (CatB <= 0);

        
        double HipC = Math.sqrt((CatA)*(CatA) + (CatB)*(CatB));

        double AngGraus = Math.cos(CatA / HipC);

        System.out.println("O valor da hipotenusa é " + HipC + " e o valor do ângulo entre o lado A e a hipotenusa C é de " + AngGraus + " Graus");

        sc.close();

    }
}
