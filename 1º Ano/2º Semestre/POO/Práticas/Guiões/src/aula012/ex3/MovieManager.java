package aula012.ex3;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.stream.Collectors;


public class MovieManager {
    public static void main(String[] args) {
        String inputFilePath = "src\\aula012\\ex3\\movies.txt";
        List<Movie> movies = new ArrayList<>();

        try {
            List<String> lines = Files.readAllLines(Paths.get(inputFilePath));
            for (String line : lines.subList(1, lines.size())) { // skip header line
                String[] parts = line.split("\t");
                String name = parts[0];
                double score = Double.parseDouble(parts[1]);
                String rating = parts[2];
                String genre = parts[3];
                int runningTime = Integer.parseInt(parts[4]);

                Movie movie = new Movie(name, score, rating, genre, runningTime);
                movies.add(movie);
            }

            // Sort by name and list the movies
            movies.sort(Comparator.comparing(Movie::getName));
            System.out.println("Movies sorted by name:");
            movies.forEach(System.out::println);

            // Sort by score (descending) and list the movies
            movies.sort(Comparator.comparing(Movie::getScore).reversed());
            System.out.println("\nMovies sorted by score (descending):");
            movies.forEach(System.out::println);

            // Sort by running time (ascending) and list the movies
            movies.sort(Comparator.comparingInt(Movie::getRunningTime));
            System.out.println("\nMovies sorted by running time (ascending):");
            movies.forEach(System.out::println);

            // Print distinct genres and their counts
            Map<String, Long> genreCount = movies.stream()
                    .collect(Collectors.groupingBy(Movie::getGenre, Collectors.counting()));

            System.out.println("\nDistinct genres and their counts:");
            genreCount.forEach((genre, count) -> System.out.println(genre + ": " + count));

            // Get user input for genre
            Scanner scanner = new Scanner(System.in);
            System.out.print("\nEnter a genre: ");
            String userGenre = scanner.nextLine();

            String outputFilePath = "src\\aula012\\ex3\\myselection.txt";
            try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(outputFilePath))) {
                for (Movie movie : movies) {
                    if (movie.getScore() > 60 && movie.getGenre().equalsIgnoreCase(userGenre)) {
                        writer.write(movie.toString());
                        writer.newLine();
                    }
                }
                System.out.println("Movies with score > 60 and genre '" + userGenre + "' have been written to " + outputFilePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
