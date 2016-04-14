package com.Aspects;

import com.Controller.ExceptionInvalidPassword;
import com.Data.AdminLoginDAO;
import com.Data.RiderDetailsDAO;
import com.Entity.RiderDetails;
import com.Entity.User;
import org.apache.log4j.Logger;

/**
 * Contains AOP logging aspect advices for the methods in class AdminLoginDAO in Data package.
 * Created by Chathumini on 3/29/2016.
 * Version 1.0
 */
public aspect AdminLoginDAOLogger {

    static Logger logger = Logger.getLogger(AdminLoginDAO.class);

    before(User user):
            call(int AdminLoginDAO.authLogin(User))&& args(user){
        logger.info("Before authenticate user method was called");
    }

    after(User user):
            call(int AdminLoginDAO.authLogin(User))&& args(user){
        logger.info("Before authenticate user method was called");
    }



    }



