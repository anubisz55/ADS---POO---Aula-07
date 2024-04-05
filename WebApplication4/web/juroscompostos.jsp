<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Juros Compostos</title>
</head>
<body>
<h1>Cálculo de Juros Compostos</h1>
 
    <%@ include file="/WEB-INF/jspf/menu.jspf" %>
 
    <%
        double montante = 0.0;
        double taxa = 0.0;
        int meses = 0;
        double valorFuturo = 0.0;
 
        if (request.getParameter("calcular") != null) {
            montante = Double.parseDouble(request.getParameter("montante"));
            taxa = Double.parseDouble(request.getParameter("taxa")) / 100.0; // Converter para decimal
            meses = Integer.parseInt(request.getParameter("meses"));
 
            // Fórmula de juros compostos
            valorFuturo = montante * Math.pow(1 + taxa, meses);
        }
    %>
 
    <form method="post">
        Montante: <input type="text" name="montante" value="<%= montante %>"><br>
        Taxa de juros (em %): <input type="text" name="taxa" value="<%= taxa * 100 %>"><br>
        Quantidade de meses: <input type="text" name="meses" value="<%= meses %>"><br>
<input type="submit" name="calcular" value="Calcular">
</form>
 
    <% if (request.getParameter("calcular") != null) { %>
<h2>Tabela de Valores Futuros Acumulados</h2>
<table border="1">
<tr>
<th>Período (meses)</th>
<th>Valor Futuro</th>
</tr>
<% for (int i = 1; i <= meses; i++) { %>
<tr>
<td><%= i %></td>
<td><%= montante * Math.pow(1 + taxa, i) %></td>
</tr>
<% } %>
</table>
<% } %>
</body>
</html>