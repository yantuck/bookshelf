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
    <title>Document</title>
</head>
<body>

            <c:choose>
                <c:when test="${book.user.id == userId}">
                    <p>You created ${book.title} </p>
                </c:when>
                <c:otherwise>
                    <p>${book.user.userName} made ${book.title}</p>
                </c:otherwise>
            </c:choose>
            <a href="/books"><button>Home</button></a>

            <h1>Title: ${book.title}</h1>
            <h2>Author: ${book.author}</h2>
            <h3>Thoughts:</h3>
            <p>
                ${book.thoughts}
            </p> 
            

    </body>
    </html>