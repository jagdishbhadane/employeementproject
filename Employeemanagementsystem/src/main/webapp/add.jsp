<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String nm=request.getParameter("nm");
String e=request.getParameter("eml");
int a=Integer.parseInt(request.getParameter("sal"));
String p=request.getParameter("pas");

out.print("id:="+id);
out.print("Name:="+nm);
out.print("Eml:="+e);
out.print("sal:="+a);
out.print("pas:="+p);

Connection con = null;
PreparedStatement psmt = null;
ResultSet rs = null;
String url="jdbc:postgresql://localhost:5432/Employeesystem";
	String unm="postgres";
	String pwd="Jagdish@2003";

try {
		
		con=DriverManager.getConnection(url,unm,pwd);
		System.out.println("Connection Success");			
		 psmt=con.prepareStatement("insert into employee(id,name,email,salary,pas)"
		 		+ "values(?,?,?,?,?)");
		 psmt.setInt(1, Integer.parseInt(id));   // id String → int
		 psmt.setString(2, nm);
		 psmt.setString(3, e);
		 psmt.setInt(4, a);
		 psmt.setString(5, p);
		 
		 
		 int rows=psmt.executeUpdate();

            if(rows > 0)
              out.println("Insert Successful ✅");
            else
    out.println("Insert Failed ❌");
		}catch(Exception ee) {
        System.out.println(ee);
	}
 


%>
</body>
</html>
