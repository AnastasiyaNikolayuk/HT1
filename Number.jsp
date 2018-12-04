<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.12.2018
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="app.Person" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <title>Информация о номере</title>
</head>
<body>
<%
    HashMap<String,String> jsp_parameters = new HashMap<String,String>();
    Person person = new Person();
    String number = "";

    if (request.getAttribute("jsp_parameters") != null)
    {
        jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
    }

    if (request.getAttribute("person") != null)
    {
        person=(Person)request.getAttribute("person");
    }

    number = person.getPhones().get("0");
%>
<form action="<%=request.getContextPath()%>/" method="post">
    <input type="hidden" name="id" value="<%=person.getId()%>"/>
    <table align="center" border="1" width="70%">
        <tr>
            <td colspan="2" align="center">Информация о телефоне владельца: <%=person.getSurname()+ " " + person.getName() + person.getMiddlename()%></td>
        </tr>
        <tr>
            <td>Номер:</td>
            <td><input type="text" name="number" value="<%=number%>"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="<%=jsp_parameters.get("next_action")%>" value="<%=jsp_parameters.get("next_action_label")%>" />
            </td>
            <td>
                <a href="List.jsp">Вернуться к списку</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
