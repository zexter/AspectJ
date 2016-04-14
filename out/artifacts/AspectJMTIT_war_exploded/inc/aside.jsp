<%--
  Created by IntelliJ IDEA.
  User: steph_000
  Date: 25/11/2014
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = "";
    if (session.getAttribute("username") != null) {
        username = session.getAttribute("username").toString().toUpperCase();

    } else {
        //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        // rd.forward(request,response);

    }

%>

<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="img/avatar3.png" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>Hello, <%=username%>
                </p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i
                                        class="fa fa-search"></i></button>
                            </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="active">
                <a href="index.jsp">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>
            </ul>



                <ul class="treeview-menu">
                    <li><a href="../RiderDetails.jsp"><i class="fa fa-angle-double-right"></i>Add Rider </a>
                    </li>
                    <li><a href="../Riders.jsp"><i class="fa fa-angle-double-right"></i>View Riders</a>
                    </li>

                </ul>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
