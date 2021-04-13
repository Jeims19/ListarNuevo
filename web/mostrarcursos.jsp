<%@page import= "java.sql.*" %>
<%@page import ="bd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos</title>
        <%! 
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs;
        %>  
      
    </head>
    <body>
        
        <table border="1" cellspacing ="0" align="center">
            <thead>
                <th>IDE</th>
                <th>CODIGO</th>
                <th>NOMBRE</th>
                <th>HORAS</th>
                <th>CREDITOS</th>
                <th>ESTADO</th>
                
            </thead>
     
       <% 
       try {
           ConectaBd bd=new ConectaBd();
           cn = bd.getConnection();
           consulta = "Select idcurso, codigo, nombre, horas, creditos, estado "
                   + "from curso order by nombre asc"; // para ordenar depende de nombre
           pst = cn.prepareStatement(consulta);
           rs=pst.executeQuery();
           
           while(rs.next()){
           %>
           <tr align="center">
                    <td><%out.print(rs.getString(1));%></td>
                    <td><%out.print(rs.getString(2));%></td>
                    <td><%out.print(rs.getString(3));%></td>
                    <td><%out.print(rs.getString(4));%></td>
                    <td><%out.print(rs.getString(5));%></td>
                    <td><%out.print(rs.getString(6));%></td>
                </tr>
           
           <%
          
           }
           
           } catch (Exception e) {
               out.print("Error en conexion");
           }
       
       
       %>
        </table>
        
    </body>
</html>
