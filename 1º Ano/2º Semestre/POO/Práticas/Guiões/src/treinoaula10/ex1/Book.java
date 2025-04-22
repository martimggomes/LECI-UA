package treinoaula10.ex1;

public class Book {
    private String tittle;
    private String author;
    private int year;

    public Book (String tittle, String author, int year) {
        this.tittle = tittle;
        this.author = author;
        this.year = year;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return "Livro: " + getTittle() + " | Autor: " + getAuthor() + " | Ano: " + getYear();
    }

}
