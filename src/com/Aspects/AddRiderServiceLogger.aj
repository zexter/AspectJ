package com.Aspects;

import com.Data.RiderDetailsDAO;
import com.Entity.RiderDetails;
import com.Service.AddRider;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Contains AOP logging aspect advices for the methods in class AddRider in Service package.
 * Created by Chathumini on 3/29/2016.
 * Version 1.0
 */
public aspect AddRiderServiceLogger {

    static Logger logger = Logger.getLogger(AddRider.class);
    before(HttpServletRequest request):
            call(RiderDetails AddRider.setParametersToObject(HttpServletRequest))&& args(request){
        logger.info("Before setParametersToObject method in AddRider service was called");
    }

    after(HttpServletRequest request,HttpServletResponse response):
            execution(* AddRider.doPost(HttpServletRequest,HttpServletResponse))&& args(request,response){
        logger.info("After DoPost method in AddRider service was called");
    }
    after() throwing(Exception ex):execution(* AddRider.setParametersToObject(..)) {
        logger.error("Exception name contains numbers and special characteristics. "+ex);
    }





}



