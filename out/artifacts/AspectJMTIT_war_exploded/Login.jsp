<%--
  Created by IntelliJ IDEA.
  User: Zexter

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="bg-black">
<head>
    <meta charset="UTF-8">
    <title>Quickee Dashboard | Log in</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- font Awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="/css/AdminLTE.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>


<body class="bg-black">

<div class="form-box" id="login-box">
    <div class="header">Sign In</div>
    <form action="/Dashboard/AdminLogin" method="post">
        <div class="body bg-gray">
            <div class="form-group">
                <input type="text" name="userid" class="form-control" placeholder="User ID" required="required"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="Password" required="required"/>
            </div>
            <div class="form-group">
                <%--<input type="checkbox" name="remember_me"/> Remember me--%>
            </div>
        </div>
        <div class="footer">
            <button type="submit" class="btn bg-purple btn-block">Sign me in</button>

            <p><a href="ResetPassword.jsp">I forgot my password</a></p>

            <%-- <a href="register.html" class="text-center">Register a new membership</a>--%>
        </div>
    </form>


</div>


<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js" type="text/javascript"></script>

<script src="/js/notify.min.js" type="text/javascript"></script>
<%
    if (request.getParameter("reset") != null) {
        String reset = request.getParameter("reset");

        if (reset.equalsIgnoreCase("FAILED")) {
%>
<script>$.notify("Password Reset Failed ", "error");</script>
<%
} else if (reset.equalsIgnoreCase("success")) {
%>
<script>$.notify("Your Password Reset was Successful ", "success");</script>
<%
    }
} else if (request.getParameter("resetmail") != null) {
    if (request.getParameter("resetmail").equalsIgnoreCase("true")) {

%>
<script>$.notify("Password Reset Link Sent", "success");</script>
<%
        }
    } else if (session.getAttribute("username") != null) {
        response.sendRedirect("/index.jsp");
        return;
    }

%>


</body>
</html>
