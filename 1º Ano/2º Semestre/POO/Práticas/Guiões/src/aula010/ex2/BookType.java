package aula010.ex2;

import java.util.HashMap;
import java.util.LinkedList;

public class BookType {
    static HashMap<String, LinkedList<Book>> books = new HashMap<>();
    @Override
    public String toString() {
            StringBuilder sb = new StringBuilder();
            for (String genre : books.keySet()) {
                sb.append(genre).append(":");
                for (Book book : books.get(genre)) {
                    sb.append("\n\t").append(book);
                }
                sb.append("\n");
            }
            return sb.toString();
        }
    
    
    public static void main(String[] args) {
        books.put("Drama", new LinkedList<>());
        books.put("Comédia", new LinkedList<>());
        books.put("Ficção", new LinkedList<>());
        books.put("Aventura", new LinkedList<>());
        books.put("Ação", new LinkedList<>());
        books.get("Drama").add( new Book("Drama 1", "João", 2000));
        books.get("Comédia").add(new Book("Comédia 1", "Rita", 2023));
        books.get("Ficção").add(new Book("Ficção 1", "Ricardo", 1990));
        books.get("Aventura").add( new Book("Aventura 1", "Cristiano", 2005));
        books.get("Ação").add(new Book("Ação 3", "Rodrigo", 1927));
        books.get("Ação").add(new Book("Ação 2", "Inês", 1483));
        books.get("Ficção").add( new Book("Ficção 2", "Martim", 2030));
        books.get("Ação").add(new Book("Ação 4", "Helena", 1245));
        books.get("Aventura").add(new Book("Aventura 3", "Miguel", 1912));
        books.get("Comédia").add(new Book("Comédia 2", "Leonardo", 2021));
        books.get("Aventura").add(new Book("Aventura 2", "Simão Guilhermme", 1123));
        System.out.println(books);
        System.out.println(selectRandomBook("Ficção"));
    }

    public static Book selectRandomBook(String genre) {
        LinkedList<Book> genreBooks = books.get(genre);
        int randomIndex = (int) (Math.random() * genreBooks.size());
        return genreBooks.get(randomIndex);
        
        }
    }

