package treinoaula10.ex1;

import java.util.HashMap;

public class BookType {
    
    private HashMap<String, Book> types = new HashMap<>();  

    public BookType () {

    }

    public void addBookTyoe(String type , String tittle, String author, int year) {
       Book livro = new Book(tittle, author, year);
          types.put(type, livro);

    } 

    
    public void addBookTyoe(String type, Book livro) {
           types.put(type, livro);
 
     } 

     public String toString() {
        String result = "";
        for (String key : types.keySet()) {
            result += key + " { " + types.get(key) + " } " + "\n";
        }
        
        return result;
     }
}
