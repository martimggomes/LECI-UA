package treinoaula10.ex1;

public class Main {
    public static void main(String[] args) {
        
    BookType bookType = new BookType();

    bookType.addBookTyoe("Drama","ABVCDD", "João", 1234);
    
    bookType.addBookTyoe("Ação", new Book("EU", "asdc", 13840) );
    
    Book livro = new Book("ARSFD", "SDFS", 2123);

    bookType.addBookTyoe("Animação", livro);
    bookType.addBookTyoe("Terror", livro);
    bookType.addBookTyoe("Thriller", livro);

    System.out.println(bookType);

}
}
