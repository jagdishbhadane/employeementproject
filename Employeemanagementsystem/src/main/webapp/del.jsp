
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
out.print("Id:="+id);

Connection con;

PreparedStatement psmt;
	try {
		 String url="jdbc:postgresql://localhost:5432/Employeesystem";
        String user="postgres";
        String pwd="Jagdish@2003";
        Class.forName("org.postgresql.Driver");
        con=DriverManager.getConnection(url,user,pwd);
        System.out.println("Con OK");
        psmt=con.prepareStatement("delete from employee where id="+id);
        int r= psmt.executeUpdate(); 
        if(r<1) {
       	 String msg = "Error";
     	   System.err.println("Error");
     	   response.sendRedirect("dbcon.jsp");
        }else {
       	 String msg = "Login Successful";
     	   System.out.println("Insert Success..!");
     	  response.sendRedirect("dbcon.jsp");
        }
	}catch(Exception e){
		
	}





%>
</body>
</html>