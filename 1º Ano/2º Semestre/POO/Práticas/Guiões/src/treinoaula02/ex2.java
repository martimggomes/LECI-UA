package treinoaula02;

import java.util.Scanner;

public class ex2 {
    public static void main(String[] args) {
        double Celsius, Fahrenheit;
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite uma temperatura em graus Celsius: ");
        Celsius = sc.nextInt();
        Fahrenheit = 1.8 * Celsius + 32;
        System.out.println(Celsius + "ºC são " + Fahrenheit + "F.");
        sc.close();

    }
}
