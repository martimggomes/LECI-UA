package treinoaula02;

import java.util.Scanner;

public class ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double CatA, CatB;

        do {
            System.out.print("Valor do cateto A: ");
            CatA = sc.nextDouble();
            if (CatA <= 0) {
                System.out.println("Digite um valor válido!");
            }
        } while (CatA <= 0);

        do {
            System.out.print("Valor do cateto B: ");
            CatB = sc.nextDouble();
            if (CatB <= 0) {
                System.out.println("Digite um valor válido!");
            }
        } while (CatB <= 0);

        double HipC = Math.sqrt((CatA)*(CatA) + (CatB)*(CatB));

        double AngGraus = Math.cos(CatA / HipC);

        System.out.println("O valor da hipotesnusa é " + HipC + " e o valor do ângulo em graus é de " + AngGraus + "ºC");

        sc.close();
    }
}
