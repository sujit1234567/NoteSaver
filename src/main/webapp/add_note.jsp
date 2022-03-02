<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="all_css.jsp" %>
<title>ADD Note</title>

</head>
<body>

 <div class="container-fluid p-0 m-0">
    
      <%@include file="nav.jsp"%>
    
    
    
     </div>


<h1>fill form</h1>

<!-- Form  -->


<form action="notesaverservlet" method="post">
<input type="hidden" name="action" value="add">
  <div class="form-group">
    <label for="title">Note Title</label>
    <input required type="text" class="form-control" name="title" id="title" aria-describedby="emailHelp" placeholder="Enter title">
   
  </div>
  
  <div class="form-group">
    <label for="title">Note Content</label>
   <textarea id="content"
   name="content"
   class="form-control"
   placeholder="Enter title"
   style="height:300px";></textarea>
   
  </div>
  <div  class="container text-center">
  
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
  
  
</form>

</body>
</html>