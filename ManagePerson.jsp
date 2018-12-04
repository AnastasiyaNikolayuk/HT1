<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 30.11.2018
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="app.Person" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <title>Управление данными о человеке</title>
</head>
<body>
<%
    HashMap<String,String> jsp_parameters = new HashMap<String,String>();
    Person person = new Person();
    String error_message = "";
    String user_message = "";

    if (request.getAttribute("jsp_parameters") != null)
    {
        jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
    }

    if (request.getAttribute("person") != null)
    {
        person=(Person)request.getAttribute("person");
    }

    error_message = jsp_parameters.get("error_message");
    user_message = jsp_parameters.get("user_message");
%>

<form action="<%=request.getContextPath()%>/" method="post">
    <input type="hidden" name="id" value="<%=person.getId()%>"/>
    <table align="center" border="1" width="70%">
        <%
            if ((error_message != null)&&(!error_message.equals("")))
            {
        %>
        <tr>
            <td colspan="2" align="center"><span style="color:red"><%=error_message%></span></td>
        </tr>
        <%
            }
            if ((user_message != null)&&(!user_message.equals("")))
            {
        %>
        <tr>
            <td colspan="2" align="center"><%=user_message%></td>
        </tr>
        <%
            }
        %>
        <tr>
            <td colspan="2" align="center">Информация о человеке</td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td><input type="text" name="surname" value="<%=person.getSurname()%>"/></td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td><input type="text" name="name" value="<%=person.getName()%>"/></td>
        </tr>
        <tr>
            <td>Отчество:</td>
            <td><input type="text" name="middlename" value="<%=person.getMiddlename()%>"/></td>
        </tr>
        <tr>
            <td>Телефоны:</td>
            <td>
                <%
                    if (!person.getPhones().isEmpty()) {
                        for(String phone : person.getPhones().values())
                        {
                %>
                <%=phone%>&nbsp;<a href="<%=request.getContextPath()%>/?action=editN&id=<%=person.getId()%>&number=<%=phone%>">Редактировать</a>&nbsp;<a href="<%=request.getContextPath()%>/?action=deleteD&id=<%=person.getId()%>&number=<%=phone%>">Удалить</a>
                <%
                        }
                    }
                %>
                <a href="<%=request.getContextPath()%>/?action=addN&id=<%=person.getId()%>">Добавить</a>
            </td>
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
