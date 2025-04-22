package aula010.ex1;

import java.util.HashMap;

public class BookType {
    static HashMap<String, Book> books = new HashMap<>();
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (String genero : books.keySet()) {
            sb.append(genero).append(" | ").append(books.get(genero)).append("\n");
        }
        return sb.toString();
    }



    
    public static void main(String[] args) {
        books.put("Drama", new Book("Drama 1", "João", 2000));
        books.put("Comédia", new Book("Comédia 1", "Rita", 2023));
        books.put("Ficção", new Book("Ficção 1", "Ricardo", 1990));
        books.put("Aventura", new Book("Aventura 1", "Cristiano", 2005));
        books.put("Ação", new Book("Ação 1", "Leonor", 1987));
        System.out.println(books);

        for (String genero : books.keySet()) {
            System.out.println(genero + " -> " + books.get(genero));
        }

        for (Book b : books.values()) {
            System.out.println(b);
        }


    }

}
