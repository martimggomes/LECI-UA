package treinoaula02;

import java.util.Scanner;

public class ex1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double km, miles; 
        System.out.print("Digite uma distância em quilómetros: ");
        km = sc.nextInt();
        miles = km / 1.609;
        System.out.println(km + " km são " + miles + " milhas.");
        sc.close();
    }
}
