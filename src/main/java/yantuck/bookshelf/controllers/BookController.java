package yantuck.bookshelf.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import yantuck.bookshelf.models.Book;
import yantuck.bookshelf.services.BookService;

@Controller
public class BookController {

    @Autowired BookService bookService;

    //! CREATE

    @GetMapping("/books/new")
    public String newBook(@ModelAttribute("book")Book book){
        return "books/new.jsp";
    }

    @PostMapping("/books")
    public String createBook(@Valid @ModelAttribute("book")Book book, BindingResult result){
        if (result.hasErrors()) {
            return "books/new.jsp";
        } else {
        bookService.createBook(book);
        return "redirect:/books";
        }
    }
    
    //! READ ALL
    @GetMapping("/books")
    public String books(Model model){
        List<Book> books = bookService.getAllBooks();
        System.out.println(books);
        model.addAttribute("books", books);
        return "books/books.jsp";
    }


    //! READ ONE
    @GetMapping("/books/{id}")
    public String show(@PathVariable("id")Long id, Model model){
        Book book = bookService.getOneBook(id);
        model.addAttribute("book", book);
        return "books/show.jsp";
    }


// ! UPDATE
@GetMapping("/books/edit/{id}")
public String edit(@PathVariable("id") Long id, Model model) {
    Book book = bookService.getOneBook(id);
    model.addAttribute("book", book);
    return "/books/edit.jsp";
}

@PutMapping("/books/{id}")
public String update(
        @Valid @ModelAttribute("book") Book book,
        BindingResult results,
        Model model) {

    if (results.hasErrors()) {
        return "/books/edit.jsp";
    } else {
        bookService.updateBook(book);
        return "redirect:/books";
    }
    }
//! DELETE
@DeleteMapping("/books/{id}")
public String destroy(@PathVariable("id")Long id){
    Book book = bookService.getOneBook(id);
    bookService.deleteBook(book);
    return "redirect:/books";
}
}
