<%-- 
    Document   : indexc
    Created on : 26/05/2018, 04:12:54 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operaciones con Fracciones</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="shortcut icon" type="image/x-icon" href="css/chart-pie.png"/>
    </head>
    <body>
        <h1>Operaciones con Fracciones</h1>        
        <h3>Ingrese lo solicitado</h3>
        <form id="fracForm" name="fraccionesInfo" action="resOpFracciones.jsp" method="POST">
            <section id="fracc">
                <section id="fracc1">
                    <label>Fracción 1</label>
                    <section class="f">
                        <input class="numerador" type="text" name="num1" placeholder="Num" required autocomplete="off"/>
                        <input class="denominador" type="text" name="den1" placeholder="Den" required autocomplete="off"/>
                    </section>
                </section>
                <section id="fracc2">
                    <label>Fracción 2</label>
                    <section class="f">                                           
                        <input class="numerador" type="text" name="num2" placeholder="Num" required autocomplete="off"/>
                        <input class="denominador" type="text" name="den2" placeholder="Den" required autocomplete="off"/>
                    </section>
                </section>
            </section>
            <section id="Btns">            
                <input id="clrBtn" type="reset" value="Limpiar" name="Reset" />
                <input id="sendBtn" type="submit" value="Calcular" name="send" />
            </section>
        </form>
    </body>
</html>
