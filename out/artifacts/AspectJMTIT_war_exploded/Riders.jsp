
<%@ page import="com.Data.RiderDetailsDAO" %>
<%@ page import="com.Entity.RiderDetails" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Stephano
  Date: 27/04/2015
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CupcakeDelivery | Dashboard</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <!-- bootstrap 3.0.2 -->
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <!-- font Awesome -->
  <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <!-- Ionicons -->
  <link href="css/ionicons.min.css" rel="stylesheet" type="text/css"/>
  <!-- Theme style -->
  <link href="css/AdminLTE.css" rel="stylesheet" type="text/css"/>
  <link href="css/select2.min.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="css/default.css" type="text/css">
  <link rel="stylesheet" href="css/default.css" type="text/css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
</head>

<%
  RiderDetailsDAO riderDetailsDAO = new RiderDetailsDAO();
  ArrayList<RiderDetails> riderlist = riderDetailsDAO.getListOfRiders();

%>
<body class="pace-done skin-black fixed ">
<!-- header logo: style can be found in header.less -->

<jsp:include page="inc/head.jsp"></jsp:include>

<div class="wrapper row-offcanvas row-offcanvas-left">
  <!-- Left side column. contains the logo and sidebar -->


  <jsp:include page="inc/aside.jsp"></jsp:include>


  <!-- Right side column. Contains the navbar and content of the page -->
  <aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Rider Management

      </h1>
      <ol class="breadcrumb">
        <li><a href="/index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Rider Management</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="row">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Riders</h3>
        </div>
        <div class="box-body table-responsive">
          <table id="ridert" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th class="hidden"></th>
              <th>Name</th>
              <th>Date joined</th>
              <th>Address</th>
              <th>Phone number</th>
              <th>Bike number</th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%for (RiderDetails riders : riderlist){


            %>
            <tr >
              <td class="hidden"><%=riders.getRiderID()%></td>
              <td class="ridername"><%=riders.getFullName()%></td>
              <td class="dj"><%=riders.getDateOfJoin()%></td>
              <td class="add"><%=riders.getAddress()%></td>
              <td class="phone"><%=riders.getMobileNo()%></td>
              <td class="bikeno"><%=riders.getBikeNumber()%></td>
              <td class="pAct"><input type="submit" class="btn btn-primary" value="Edit" onclick="location.href = '/EditRider.jsp?id=<%=riders.getRiderID() %>'">
              </td>


            </tr>


            <%


              }%>



            </tbody>
            <tfoot>
            <tr>
              <th class="hidden"></th>
              <th>Name</th>
              <th>Date joined</th>
              <th>Address</th>
              <th>Phone number</th>
              <th>Bike number</th>
              <th>Action</th>

            </tr>
            </tfoot>
          </table>
        </div>
        <!-- /.box-body -->
      </div>
    </div>

    <!-- /.content -->
      </section>
  </aside>
  <!-- /.right-side -->
</div>
<!-- ./wrapper -->


<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="/js/plugins/zebra_datepicker.js"></script>
<script src="/js/select2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugins/zebra_datepicker.js"></script>
<script src="/js/moment.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/js/AdminLTE/app.js" type="text/javascript"></script>


<script src="/js/notify.min.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
<script src="/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>

<script type="text/javascript">
  $("#ridert").dataTable();

  $( document ).ready(function() {

    $(".js-example-basic-single").select2();


    $('#ddate').Zebra_DatePicker({

      // readonly_element : false,
      direction : false


    });


  });






</script>





</body>
</html>
