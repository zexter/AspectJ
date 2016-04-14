package com.Service;

import com.Data.RiderDetailsDAO;
import com.Entity.RiderDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Chatumini on 2015-09-17.
 */
@WebServlet(name = "UpdateRider",urlPatterns = "/Dashboard/UpdateRider")
public class UpdateRider extends HttpServlet {

    static Properties myProperties;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String message = "";
        String stat = "";
        RiderDetails riderDetails = new RiderDetails();

        //checking of name contains only alphabetic characters and spaces
        if (request.getParameter("name").toString().matches("[a-zA-Z\\s]+")) {
            riderDetails.setRiderID(Integer.parseInt(request.getParameter("id")));
            riderDetails.setFullName(request.getParameter("name"));
            riderDetails.setSex(Integer.parseInt(request.getParameter("optionGender")));
            riderDetails.setDOB(request.getParameter("birthdate"));
            riderDetails.setDateOfJoin(request.getParameter("joindate"));
            riderDetails.setNic(request.getParameter("nic"));
            riderDetails.setMobileNo(request.getParameter("tele1"));
            riderDetails.setAddress(request.getParameter("address"));
            riderDetails.setBikeNumber(request.getParameter("bikeno"));
            riderDetails.setBikeModel(request.getParameter("bikemodel"));
            riderDetails.setKmPerLetr(Double.parseDouble(request.getParameter("kmpl")));
            riderDetails.setMarStatus(Integer.parseInt(request.getParameter("optionMarital")));
            if (new RiderDetailsDAO().UpdateRiderDetails(riderDetails)) {
                stat = "success";
                message = "Successfully Updated!";
            } else {
                stat = "error";
                message = "Failed to add! Name/NIC are duplicate";

            }
        } else {
            stat = "error";
            message = "Enter a real name!";
        }

        String success = "<script>$.notify(\"" + message + "\", \""+stat+"\");</script>";
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(success);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
