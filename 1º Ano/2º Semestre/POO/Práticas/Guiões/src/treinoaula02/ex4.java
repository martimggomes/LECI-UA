package treinoaula02;

import java.util.Scanner;
import java.text.DecimalFormat;

public class ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual o montante investido: ");
        double Mi = sc.nextDouble();
        System.out.print("Qual a taxa de juro mensal: ");
        double Tjm = sc.nextDouble();
        Tjm = Tjm / 100;
        double Tm = Mi * Math.pow(1 + Tjm, 3); 
        
        DecimalFormat df = new DecimalFormat("#.###");
        String TmFormatado = df.format(Tm);
        
        System.out.println("O valor total ao fim de 3 meses será de " + TmFormatado + " euros");
        sc.close();
    }
}
