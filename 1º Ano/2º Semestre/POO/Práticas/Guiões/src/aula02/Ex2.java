package aula02;

import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        double Celsius, Fahrenheit;
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual a temperatura? (em Graus Celsius) ");
        Celsius = sc.nextDouble();
        Fahrenheit = 1.8 * Celsius + 32;
        System.out.println("A temperatura em Fahrenheit é de " + Fahrenheit + " F");
        sc.close(); 
    }
}
