package com.Aspects;

import com.Controller.ExceptionInvalidPassword;
import com.Data.RiderDetailsDAO;
import com.Entity.RiderDetails;
import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.sql.SQLException;

/**
 * Contains AOP logging aspect advices for the methods in class RiderDetailsDAO in Data package.
 * Created by Chathumini on 3/29/2016.
 * Version 1.0
 */
public aspect RiderDAOLogger {

    static Logger logger = Logger.getLogger(RiderDetailsDAO.class);
/**
 *
 */
    before(RiderDetails riderDetails):
            execution(boolean RiderDetailsDAO.addRider(RiderDetails))&& args(riderDetails){
        logger.info("Before Rider add method was called"+riderDetails.getFullName());
    }

    after(RiderDetails riderDetails):
            execution(boolean RiderDetailsDAO.addRider(RiderDetails))&& args(riderDetails){
        logger.info("After Rider add method was called");
    }

    /*after() throwing(Exception ex):
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxx
    }*/



    after() throwing (Exception ex) :
        call ( * *.*(..)) {
    logger.error("An exception was called "+ex);
}
    before():
            execution(ArrayList<RiderDetails> RiderDetailsDAO.getListOfRiders()){
        logger.info("Before get list of riders was called");
    }

    after():
            execution(ArrayList<RiderDetails> RiderDetailsDAO.getListOfRiders()){
        logger.info("After get list of riders was called");
    }

    before(String riderID):
            execution(RiderDetails RiderDetailsDAO.getRiderDetails(String))&& args(riderID){
        logger.info("Before get selected rider details was called");
    }

    after(String riderID):
            execution(RiderDetails RiderDetailsDAO.getRiderDetails(String))&& args(riderID){
        logger.info("After selected rider details was called");
    }

    before(RiderDetails riderDetails):
            call(boolean RiderDetailsDAO.UpdateRiderDetails(RiderDetails))&& args(riderDetails){
        logger.info("Before Rider update method was called");
    }

    after(RiderDetails riderDetails):
            call(boolean RiderDetailsDAO.UpdateRiderDetails(RiderDetails))&& args(riderDetails){
        logger.info("After Rider update method was called");
    }



}



