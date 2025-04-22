package aula03;

import java.util.Scanner;

public class Ex7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite uma frase: ");
        String input = sc.nextLine();

        int numCaracteresNumericos = countDigits(input);
        System.out.println("A frase tem " + numCaracteresNumericos + " caracteres numéricos.");

        int numEspacos = countSpaces(input);
        System.out.println("A frase tem " + numEspacos + " espaços.");

        String fraseEspacoUnico = replaceMultipleSpaces(input);
        System.out.println(fraseEspacoUnico);

        boolean ePalindromo = isPalindrome(input);
        System.out.println(ePalindromo);

        sc.close();
    }

    public static int countDigits(String s) {
        int count = 0;
        for (char n : s.toCharArray()) {
            if (Character.isDigit(n)) {
                count++;
            }
        }
        return count;
    }

    public static int countSpaces(String s) {
        int count = 0;
        for (char c : s.toCharArray()) {
            if (c == ' ') {
                count++;
            }
        }
        return count;
    }

    public static String replaceMultipleSpaces(String s) {
        return s.replaceAll("\\s+", " ");
    }

    public static boolean isPalindrome(String s) {
        String reversed = new StringBuilder(s).reverse().toString();
        return s.equalsIgnoreCase(reversed);
    }

}
