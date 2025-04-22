package aula010.ex1;

public class Book {
    
    private String title;
    private String author;
    private int year;

    public Book(String title, String author, int year) {
        this.title = title;
        this.author = author;
        this.year = year;
    }
    
    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public int getYear() {
        return year;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return title + " | " + author + " | " + year;
    }

    @Override   
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        Book b = (Book) obj;
        return title.equals(b.title) && author.equals(b.author) && year == b.year;
    }

    @Override
    public int hashCode() {
        return title.hashCode() + author.hashCode() + year;
    }
    
}
