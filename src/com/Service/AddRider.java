package com.Service;

import com.Controller.ExceptionInvalidName;
import com.Data.RiderDetailsDAO;
import com.Entity.RiderDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Chatumini on 2016-04-10.
 */
@WebServlet(name = "/AddRider", urlPatterns = "/Dashboard/AddRider")
public class AddRider extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        String stat = "";
        try {
            RiderDetails riderDetails = setParametersToObject(request);

            if (new RiderDetailsDAO().addRider(riderDetails)) {
                stat = "success";
                message = "Successfully Added!";
            } else {
                stat = "error";
                message = "Failed to add! Name/NIC are duplicate";

            }

        } catch (ExceptionInvalidName exceptionInvalidName) {

            stat = "error";
            message = "Enter a real name!";
        }

        String success = "<script>$.notify(\"" + message + "\", \"" + stat + "\");</script>";
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(success);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public RiderDetails setParametersToObject(HttpServletRequest request) throws ExceptionInvalidName {
        RiderDetails riderDetails = new RiderDetails();
        if (request.getParameter("name").toString().matches("[a-zA-Z]+")) {

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
        } else {
            throw new ExceptionInvalidName("name cannot be real");


        }
        return riderDetails;
    }

    /*public void writeToJSP(String message,String stat,HttpServletResponse response)throws IOException{
        String success = "<script>$.notify(\"" + message + "\", \""+stat+"\");</script>";
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(success);

    }*/
}
