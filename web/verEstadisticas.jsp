<%@page import="dominio.mesGanancia"%>
<%@page import="controladores.ControladorUsuarios"%>
<%@page import="dominio.Juego"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.Controladorjuegos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <%
            Controladorjuegos cj = controladores.Controladorjuegos.getInstancia();
            ControladorUsuarios cu = controladores.ControladorUsuarios.getInstancia();
        %>
        <!--Load the AJAX API-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="plantillas/header.jsp"></jsp:include>
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
            <script type="text/javascript">

                // Cargar el API de visualización y el paquete gráfico circular.
                google.load('visualization', '1.0', {'packages': ['corechart']});

                // Establecer una devolución de llamada que se ejecutará 
                // cuando se carga el API de visualización de Google.
                google.setOnLoadCallback(drawChart);
                google.setOnLoadCallback(drawChart2);
                // Función de llamada que crea y rellena una tabla de datos,
                //crea una instancia del gráfico circular, pasa en los datos y
                //dibuja.
                function drawChart() {

                    // Crea tabla con los datos
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Slices');
                    data.addRows([
            <%
                ArrayList lstGan = cj.gananciaPorJuego(15);
                for (int i = 0; i < lstGan.size(); i++) {
                    Juego j = (Juego) lstGan.get(i);
                    if (i < lstGan.size() - 1) {
                        out.write("['" + j.getNombre() + "', " + j.getGanancias() + "],");
                    } else {
                        out.write("['" + j.getNombre() + "', " + j.getGanancias() + "]");
                    }


                }
            %>

                    ]);

                    // Seteo propiedades al grafico
                    var options = {'title': 'Ganancias'};

                    // Crear instancias y dibuja la tabla, pasando algunas de las opciones.
                    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
                function drawChart2() {
                    var data2 = google.visualization.arrayToDataTable([
                        ['Month', 'Porcentaje de ganancia por juego'],
            <%
                ArrayList<mesGanancia> lstmesGanancia = cu.gananciaPorMes(15).getListaGananciasPorMes();
                for (int i = 0; i < lstmesGanancia.size(); i++) {
                    mesGanancia mG = (mesGanancia) lstmesGanancia.get(i);
                    if (i < lstmesGanancia.size() - 1) {
                        out.write("['" + mG.getMes() + "', " + mG.getGanancia() + "],");
                    } else {
                        out.write("['" + mG.getMes() + "', " + mG.getGanancia() + "]");
                    }


                }
            %>

                    ]);

                    var options2 = {
                        title: 'Ganancias por mes'
                    };

                    var chart2 = new google.visualization.LineChart(document.getElementById('chart2_div'));
                    chart2.draw(data2, options2);
                }


        </script>
    </head>

    <body>  
        <!--Div that will hold the pie chart-->
        <div id="chart_div"></div>
        <div id="chart2_div" style="width: 900px; height: 500px;"></div>
        
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
