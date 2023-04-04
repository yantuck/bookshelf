<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->

    <title>books</title>
</head>
<body>
    <h1>All books</h1>
    
    <table class="table">
        <thead>
            <th>Name</th>
            <th>Posted By</th>
            <th>Actions</th>
        </thead>
        <tbody>
            <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.title}</td>
                <td>${book.user.userName}</td>
                <td>
                    <div style="display: flex;justify-content: space-evenly;">
                    <a href="/books/${book.id}"><button>View</button></a>
                    <!-- if the book.user_id equals the logged in user's id  -->
                    <c:if test="${book.user.id == userId}">
                    
                    <a href="/books/edit/${book.id}"><button >Edit</button></a>
                        <form action="/books/${book.id}" method="post">
                            <button type="submit" class="btn btn-danger">
                            <input type="hidden" name="_method" value="delete">
                            Delete
                            </button>
                        </form>
                    </c:if>
                    </div>
                    
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/books/new"><button>Add a Book</button></a>
    <a href="/logout"><button>Logout</button></a>
    
</body>
</html>