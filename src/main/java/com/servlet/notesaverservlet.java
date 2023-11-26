package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class notesaverservlet
 */
public class notesaverservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public notesaverservlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    PrintWriter out=response.getWriter();
		
		    String action=request.getParameter("action");
		    
		    if(action!=null && action.equals("delete")){
		    int id=Integer.parseInt(request.getParameter("id"));
			Session s=FactoryProvider.getFactory().openSession();
			Transaction txn=s.beginTransaction();
		    Note note=(Note)s.get(Note.class, id);
		   
		    //deleting.. hello
		  s.delete(note);
		    txn.commit();
		   s.close();
		  response.sendRedirect("shownotes.jsp");
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		//t
	if(action!=null && action.equals("add"))
	{
		try{
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		System.out.println(content);
		
		Note n=new Note(title,content,new Date());
		
	  Session s=FactoryProvider.getFactory().openSession();
	   Transaction txn=s.beginTransaction();
	   
	   s.save(n);
	   txn.commit();
	   s.close();
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		//response.sendRedirect("shownotes.jsp");
	  out.println("<h1 style='text-align:center'>Note Save Successfully....</h1>"); 
	  out.println("<h1 style='text-align:center'><a href='shownotes.jsp'>View Notes</a></h1>"); 
	  
	   
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}	
		if(action!=null && action.equals("update"))
		{
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("id"));
			//Note n=new Note(id,title,content,new Date());
			  Session s=FactoryProvider.getFactory().openSession();
			   Transaction txn=s.beginTransaction();
			   
			   Note note=s.get(Note.class, id);
			   note.setTitle(title);
			   note.setContent(content);
			   note.setDate(new Date());
			   
			  
			   txn.commit();
			   s.close();
				PrintWriter out=response.getWriter();
				response.setContentType("text/html");
				response.sendRedirect("shownotes.jsp");
			 
			  
		}
		
	}

}
