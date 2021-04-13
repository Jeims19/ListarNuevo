<%@page import= "java.sql.*" %>
<%@page import= "bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vamos prras</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
        
        %>
    </head>
    <body>
        <table border="1">
            <thead>
                    <th>Codigo</th>
                    <th>Estudiante</th>
                    <th>Apellido</th>
                    <th>Curso</th>
                    <th>Horas</th>
                    <th>Creditos</th>
                </thead>
            
                
       

        <%
            try {
                ConectaBd bd1 = new ConectaBd();
                cn = bd1.getConnection();
                consulta = "select e.codigo, e.nombre, e.apellido, c.nombre, c.horas, c.creditos "
                        + "from estudiante e, curso c, estudiante_curso ec "
                        + "where e.idestudiante= ec.idestudiante "
                        + "and c.idcurso= ec.idcurso"; 
                        
                        
                pst = cn.prepareStatement(consulta);
                rs= pst.executeQuery();
                        
                while(rs.next()){
                    %>
                <tr>
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
                    out.print("error en ejecucion");
                }
        
        
        
        %>
        </table>
        
    </body>
</html>
