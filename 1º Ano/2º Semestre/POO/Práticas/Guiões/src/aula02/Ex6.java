package aula02;

import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite um tempo em segundos: ");
        int TempoTotal = sc.nextInt();

        int Horas = TempoTotal / 3600;
        int Min = (TempoTotal % 3600) / 60;
        int Seg = TempoTotal % 60;

        System.out.printf("%02d:%02d:%02d", Horas, Min, Seg);
  
        sc.close();
    }
}
