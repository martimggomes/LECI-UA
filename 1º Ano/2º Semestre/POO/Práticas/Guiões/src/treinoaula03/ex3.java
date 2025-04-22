package treinoaula03;

import java.util.Scanner;
import java.util.Random;

public class ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random random = new Random();

        do {
            int NumeroAleatorio = random.nextInt(100) + 1;
            int tentativas = 0;
            boolean Acertou = false;

            System.out.println("Vamos jogar ao jogo do AltoBaixo. Este jogo consiste em tentares acertar no número que o programa, aleatoriamente, escolheu. Vamos começar!");
        
            do {
                System.out.print("Tentativa: ");
                int tentativa = sc.nextInt();
                tentativas++;

                if (tentativa < NumeroAleatorio) {
                    System.out.println("Demasiado baixo!");
                } else if (tentativa > NumeroAleatorio) {
                    System.out.println("Demasiado alto!");
                } else {
                    Acertou = true;
                    System.out.println("Você acertou em " + tentativas + " tentativas!");
                }

            } while (!Acertou);

            System.out.print("Pretende continuar? Prima (S)im ");
            String resposta = sc.next();

            if (!resposta.equalsIgnoreCase("S") && !resposta.equalsIgnoreCase("Sim")) {
                System.out.println("Obrigado por ter jogado!");
                break;
            }
        } while (true);
        sc.close();
    }
}
