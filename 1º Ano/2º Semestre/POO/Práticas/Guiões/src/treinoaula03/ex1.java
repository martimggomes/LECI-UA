package treinoaula03;

import java.util.Scanner;

public class ex1 {

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
        int Num;

        do {
            System.out.print("Digite um númerp inteiro positivo: ");
            Num = sc.nextInt();
            if (Num <= 0) {
                System.out.println("Digite um número válido!");
            }
        } while (Num <= 0);

        if (isPrime(Num)) {
            System.out.println("O número " + Num + " é primo!" );            
        } else {
            System.out.println("O número " + Num + " não é primo!");
        }

        sc.close();
    }

}
