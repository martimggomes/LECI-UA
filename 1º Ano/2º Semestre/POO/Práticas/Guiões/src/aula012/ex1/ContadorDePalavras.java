package aula012.ex1;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public class ContadorDePalavras {
    public static void main(String[] args) {
        // Change the file path as per your file location
        String filePath = "src\\aula012\\ex1\\texto.txt";
        
        try {
            // Read all lines from the file
            String content = new String(Files.readAllBytes(Paths.get(filePath)));
            
            // Split the content into words using regex
            String[] words = content.split("\\W+");
            
            // Count total number of words
            int totalWords = words.length;
            
            // Use a Set to count unique words
            Set<String> uniqueWords = new HashSet<>(Arrays.asList(words));
            int uniqueWordCount = uniqueWords.size();
            
            // Print the results
            System.out.println("Número Total de Palavras: " + totalWords);
            System.out.println("Número de Diferentes Palavras: " + uniqueWordCount);
            
        } catch (IOException e) {
            System.err.println("Erro ao ler o ficheiro: " + e.getMessage());
        }
    }
}
