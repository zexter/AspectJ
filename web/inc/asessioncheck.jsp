<%--
  Created by IntelliJ IDEA.
  User: Zexter
  Date: 08/02/2015
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username = "";
    if (session.getAttribute("username") != null) {
        username = session.getAttribute("username").toString();
    } else {
        response.sendRedirect("/");
        //return;
    }

%>