<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    </head>
    <body>
        <%
            //recebe tudo do indianime
            int codigo;
            String nome, genero;
            double nota;

            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            genero = request.getParameter("genero");
            nota = Double.parseDouble(request.getParameter("nota"));

            try {
                //conectar no banco
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancoanime", "root", "rian0412");
                //hora de colocar os dados pelo site
                st = conecta.prepareStatement("INSERT INTO anime VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, genero);
                st.setDouble(4, nota);
                st.executeUpdate(); //para iniciar o comando INSERT para mandar para o banco
                out.print("Anime Adicionado, Obrigado Por Contribuir!!");
            } catch (Exception x) {
                String erro = x.getMessage();
                if(erro.contains("Duplicate entry")){
                out.print("Este Anime ja esta acadastrado");
            }else{
            
                out.print("Desculpe deu erro. Essas são as informações sobre:" + x.getMessage());
            }
            }

        %>


    </body>
</html>
