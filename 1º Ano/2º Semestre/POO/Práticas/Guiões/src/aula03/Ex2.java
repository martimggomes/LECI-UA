package aula03;

import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int MontInv;
        double TaxaJuroMensal;

        do {
            System.out.print("Qual montante investiu? (positivo e múltiplo de 1000) => ");
            MontInv = sc.nextInt();
            if (MontInv < 0) {
                System.out.println("Valor inválido. O valor tem de ser positivo.");
            }
            else if (MontInv % 1000 != 0) {
                System.out.println("Valor inválido. O valor tem de ser múltiplo de 1000.");
            }
            
        } while (MontInv < 0 || MontInv % 1000 != 0);

        do {
            System.out.print("Qual a taxa de juro mensal? (entre 0% e 5%) => ");
            TaxaJuroMensal = sc.nextDouble();
            if (TaxaJuroMensal < 0.0 || TaxaJuroMensal > 5.0) {
                System.out.println("Valor inválido. O valor tem de estar compreendido entre 0.0 e 5.0");
            }
        } while (TaxaJuroMensal < 0.0 || TaxaJuroMensal > 5.0);

        double Investido = MontInv;

        System.out.println("Valor mensal do fundo nos próximos 12 meses: ");
        for (int i = 1; i <= 12; i++ ) {
            double juros = Investido * TaxaJuroMensal / 100;
            Investido += juros;
            System.out.printf("Mês %d: %.2f\n",i, Investido);
        }


        sc.close();
    }
}
