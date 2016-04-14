package com.Controller;

/**
 * Created by Chathumini on 4/13/2016.
 */
public class ExceptionInvalidPassword extends Exception {
    private static final long serialVersionUID = 1L;
    public ExceptionInvalidPassword(String message) {

        super(message);
    }
}
