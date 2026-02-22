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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
 function del(id){
	// alert("del"+id)
	window.location.href = "del.jsp?id="+id; 
 }

</script>
</head>
<body>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

String url="jdbc:postgresql://localhost:5432/Employeesystem";
String user="postgres";
String pwd="Jagdish@2003";

try { 
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection(url,user,pwd);
    st = con.createStatement();
    rs = st.executeQuery("select * from employee");
%>

<div class="container mt-4">

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Employeement</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="add.jsp" method="get">
      <div class="modal-body">
      <input class="form-control form-control-sm" type="number" name="id" placeholder="Enter Your id">
       <input class="form-control form-control-sm" type="text" name="nm" placeholder="Enter Your Name">
       <input class="form-control form-control-sm" type="text" name="eml" placeholder="Enter Your Email">
         <input class="form-control form-control-sm" type="number" name="sal" placeholder="Enter Your salary">
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>
     <button type="button"  data-toggle="modal" data-target="#exampleModal" class="btn btn-success">Add employeement</button>
    <h3 class="mb-3">employeement List</h3>
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped shadow">
            <thead class="table-dark">
                <tr>
                     <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>salary</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

<%
    while(rs.next()) {
        int id = rs.getInt("id");
        String nm = rs.getString("name");
        String eml = rs.getString("email");
        int sal = rs.getInt("salary");
%>

                <tr>
                 <td><%= id %></td>
                    <td><%= nm %></td>
                     <td><%= eml %></td>
                     <td><%= sal %></td>
                     <td><button type="button" onclick="del(<%= id %>)" class="btn btn-danger">Delete</button></td>
                </tr>

<%
    }   // end while
%>

            </tbody>
        </table>
    </div>
</div>

<%
} catch(Exception e) {
    out.println("<p class='text-danger'>Error: "+e.getMessage()+"</p>");
} finally {
    if(rs!=null) rs.close();
    if(st!=null) st.close();
    if(con!=null) con.close();
}
%>

</body>
</html>
