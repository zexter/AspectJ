/**
 * Created by Stephano on 28/04/2015.
 */
var customer = $("#newCustomer");
$("[data-mask]").inputmask();
$(".js-example-basic-single").select2();
$("#product").attr("onchange","getUnitPrice(this)");
$(document).ready(function () {

    var form = $('#order');
    var data;
    var tdata = [];
    var ID = 0;
    [];
    $("#Number").blur(function () {
        if ($(this).val().length == 10 && $(this).val() >= 112000000) {
            getCustomerDetails($("#Number").val());
        } else {
            $.notify("Invalid Number", "error");
        }

    });

    $("#selectPro").dblclick(function () {
        $(this).addClass('hidden');
        $('#CusPro').removeClass('hidden').addClass('form-control');
        customProduct = true;
    });

    $("#CusPro").dblclick(function () {
        $(this).removeClass('form-control').addClass('hidden');
        $('#selectPro').removeClass('hidden');
        customProduct = false;
    });


    form.submit(function (event) {
        tdata = [];
        var table = $('#prolist');
        table.find('tr').each(function (rowIndex, r) {
            var cols = [];
            $(this).find('td').each(
                function
                    (colIndex, c) {
                    cols.push(c.textContent);
                });
            cols.pop();
            tdata.push(cols);
        });
        tdata.shift();
        data = $(this).serializeArray();
var locationid = $("#Area").find('option:selected').attr('id');
        $.ajax({
            type: "POST",
            url: "/Dashboard/order",
            data: 'tabledata=' + tdata + '&' + form.serialize()+'&locationid='+locationid,
            success: function (response) {
                $('#results').append(" " + new XMLSerializer().serializeToString(response.documentElement));
                data = '';
                tdata = [];
            },
            error: function (e) {
                $('#results').html("" + e);
            }
        });
        data = '';
        tdata = [];

        return false;
    });




    getUnitPrice($("#product"));

    function rowInTable() {
        var id = $("#product").find('option:selected').attr('id');
        if ($('#prolist').find('#' + id).length) {

            return true;
        } else {
            return false;
        }

    }

    function addRow() {
        var id = 'null';
        var ProductName = $("#product").val();
        if (customProduct) {
            ProductName = $("#CusPro").val();
            id = null;
        } else {
            id = $("#product").find('option:selected').attr('id');
        }
        var Quantity = $("#Quantity").val();
        var UnitPrice = $("#UnitPrice").val();
        var PickUp = $("#PickUp").val();

        if (!rowInTable() || customProduct) {
            if ((Quantity > 0 && UnitPrice > 0)) {
                var cost = Quantity * UnitPrice;

                var html =
                    '<tr id="' + id + '">' +
                    '<td>' + Quantity + '</td>' +
                    '<td class="hidden">' + id + '</td>' +
                    '<td>' + ProductName + '</td>' +
                    '<td>' + UnitPrice + '</td>' +
                    '<td>' + PickUp + '</td>' +
                    '<td> ' + cost + ' </td>' + '<td> <input type="button" class="BtnMinus" value="-" class="btn btn-danger" /></td>' +
                    '</tr>';
                $(html).appendTo($("#prolist"));
                ID++;
            } else {
                alert("Please Enter Valid Quantity and Unit Price First");
            }
        } else {
            alert("Product already Added");
        }
    }

    $("#btnAdd").click(function () {
        addRow();
calcSubTotal();
    });
function calcSubTotal(){
    var tot = 0;
    $('#prolist tbody tr td:nth-child(6)').each(function () {
        //add item to array
        tot = tot + parseInt($(this).text());

    });
    $("#SubTotal").val(tot);
}
    function deleteRow() {
        var par = $(this).parent().parent();
        par.remove();
        calcSubTotal();
    }

    $("#prolist").on("click", ".BtnMinus", deleteRow);
});

function getCustomerDetails(number) {
    $.ajax({
        type: "POST",
        url: "/Dashboard/CustomerInfo",
        data: 'cusNum=' + number,
        success: function (response) {
            $('#results').append(response);
        },
        error: function (e) {
            $('#results').html("" + e);
        }
    });


}

$("#teleGo").click(function (event) {
        getCustomerDetails($("#Number").val());
    }
);
function SetProductValues(UnitPrice) {
    $("#UnitPrice").val(UnitPrice);
}
function setDetailsToGo(name,email,address){
    $("#Name").val('');
    $("#Email").val('');
    $("#Address").val('');
    customer.val("true");

    if(name!='null'){$("#Name").val(name);
        customer.val("false");
    }

    if(email!='null'){ $("#Email").val(email);}
    if(address!='null'){$("#Address").val(address);
        customer.val("false");
    }
    return false;
}
function travTable() {
    function getTableData(table) {
        var data = [];
        table.find('tr').each(function (rowIndex, r) {
            var cols = [];
            $(this).find('td').each(
                function
                    (colIndex, c) {
                    cols.push(c.textContent);
                });
            data.push(cols);
        });
        console.log(data);
        return data;
    }

    function UpdateOrders() {
        $.ajax({
            type: "POST",
            url: "/Dashboard/order",
            data: form.
                serialize(),
            success: function (response) {
                $('#results').append(" " + new XMLSerializer().serializeToString(response.documentElement));
            },
            error: function (e) {
                $('#results').html("" + e);
            }
        });

        return false;
    }

    //Auto refresh

    //   setInterval(function(){UpdateOrders()}, 45000);
}
function getUnitPrice(ProID) {
    var id = $(ProID).find('option:selected').attr('id');
    $.ajax({
        type: "POST",
        url: "/Dashboard/ProductDetails",
        data: 'proid=' + id,
        success: function (response) {
            $('#results').append(" " + new XMLSerializer().serializeToString(response.documentElement));
            data = '';
            tdata = [];
        },
        error: function (e) {
            $('#results').html("" + e);
            data = '';
            tdata = [];
        }
    });
    data = '';
    tdata = [];
    return false;

}