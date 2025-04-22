package aula02;

import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args){
    Scanner sc = new Scanner(System.in);
    System.out.print("Qual a quantidade de água? (em Kg) ");
    double M = sc.nextDouble();
    System.out.print("Qual a temperatura inicial da água? (em Graus Celsius) ");
    double TemperaturaInicial = sc.nextDouble();
    System.out.print("Qual a temperatura final da água? (em Graus Celsius) ");
    double TemperaturaFinal = sc.nextDouble();
    double Q = M * (TemperaturaFinal - TemperaturaInicial) * 4184;
    System.out.println("A energia necessária para aquecer a água desde uma temperatura inicial até uma temperatura final é de " + Q + " Joules");
    
    sc.close();
    }
}
