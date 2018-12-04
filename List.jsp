<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 30.11.2018
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="app.Phonebook" %>
<%@ page import="app.Person" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <title>Список людей</title>
</head>
<body>
<%
    // Phonebook phonebook = Phonebook.getInstance();
    String user_message;
    HashMap<String,String> jsp_parameters = new HashMap<String,String>();
    Phonebook phonebook = (Phonebook)request.getAttribute("phonebook");

    if (request.getAttribute("jsp_parameters") != null)
    {
        jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
    }

    if (jsp_parameters.get("current_action_result_label") != null) {
        user_message = jsp_parameters.get("current_action_result_label");
    }
    else {
        user_message = "return";
    }
%>

<table align="center" border="1" width="90%">

    <%
        if (!user_message.equals("return"))
        {
    %>
    <tr>
        <td colspan="6" align="center"><%=user_message%></td>
    </tr>
    <%
        }
    %>

    <tr>
        <td colspan="6" align="center"><a href="<%=request.getContextPath()%>/?action=add">Добавить запись</a></td>
    </tr>
    <tr>
        <td align="center"><b>Фамилия</b></td>
        <td align="center"><b>Имя</b></td>
        <td align="center"><b>Отчество</b></td>
        <td align="center"><b>Телефон(ы)</b></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
    </tr>

    <%
        for (Person person : phonebook.getContents().values()) {

    %>
    <tr>
        <td><%=person.getSurname()%></td>
        <td><%=person.getName()%></td>
        <td><%=person.getMiddlename()%></td>
        <td>
            <%
                if (!person.getPhones().isEmpty()) {
                    for(String phone : person.getPhones().values())
                    {
            %>
            <%=phone%>
            <%
                    }
                }
            %>
        </td>
        <td><a href="<%=request.getContextPath()%>/?action=edit&id=<%=person.getId()%>">Редактировать</a></td>
        <td><a href="<%=request.getContextPath()%>/?action=delete&id=<%=person.getId()%>">Удалить</a></td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
