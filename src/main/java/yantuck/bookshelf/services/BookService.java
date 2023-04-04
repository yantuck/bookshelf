package yantuck.bookshelf.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yantuck.bookshelf.models.Book;
import yantuck.bookshelf.repositories.BookRepository;

@Service
public class BookService {

    @Autowired BookRepository bookRepository;

    public void createBook(@Valid Book book) {
        bookRepository.save(book);
    }
//! READ ALL
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }
//! READ ONE
    public Book getOneBook(Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return book.orElse(null);
    }

    //! UPDATE
    public void updateBook(Book book) {
        bookRepository.save(book);
    }

    //! DELETE
    public void deleteBook(Book book) {
        bookRepository.delete(book);
    }
}
