package aula02;

import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual o montante investido? ");
        double MontanteInvestido = sc.nextDouble();
        System.out.print("Qual a taxa de juro mensal? ");
        double JuroMensal = sc.nextDouble();
        
        JuroMensal = JuroMensal / 100; 
        
        double ValorTotal = MontanteInvestido * Math.pow(1 + JuroMensal, 3);
        
        System.out.println("O valor total ao final de 3 meses é de " + ValorTotal + " €");

        sc.close();
        
    }
}  

