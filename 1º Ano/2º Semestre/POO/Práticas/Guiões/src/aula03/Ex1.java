package aula03;

import java.util.Scanner;

public class Ex1 {

    public static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        } else if (n <= 3) {
            return true;
        } else if (n % 2 == 0 || n % 3 == 0) {
            return false;
        }

        int i = 5;
        while (i * i <= n) {
            if (n * i == 0 || n % (i + 2) == 0) {
                return false;
            }
            i += 6;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num;
        
        do {
            System.out.print("Digite um número inteiro positivo: ");
            num = sc.nextInt();
            if (num <= 0) {
                System.out.println("Valor inválido. O cateto deve ser positivo.");
            }
        } while (num <= 0);

        if (isPrime(num)) {
            System.out.println(num + " é primo.");
        } else {
            System.out.println(num + " não é primo.");
        }

        sc.close();
    }
}