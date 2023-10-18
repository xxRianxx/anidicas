<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listas de animes</title>
        <link rel = "stylesheet" href="indicados.css">
        
    </head>
    <body>
        <%
            try {
                //conectar no banco
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancoanime", "root", "rian0412");
                //hora de colocar os dados pelo site
                st = conecta.prepareStatement("select * from anime");
                ResultSet rs = st.executeQuery();
                
                %>
                <table>
                 <tr>
                <th>Código</th><th>Nome</th><th>Genero</th><th>Nota</th>
            </tr>
                <%
                while (rs.next()) {

        %>

       
         

            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("genero")%></td>
                <td><%= rs.getString("nota")%></td>
            </tr>
       
        <%
                }
                %>
                 </table>
                 <%

            } catch (Exception x) {
                out.print("Desculpe deu erro. Essas são as informações sobre:" + x.getMessage());
            }

        %>
    </body>
</html>
