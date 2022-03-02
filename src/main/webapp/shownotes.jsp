<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.Query" %>
    <%@ page import="com.helper.*" %>
    <%@page import="org.hibernate.Session" %>
    <%@page import="java.util.List" %>
    <%@page import="com.entities.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <%@include file="all_css.jsp" %>
<title>Show Note  </title>
</head>
<body>



 <div class="container-fluid p-0 m-0">
    
      <%@include file="nav.jsp"%>
    
    
    
     </div>


<div class="container   text-center" >
  <h2>Show All Notes</h2>

</div>





<div class="row">
<div class="col-12">
<%

                    Session s=FactoryProvider.getFactory().openSession();

                              Query q=s.createQuery("from Note");
                                  List<Note> list=q.list();
                               
                                  
                                for(Note n:list)
                                {
%>

      
            
         <div class="card">
       
  <div class="container text-center">
  <img class="card-img-top mt-2" style="max-width:100px" src="images/notetaker.svg" alt="Card image cap" >
 </div>
  <div class="card-body">
  <div class="container text-center">
    <h5 class="card-title"><%=n.getTitle() %></h5>
    <p class="card-text"><%=n.getContent() %></p>
    <a href="notesaverservlet?action=delete&id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
     <a href="edit.jsp?id=<%=n.getId() %>" class="btn btn-primary">Update</a>
  </div>
</div>
          </div>               


<%
} 
s.close();
%>
</div>
</div>



</body>
</html>