package treinoaula03;

import java.util.Scanner;
import java.util.Random;

public class ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Quantos alunos tem a turma? ");
        int alunos = sc.nextInt();

        double[][] notas = new double[alunos][3];

        System.out.printf("%6s %6s %6s\n", "NotaT", "NotaP", "Pauta");

        Random random = new Random();
        for (int i = 0; i < alunos; i++) {
            double notaP, notaT, notaFinal;

            notaT = Math.round(random.nextDouble() * 20.0 * 10) / 10.0;
            notaP = Math.round(random.nextDouble() * 20.0 * 10) / 10.0;

            if (notaT < 7 || notaP < 7) {
                notaFinal = 66;
            } else {
                notaFinal = Math.round(0.4 * notaT + 0.6 * notaP);
            }

            notas[i][0] = notaT;
            notas[i][1] = notaP;
            notas[i][2] = (int) notaFinal;

            System.out.printf("%6.1f %6.1f %6.0f\n", notaT, notaP, notaFinal);
        }
        sc.close();
    }
}
