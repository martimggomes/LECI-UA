package aula012.ex2;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public class ContadorLetrasPelaInicial {
    public static void main(String[] args) {
        String inputFilePath = "src\\aula012\\ex2\\texto.txt";
        String outputFilePath = "src\\aula012\\ex2\\output.txt";

        try {
            String content = new String(Files.readAllBytes(Paths.get(inputFilePath)));

            String[] words = content.toLowerCase().split("\\W+");

            Map<Character, Map<String, Integer>> letterCount = new TreeMap<>();

            for (String word : words) {
                if (word.length() >= 3) {
                    char initial = word.charAt(0);
                    letterCount.putIfAbsent(initial, new TreeMap<>());
                    Map<String, Integer> wordCount = letterCount.get(initial);
                    wordCount.put(word, wordCount.getOrDefault(word, 0) + 1);
                }
            }

            try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(outputFilePath))) {
                for (Map.Entry<Character, Map<String, Integer>> entry : letterCount.entrySet()) {
                    writer.write(entry.getKey() + ":");
                    Map<String, Integer> wordCount = entry.getValue();
                    for (Map.Entry<String, Integer> wordEntry : wordCount.entrySet()) {
                        writer.write(wordEntry.getKey() + "; " + wordEntry.getValue() + "; ");
                    }
                    writer.newLine();
                }
            }

            System.out.println("O ficheiro de palavras foi escrita para o ficheiro: " + outputFilePath);

        } catch (IOException e) {

            System.err.println("Erro ao ler o ficheiro: " + e.getMessage());


        }
    }
}
