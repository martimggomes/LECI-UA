package aula03;

import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
        "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};

        int Mes;
        int Ano;
        int DiaDaSemana;
        
        do {
            System.out.print("Digite uma data: (no formato mm/yyyy) ");
            String Data = sc.nextLine();
            if (!Data.matches("\\d{2}/\\d{4}")) {
                System.out.println("Data Inválida");
                continue;
            }
            
            String[] SplitData = Data.split("/");
            Mes = Integer.parseInt(SplitData[0]);
            Ano = Integer.parseInt(SplitData[1]);
            
            if (Mes < 1 || Mes > 12) {
                System.out.println("Mês Inválido");
                continue;
            }
            if (Ano <= 0) {
                System.out.println("Ano inválido");
                continue;
            }
            break;
           
        } while (true);

        do {
            System.out.print("Em que dia da semana começa esse mês? (ex.: 1 = Segunda (escreva apenas o número)) ");
            DiaDaSemana = sc.nextInt();
            if (DiaDaSemana < 1 || DiaDaSemana > 7) {
                System.out.println("Dia da semana inválido");
                continue;
            }
            break;
        } while (true);

        imprimirCalendário(Mes, Ano, DiaDaSemana, meses);

        sc.close();
    }

    public static void imprimirCalendário(int Mes, int Ano, int DiaDaSemana, String[] meses) {
        String[] semana = {"Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"};
    
        System.out.println(meses[Mes - 1] + " " + Ano);
        System.out.println(" " + String.join(" ", semana));
    
        int diasNoMes = calcularDiasNoMes(Mes, Ano);
    
        // Imprimir espaços em branco para alinhar o primeiro dia do mês
        for (int i = 1; i < DiaDaSemana; i++) {
            System.out.print("   "); // 3 espaços para cada dia
        }
    
        int dia = 1;
        for (int i = DiaDaSemana; i <= DiaDaSemana + diasNoMes - 1; i++) {
            System.out.printf("%2d ", dia);
            if (i % 7 == 0) {
                System.out.println(); // Quebra de linha a cada 7 dias
            }
            dia++;
        }
    }
    
        public static int calcularDiasNoMes(int Mes, int Ano) {
            int[] diasNoMes = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
            if (Mes == 2 && ehBissexto(Ano)) {
                return diasNoMes[Mes - 1] + 1;
            } else {
                return diasNoMes[Mes - 1];
            }
        }
    
        public static boolean ehBissexto(int Ano) {
            return (Ano % 4 == 0 && (Ano % 100 != 0 || Ano % 400 == 0));
        }
    }
     
