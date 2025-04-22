package treinoaula02;

import java.util.Scanner;

public class ex3 {
    public static void main(String[] agrs) {
        double M, Ti, Tf, Q;
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual a quantidade de água: (em Kg) ");
        M = sc.nextDouble();
        System.out.print("Qual a temperatura inicial da água (em Graus Celsius): ");
        Ti = sc.nextDouble();
        System.out.print("Qual a temperatura inicial da água (em Graus Celsius): ");
        Tf = sc.nextDouble();
        Q = M * (Tf - Ti) * 4184;
        System.out.println("A energia necessária para aquecer a água desde uma temperatura inicial até uma temperatura final é de " + Q + " Joules");
        sc.close();
    }
}
