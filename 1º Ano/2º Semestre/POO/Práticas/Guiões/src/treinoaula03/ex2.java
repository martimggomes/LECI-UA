package treinoaula03;

import java.util.Scanner;

public class ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int MontInv;
        double TaxJuroMensal;

        do {
            System.out.print("Indique o montante investido (positivo e múltiplo de 1000): ");
            MontInv = sc.nextInt();
            if (MontInv <= 0) {
                System.out.println("Digite um número válido!");
            } else if (MontInv % 1000 != 0) {
                System.out.println("Digite um número válido!");
            }
        } while (MontInv <= 0 || MontInv % 1000 != 0);

        do {
            System.out.print("Indique a taxa de juro mensal (entre 0% e 5%): ");
            TaxJuroMensal = sc.nextDouble();
            if (TaxJuroMensal > 5.0 || TaxJuroMensal < 0.0) {
                System.out.println("Digite um número válido!");
            }
        } while (TaxJuroMensal > 5.0 || TaxJuroMensal < 0.0);

        double Investido = MontInv;

        System.out.println("Valor mensal do fundo nos próximos 12 meses:");
        for (int i = 1; i <= 12; i++) {
            double Juros = Investido * (TaxJuroMensal / 100);
            Investido += Juros;
            System.out.printf("Mês %d: %.2f\n", i, Investido);
        }
        sc.close();
    }
}
