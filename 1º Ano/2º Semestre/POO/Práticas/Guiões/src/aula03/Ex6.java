package aula03;

import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Digite uma palava, frase ou parágrafo: ");
        String input = sc.nextLine();

        String Minúscula = input.toLowerCase();
        System.out.println(Minúscula);

        char ÚltimoCaracter = input.charAt(input.length() - 1);
        System.out.println(ÚltimoCaracter);

        String TresPrimeirosCaracteres = input.substring(0, Math.min(input.length(), 3));
        System.out.println(TresPrimeirosCaracteres);

        // Verificar se existe certa palavra dentro da frase
        boolean TemPalavra = input.contains("interessante");
        System.out.println(TemPalavra);

        // Sustituir letras
        String SubstituirLetras = input.replace('a', 'm');
        System.out.println(SubstituirLetras);

        // Remover espaços em branco no início e final da frase

        String RemoveEspacos = input.trim();
        System.out.println(RemoveEspacos);

        sc.close();
    }
}
