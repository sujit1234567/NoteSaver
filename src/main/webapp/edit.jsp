<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.helper.*" %>
    <%@page import="org.hibernate.*" %>
    <%@page import="com.entities.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <%@include file="all_css.jsp" %>
<title>Note Saver:Edit</title>
</head>
<body>

<div class="container-fluid p-0 m-0">
    
      <%@include file="nav.jsp"%>
    
    
    
     </div>
     
     
     <div class="row">
<div class="col-12">
 <%
 
int id=Integer.parseInt(request.getParameter("id").trim());
 Session s=FactoryProvider.getFactory().openSession();
 //Transaction txn=s.beginTransaction();
 Note note=(Note)s.get(Note.class,id);
 
%>   

<form action="notesaverservlet" method="post">
 <input type="hidden" name="action" value="update">
 <div class="form-group">
    <label for="title">Note Id</label>
    <input required type="text" class="form-control" name="id" id="id" aria-describedby="emailHelp" placeholder="Enter Id" value="<%=note.getId() %>">
   
  </div>
 
 <div class="form-group">
    <label for="title">Note Title</label>
    <input required type="text" class="form-control" name="title" id="title" aria-describedby="emailHelp" placeholder="Enter title" value="<%=note.getTitle() %>">
   
  </div>
  
  <div class="form-group">
    <label for="title">Note Content</label>
   <textarea id="content"
   name="content"
   class="form-control"
   placeholder="Enter title"
  
   style="height:300px";>
    <%=note.getContent() %>
   </textarea>
   
  </div>
  <div  class="container text-center">
  
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
  






</form>
</div>
</div>

</body>
</html>