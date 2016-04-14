package com.Controller;

import java.sql.SQLException;

/**
 * Created by Chathumini on 4/4/2016.
 */
public class ExceptionInvalidName extends Exception {

    private static final long serialVersionUID = 1L;
    public ExceptionInvalidName(String message) {

       super(message);
    }
}
