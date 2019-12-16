import java.util.ArrayList;
import java.util.HashMap;

public class Library {
    private int capacity;
    private ArrayList<Book> collection;


    public Library(int capacity) {
        this.capacity = capacity;
        this.collection = new ArrayList<>();
    }

    public int getCapacity() {
        return capacity;
    }

    public boolean hasCapacity() {
        return capacity > collection.size();
    }

    public int bookCount() {
        return this.collection.size();
    }

    public void addBook(Book book) {
        if(hasCapacity()){
            this.collection.add(book);
        }
    }

    public void loanBook(Book book, Borrower borrower) {
        // check if book in book collection
        if(this.collection.contains(book)){
            // if it is, remove book from collection
            this.collection.remove(book);

            // add to borrower
            borrower.addBook(book);
        }
    }

    public boolean checkInStock(Book book) {
//        return this.collection.contains(book);
        for(Book individualBook:this.collection){
            if(individualBook == book){
                return true;
            }
        }
        return false;
    }
}
