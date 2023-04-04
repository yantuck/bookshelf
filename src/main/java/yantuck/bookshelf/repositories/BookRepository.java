package yantuck.bookshelf.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import yantuck.bookshelf.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {
    List<Book> findAll();
}
