package aula010.ex4;

import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.LinkedList;

public class Ex4 {
    public static void main(String[] args) throws IOException{
        LinkedList<String> words = new LinkedList<String>();
        try (Scanner input = new Scanner(new FileReader("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\POO\\Práticas\\Guiões\\src\\aula010\\ex4\\words.txt"))) {
            
            System.out.println("Palvras com mais de 2 caracteres: ");
            while (input.hasNext()) {
                String word = input.next();
                if (word.length() > 2) {
                    words.add(word);
                }
                System.out.println(word);
            }

            System.out.println("Palavras que terminam em 's': ");
            for (String word : words) {
                if (word.endsWith("s")) {
                    System.out.println(word);
                }
            }
        }

            words.removeIf(word -> !word.matches("^[a-zA-Záàãâéẽêíóõôúç]+$"));
    }
}
