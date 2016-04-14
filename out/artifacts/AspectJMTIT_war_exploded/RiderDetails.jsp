<%--
  Created by IntelliJ IDEA.
  User: Chathumini
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
    <!-- select 2-->
    <link href="css/select2.min.css" rel="stylesheet" type="text/css"/>
    <!-- zebra calender -->
    <link rel="stylesheet" href="css/default.css" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

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
                <li><a href="/Dashboard/index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Rider Management</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div id="results"></div>
            <div class="row">
                <div class="col-md-12">
                    <!-- Custom Tabs -->

                    <div class="panel box box-primary">
                        <div class="box-header">
                            <h4 class="box-title">
                                <a >
                                    Add Rider
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" >
                            <div class="box-body">
                                <div class="row">
                                    <div class="box box-primary">

                                        <form role="form" method="post" action="/Dashboard/AddRider" name="addrider" id ="addrider">
                                            <div class="col-lg-12">
                                                <div class="col-lg-6">
                                                    <label for="name">Name</label>
                                                    <input type="text" class="form-control fa-asterisk" id="name" name="name" required="required">
                                                    <label for="optionFemale">Gender</label>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="optionGender" id="optionFemale" value="1"
                                                                   checked>
                                                            Female
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="optionGender" id="optionMale"
                                                                   value="2">
                                                            Male
                                                        </label>
                                                    </div>
                                                    <label for="birthdate">Date of Birth</label>
                                                    <input type="text" class="form-control fa-asterisk datepicker" id="birthdate" name="birthdate" value="2015-09-18" required/>

                                                    <label for="nic">NIC</label>
                                                    <input type="text" class="form-control" id="nic" name="nic"
                                                           pattern="^\d[0-9]{8}[xXvV]$" title="Enter your 9 digits and V or X" required />

                                                    <label for="joindate">Date Joined</label>
                                                    <input type="text" class="form-control fa-asterisk datepicker" id="joindate" name="joindate" value="2015-09-18" required/>

                                                    <label for="optionMarried">Marital Status</label>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="optionMarital" id="optionMarried" value="1"
                                                                   checked>
                                                            Married
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="optionMarital" id="optionSingle"
                                                                   value="2">
                                                            Single
                                                        </label>
                                                    </div>
                                                    <label for="tele1"> Telephone Number</label>
                                                    <input type="text" class="form-control" id="tele1" name="tele1" value=""
                                                           pattern="^\d{3}\d{3}\d{4}$" title="Enter your 10 digit number"
                                                           required>
                                                    <label for="address"> Address</label>
                                                    <textarea class="form-control" id="address" name="address" rows="3"  required></textarea>
                                                    <label for="bikeno"> Bike Number</label>
                                                    <input type="text" class="form-control" id="bikeno" name="bikeno"
                                                           required />
                                                    <label for="bikemodel"> Bike Model</label>
                                                    <input type="text" class="form-control" id="bikemodel" name="bikemodel"
                                                           required />

                                                    <label for="kmpl">Kilometer per Liter</label>
                                                    <input type="text" class="form-control " id="kmpl" name="kmpl" pattern="^\d+(\.\d{1,2})?$" title="Only 2 decimal places" required="required">


                                                    <br>

                                                    <input type="submit" class="btn btn-primary" value="  Add  ">
                                                    <input type="reset" class="btn btn-danger" value=" Reset ">

                                                </div>



                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>





                </div>
            </div>




        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>
<!-- ./wrapper -->


<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- zebra_datepicker-->
<script type="text/javascript" src="/js/plugins/zebra_datepicker.js"></script>
<!-- select 2-->
<script src="/js/select2.min.js" type="text/javascript"></script>
<!--moment -->
<script src="/js/moment.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/js/AdminLTE/app.js" type="text/javascript"></script>

<!-- notify -->
<script src="/js/notify.min.js" type="text/javascript"></script>


<script type="text/javascript">

    $( document ).ready(function() {

        $(".js-example-basic-single").select2();
        var currentDate = new Date();
        var endDate = new Date();
        var startDate = new Date();
        endDate.setTime(currentDate.getTime() - (18 * 365 * 24 * 60 * 60 * 1000));
        startDate.setTime(currentDate.getTime() - (65 * 365 * 24 * 60 * 60 * 1000));
        var mdate=moment(endDate);
        mdate= mdate.format("YYYY-MM-DD");
        var mdate1=moment(startDate);
        mdate1= mdate1.format("YYYY-MM-DD");

        $('#birthdate').Zebra_DatePicker({

            // readonly_element : false,
            direction : [mdate1,mdate]

        });
        $('#joindate').Zebra_DatePicker({

            direction : false


        });

    });


    var formdel1 = $('#addrider');


    formdel1.submit(function (event) {

        event.preventDefault();
        // if(validatenic()) {
        $.ajax({
            type: "POST",
            url: "/Dashboard/AddRider",
            data: formdel1.serialize(),
            success: function (response) {
                $('#results').append(" " + new XMLSerializer().serializeToString(response.documentElement));

            },
            error: function (e) {
                $('#results').html("" + e);
            }
        });
        //  }
        return false;
    });









</script>





</body>
</html>
