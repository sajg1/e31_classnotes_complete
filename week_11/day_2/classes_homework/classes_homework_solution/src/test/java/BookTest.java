import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class BookTest {
    private Book book;

    @Before
    public void setUp() {
        book = new Book("1984", "George Orwell", "Dystopian Lit");
    }

    @Test
    public void hasTitle() {
        assertEquals("1984", book.getTitle());
    }

    @Test
    public void hasAuthor() {
        assertEquals("George Orwell", book.getAuthor());
    }

    @Test
    public void hasGenre() {
        assertEquals("Dystopian Lit", book.getGenre());
    }


}
