<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
       <SELECT NAME="prmIdFamilia" CLASS="parameter_Select">
 <%
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection CON = java.sql.DriverManager.getConnection("jdbc:mysql://201.221.15.100:3306/market","random","random1");

            String qrCate = " SELECT id_categoria, "+
                            "nombre "+
                            " FROM categorias;";
                            
            PreparedStatement  PS   = CON.prepareStatement(qrCate);
            ResultSet RS            = PS.executeQuery();

            if(!RS.next()){
                out.println("<OPTION VALUE=\"0\" SELECTED>No hay datos</OPTION>");
            }else{
                do{
                    out.println("<OPTION VALUE=\""+ RS.getString(1) +"\">"+ RS.getString(2) +"</OPTION>");
                }while(RS.next());
            }
            System.out.println("Conexion realizada");
        }catch (Exception e3) {
            out.println("<OPTION VALUE=\"0\" SELECTED>No hay datos</OPTION>");
            System.out.println("No hizo conexion");
            e3.printStackTrace(System.err);
        }       
    %>
    </SELECT>
    </body>
</html>