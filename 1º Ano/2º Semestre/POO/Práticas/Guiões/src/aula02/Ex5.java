package aula02;

import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite a velocidade no primeiro trajeto: ");
        double v1 = sc.nextDouble();
        System.out.print("Digite a distância do primeiro trajeto: ");
        double d1 = sc.nextDouble();
        System.out.print("Digite a velocidade no segundo trajeto: ");
        double v2 = sc.nextDouble();
        System.out.print("Digite a distância do segundo trajeto: ");
        double d2 = sc.nextDouble();

        double TempoTotal = (d1 / v1) + (d2 / v2);

        double Vm = (d1 + d2) / TempoTotal;

        System.out.println("A velocidade média final é " + Vm);

        sc.close();
    }
}
