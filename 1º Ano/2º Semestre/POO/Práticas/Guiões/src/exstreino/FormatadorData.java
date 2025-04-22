package exstreino;

import java.util.Scanner;

public class FormatadorData {
    public static void main(String[] args) {
        // Solicitar a data ao usuário
        Scanner scanner = new Scanner(System.in);
        System.out.print("Digite a data no formato DD/MM/AAAA: ");
        String data = scanner.nextLine();
        scanner.close();
        
        // Verificar e formatar a data
        if (isValidFormat(data)) {
            String dataFormatada = formatarData(data);
            System.out.println("Data formatada: " + dataFormatada);
        } else {
            System.out.println("Formato de data inválido. Por favor, insira no formato DD/MM/AAAA.");
        }
    }

    public static boolean isValidFormat(String data) {
        // Verificar se a entrada tem o formato correto
        if (data.length() != 10 || data.charAt(2) != '/' || data.charAt(5) != '/') {
            return false;
        }
        // Verificar se os componentes da data são números
        for (int i = 0; i < data.length(); i++) {
            if (i == 2 || i == 5) {
                continue;
            }
            if (!Character.isDigit(data.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static String formatarData(String data) {
        // Dividir a data em dia, mês e ano
        String[] partes = data.split("/");
        String dia = partes[0];
        String mes = partes[1];
        String ano = partes[2];
        
        // Formatar a data no formato DD/MM/AAAA
        return dia + "/" + mes + "/" + ano;
    }
}

