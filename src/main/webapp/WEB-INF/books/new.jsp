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
    <h2>New and improved form</h2>

        <form:form action="/books" method="post" modelAttribute="book">
            <div><form:input type = "hidden" path = "user" value = "${userId}"></form:input></div>
            <div><form:errors path="title" /></div>
            <div><form:errors path="author" /></div>
            <div><form:errors path="thoughts" /></div>

        <div class="form-control">
            <form:label path="title">title</form:label>
            
            <form:input path="title"></form:input>
        </div>
        <div class="form-control">
            <form:label path="author">author</form:label>
            
            <form:input path="author"></form:input>
        </div>
        <div class="form-control">
            <form:label path="thoughts">thoughts</form:label>
            
            <form:input path="thoughts"></form:input>
        </div>
        <input type="submit" value="submit">
        </form:form>

        <a class="btn btn-primary" href="/books">home</a>
    </div>
</body>
</html>