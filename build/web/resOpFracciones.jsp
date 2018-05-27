<%-- 
    Document   : resOpFracciones
    Created on : 26/05/2018, 06:39:56 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    class Fraccion {
        public int numerador;
        public int denominador;

        public Fraccion (int n, int d){
            this.numerador = n;      
            this.denominador = d;
        }
        public Fraccion(){}

        public int returnNumerador() {
            return this.numerador;
        }
        public int returnDenominador() {
            return this.denominador;
        }
    }

    class OpFracciones {
        Fraccion F1;
        Fraccion F2;

        public OpFracciones(Fraccion I1,Fraccion I2) {
            this.F1 = I1;
            this.F2 = I2;
        }

        public Fraccion Suma() {
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();     
            int t1 = this.F1.returnNumerador() * this.F2.returnDenominador();
            int t2 = this.F1.returnDenominador() * this.F2.returnNumerador();
            int resnum = t1 + t2;
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Resta() {
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();     
            int t1 = this.F1.returnNumerador() * this.F2.returnDenominador();
            int t2 = this.F1.returnDenominador() * this.F2.returnNumerador();
            int resnum = t1 - t2;
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Multiplicacion() {
            int resnum = this.F1.returnNumerador() * this.F2.returnNumerador();
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Division() {
            int resnum = this.F1.returnNumerador() * this.F2.returnDenominador();
            int resden = this.F1.returnDenominador() * this.F2.returnNumerador();        
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        private Fraccion simplificar(Fraccion temp) {
            if(temp.returnDenominador() == 0)
                return temp;
            int i;
            for(i = 2; i < 100; i++)
            {
                if((i == 2 || i == 3 || i == 5 || i == 7) || ((i % 2)!= 0 && (i % 3)
                        != 0 && (i % 5) != 0 && (i % 7) != 0))
                {
                    if(temp.returnNumerador() % i == 0 && temp.returnDenominador()
                            % i == 0)
                    {
                        temp.numerador /= i;
                        temp.denominador /= i;
                        i = 1;
                    }
                }
            }
            return temp;
        }
    }

    int num1 = Integer.parseInt(request.getParameter("num1"));
    int den1 = Integer.parseInt(request.getParameter("den1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));
    int den2 = Integer.parseInt(request.getParameter("den2"));

    Fraccion aux = new Fraccion();
    Fraccion fracc1 = new Fraccion(num1, den1);
    Fraccion fracc2 = new Fraccion(num2, den2);

    OpFracciones myOp = new OpFracciones(fracc1, fracc2);
    int higherFracc;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados de Fracciones</title>
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link rel="shortcut icon" type="image/x-icon" href="css/chart-pie.png"/>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>Atributo</th>
                    <th>Valor</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>F1</td>
                    <td>
                        <%= fracc1.returnNumerador()%>/<%= fracc1.returnDenominador()%>
                    </td>
                </tr>
                <tr>
                    <td>F2</td>
                    <td>
                        <%= fracc2.returnNumerador()%>/<%= fracc2.returnDenominador()%>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>F1 + F2</td>
                    <%
                        aux = myOp.Suma();                        
                    %>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr>
                    <td>F1 - F2</td>
                    <%
                        aux = myOp.Resta();     
                        if (aux.returnNumerador() > 0) 
                            higherFracc = 1;
                        else if (aux.returnNumerador() < 0)
                            higherFracc = 2;
                        else
                            higherFracc = 0;
                    %>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr>
                    <td>F1 * F2</td>
                    <%
                        aux = myOp.Multiplicacion();                       
                    %>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr>
                    <td>F1 / F2</td>
                    <%
                        aux = myOp.Division();                       
                    %>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr>
                    <td>Fracción mayor</td>
                    <td>
                        <% 
                           if (higherFracc == 1) {
                        %>                              
                            <%= "Fracción 1" %>
                        <% 
                           } else if (higherFracc == 2) {
                        %>
                            <%= "Fracción 2" %>
                        <% 
                           } else {
                        %>
                            <%= "Ambas fracciones son iguales" %>
                        <%}%>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
