package aula02;

import java.util.Scanner;

public class Ex7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite a abcissa do ponto p1: ");
        double x1 = sc.nextDouble();
        System.out.print("Digite a ordenada do ponto p1: ");
        double y1 = sc.nextDouble();
        System.out.print("Digite a abcissa do ponto p2: ");
        double x2 = sc.nextDouble();
        System.out.print("Digite a ordenada do ponto p2: ");
        double y2 = sc.nextDouble();

        double DistanciaEntrePontos = Math.sqrt(((x2 - x1)*(x2 - x1)) + ((y2 - y1)*(y2 - y1)));

        System.out.println("A distância entre os dois pontos é de " + DistanciaEntrePontos);

        sc.close();

    }
}
